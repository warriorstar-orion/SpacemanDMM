//! The DM abstract syntax tree.
//!
//! Most AST types can be pretty-printed using the `Display` trait.
use std::fmt;
use std::iter::FromIterator;
use phf::phf_map;

use linked_hash_map::LinkedHashMap;

use crate::error::Location;

use ast_proto_rust::ast::Block as BlockProto;
use ast_proto_rust::ast::DoWhile as DoWhileProto;
use ast_proto_rust::ast::ForLoop as ForLoopProto;
use ast_proto_rust::ast::ForRange as ForRangeProto;
use ast_proto_rust::ast::If as IfProto;
use ast_proto_rust::ast::IfArm as IfArmProto;
use ast_proto_rust::ast::Parameter as ParameterProto;
use ast_proto_rust::ast::ProcDeclKind as ProcDeclKindProto;
use ast_proto_rust::ast::SettingMode as SettingModeProto;
use ast_proto_rust::ast::Statement as StatementProto;
use ast_proto_rust::ast::SwitchCase as SwitchCaseProto;
use ast_proto_rust::ast::SwitchCases as SwitchCasesProto;
use ast_proto_rust::ast::TreePath as TreePathProto;
use ast_proto_rust::ast::VarStatement as VarStatementProto;
use ast_proto_rust::ast::VarType as VarTypeProto;
use ast_proto_rust::ast::While as WhileProto;
use ast_proto_rust::ast::AssignOp as AssignOpProto;
use ast_proto_rust::ast::BinaryOp as BinaryOpProto;
use ast_proto_rust::ast::PathOp as PathOpProto;
use ast_proto_rust::ast::UnaryOp as UnaryOpProto;
use ast_proto_rust::ast::AssignOpExpression as AssignOpExpressionProto;
use ast_proto_rust::ast::BaseExpression as BaseExpressionProto;
use ast_proto_rust::ast::BinaryOpExpression as BinaryOpExpressionProto;
use ast_proto_rust::ast::InputTypeKey as InputTypeKeyProtoEnum;
use ast_proto_rust::ast::Expression as ExpressionProto;
use ast_proto_rust::ast::Field as FieldProto;
use ast_proto_rust::ast::Follow as FollowProto;
use ast_proto_rust::ast::FollowCall as FollowCallProto;
use ast_proto_rust::ast::IndexKind as IndexKindProto;
use ast_proto_rust::ast::IndexOrField as IndexOrFieldProto;
use ast_proto_rust::ast::InputType as InputTypeProto;
use ast_proto_rust::ast::InterpString as InterpStringProto;
use ast_proto_rust::ast::InterpStringCollection as InterpStringCollectionProto;
use ast_proto_rust::ast::New as NewProto;
use ast_proto_rust::ast::NewType as NewTypeProto;
use ast_proto_rust::ast::ParentCall as ParentCallProto;
use ast_proto_rust::ast::PickPair as PickPairProto;
use ast_proto_rust::ast::Prefab as PrefabProto;
use ast_proto_rust::ast::SelfCall as SelfCallProto;
use ast_proto_rust::ast::Term as TermProto;
use ast_proto_rust::ast::TermCall as TermCallProto;
use ast_proto_rust::ast::TernaryOpExpression as TernaryOpExpressionProto;
use ast_proto_rust::ast::TypePath as TypePathProto;

#[derive(Copy, Clone, Eq, Debug)]
pub struct Spanned<T> {
    // TODO: add a Span type and use it here
    pub location: Location,
    pub elem: T,
}

impl<T: PartialEq> PartialEq for Spanned<T> {
    fn eq(&self, other: &Self) -> bool {
        // Skips the location: allows easy recursive Eq checks
        self.elem == other.elem
    }
}

impl<T> Spanned<T> {
    pub fn new(location: Location, elem: T) -> Spanned<T> {
        Spanned { location, elem }
    }
}

/// The unary operators, both prefix and postfix.
#[derive(Copy, Clone, PartialEq, Eq, Debug)]
pub enum UnaryOp {
    Neg,
    Not,
    BitNot,
    PreIncr,
    PostIncr,
    PreDecr,
    PostDecr,
}

impl UnaryOp {
    /// Prepare to display this unary operator around (to the left or right of)
    /// its operand.
    pub fn around<'a, T: fmt::Display + ?Sized>(self, expr: &'a T) -> impl fmt::Display + 'a {
        Around { op: self, expr }
    }

    /// Get a human-readable name for this unary operator. May be ambiguous.
    pub fn name(self) -> &'static str {
        use self::UnaryOp::*;
        match self {
            Neg => "-",
            Not => "!",
            BitNot => "~",
            PreIncr | PostIncr => "++",
            PreDecr | PostDecr => "--",
        }
    }

    pub fn get_proto_representation(self) -> UnaryOpProto {
        use self::UnaryOp::*;
        match self {
            Neg => UnaryOpProto::UNARYOP_NEG,
            Not => UnaryOpProto::UNARYOP_NOT,
            BitNot => UnaryOpProto::UNARYOP_BIT_NOT,
            PreIncr => UnaryOpProto::UNARYOP_PRE_INCR,
            PostIncr =>  UnaryOpProto::UNARYOP_POST_INCR,
            PreDecr => UnaryOpProto::UNARYOP_PRE_DECR,
            PostDecr => UnaryOpProto::UNARYOP_POST_DECR,
        }
    }
}

/// A formatting wrapper created by `UnaryOp::around`.
struct Around<'a, T: 'a + ?Sized> {
    op: UnaryOp,
    expr: &'a T,
}

impl<'a, T: fmt::Display + ?Sized> fmt::Display for Around<'a, T> {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        use self::UnaryOp::*;
        match self.op {
            Neg => write!(f, "-{}", self.expr),
            Not => write!(f, "!{}", self.expr),
            BitNot => write!(f, "~{}", self.expr),
            PreIncr => write!(f, "++{}", self.expr),
            PostIncr => write!(f, "{}++", self.expr),
            PreDecr => write!(f, "--{}", self.expr),
            PostDecr => write!(f, "{}--", self.expr),
        }
    }
}

pub type Ident = String;

/// The DM path operators.
///
/// Which path operator is used typically only matters at the start of a path.
#[derive(Copy, Clone, Hash, PartialEq, Eq, Debug)]
pub enum PathOp {
    /// `/` for absolute pathing.
    Slash,
    /// `.` for checked relative pathing.
    Dot,
    /// `:` for unchecked relative pathing.
    Colon,
}

impl PathOp {
    pub fn name(self) -> &'static str {
        match self {
            PathOp::Slash => "/",
            PathOp::Dot => ".",
            PathOp::Colon => ":",
        }
    }

    pub fn get_proto_representation(self) -> PathOpProto {
        match self {
            PathOp::Slash => PathOpProto::PATHOP_SLASH,
            PathOp::Dot => PathOpProto::PATHOP_DOT,
            PathOp::Colon => PathOpProto::PATHOP_COLON,
        }
    }
}

impl fmt::Display for PathOp {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        f.write_str(self.name())
    }
}

/// A (typically absolute) tree path where the path operator is irrelevant.
pub type TreePath = Vec<Ident>;

pub struct FormatTreePath<'a>(pub &'a [Ident]);

impl<'a> fmt::Display for FormatTreePath<'a> {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        for each in self.0.iter() {
            write!(f, "/{}", each)?;
        }
        Ok(())
    }
}

/// A series of identifiers separated by path operators.
pub type TypePath = Vec<(PathOp, Ident)>;

pub struct FormatTypePath<'a>(pub &'a [(PathOp, Ident)]);

impl<'a> fmt::Display for FormatTypePath<'a> {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        for each in self.0.iter() {
            write!(f, "{}{}", each.0, each.1)?;
        }
        Ok(())
    }
}

/// The binary operators.
#[derive(Copy, Clone, PartialEq, Eq, Debug)]
pub enum BinaryOp {
    Add,
    Sub,
    Mul,
    Div,
    Pow,
    Mod,
    Eq,
    NotEq,
    Less,
    Greater,
    LessEq,
    GreaterEq,
    Equiv,
    NotEquiv,
    BitAnd,
    BitXor,
    BitOr,
    LShift,
    RShift,
    And,
    Or,
    In,
    To,  // only appears in RHS of `In`
}

impl BinaryOp {
    pub fn get_proto_representation(self) -> BinaryOpProto {
       return match self {

    BinaryOp::Add => BinaryOpProto::BINARYOP_ADD,
    BinaryOp::Sub => BinaryOpProto::BINARYOP_SUB,
    BinaryOp::Mul => BinaryOpProto::BINARYOP_MUL,
    BinaryOp::Div => BinaryOpProto::BINARYOP_DIV,
    BinaryOp::Pow => BinaryOpProto::BINARYOP_POW,
    BinaryOp::Mod => BinaryOpProto::BINARYOP_MOD,
    BinaryOp::Eq => BinaryOpProto::BINARYOP_EQ,
    BinaryOp::NotEq => BinaryOpProto::BINARYOP_NOTEQ,
    BinaryOp::Less => BinaryOpProto::BINARYOP_LESS,
    BinaryOp::Greater => BinaryOpProto::BINARYOP_GREATER,
    BinaryOp::LessEq => BinaryOpProto::BINARYOP_LESSEQ,
    BinaryOp::GreaterEq => BinaryOpProto::BINARYOP_GREATEREQ,
    BinaryOp::Equiv => BinaryOpProto::BINARYOP_EQUIV,
    BinaryOp::NotEquiv => BinaryOpProto::BINARYOP_NOTEQUIV,
    BinaryOp::BitAnd => BinaryOpProto::BINARYOP_BITAND,
    BinaryOp::BitXor => BinaryOpProto::BINARYOP_BITXOR,
    BinaryOp::BitOr => BinaryOpProto::BINARYOP_BITOR,
    BinaryOp::LShift => BinaryOpProto::BINARYOP_LSHIFT,
    BinaryOp::RShift => BinaryOpProto::BINARYOP_RSHIFT,
    BinaryOp::And => BinaryOpProto::BINARYOP_AND,
    BinaryOp::Or => BinaryOpProto::BINARYOP_OR,
    BinaryOp::In => BinaryOpProto::BINARYOP_IN,
    BinaryOp::To => BinaryOpProto::BINARYOP_TO,

        }
    }
}

impl fmt::Display for BinaryOp {
    fn fmt(&self, fmt: &mut fmt::Formatter) -> fmt::Result {
        use self::BinaryOp::*;
        fmt.write_str(match *self {
            Add => "+",
            Sub => "-",
            Mul => "*",
            Div => "/",
            Pow => "**",
            Mod => "%",
            Eq => "==",
            NotEq => "!=",
            Less => "<",
            Greater => ">",
            LessEq => "<=",
            GreaterEq => ">=",
            Equiv => "~=",
            NotEquiv => "~!",
            BitAnd => "&",
            BitXor => "^",
            BitOr => "|",
            LShift => "<<",
            RShift => ">>",
            And => "&&",
            Or => "||",
            In => "in",
            To => "to",
        })
    }
}

/// The assignment operators, including augmented assignment.
#[derive(Copy, Clone, PartialEq, Eq, Debug)]
pub enum AssignOp {
    Assign,
    AddAssign,
    SubAssign,
    MulAssign,
    DivAssign,
    ModAssign,
    AssignInto,
    BitAndAssign,
    AndAssign,
    BitOrAssign,
    OrAssign,
    BitXorAssign,
    LShiftAssign,
    RShiftAssign,
}

impl AssignOp {
    pub fn get_proto_representation(self) -> AssignOpProto {
        return match self {
    AssignOp::Assign => AssignOpProto::ASSIGNOP_ASSIGN,
    AssignOp::AddAssign => AssignOpProto::ASSIGNOP_ADD_ASSIGN,
    AssignOp::SubAssign => AssignOpProto::ASSIGNOP_SUB_ASSIGN,
    AssignOp::MulAssign => AssignOpProto::ASSIGNOP_MUL_ASSIGN,
    AssignOp::DivAssign => AssignOpProto::ASSIGNOP_DIV_ASSIGN,
    AssignOp::ModAssign => AssignOpProto::ASSIGNOP_MOD_ASSIGN,
    AssignOp::BitAndAssign => AssignOpProto::ASSIGNOP_BIT_AND_ASSIGN,
    AssignOp::BitOrAssign => AssignOpProto::ASSIGNOP_BIT_OR_ASSIGN,
    AssignOp::BitXorAssign => AssignOpProto::ASSIGNOP_BIT_XOR_ASSIGN,
    AssignOp::LShiftAssign => AssignOpProto::ASSIGNOP_L_SHIFT_ASSIGN,
    AssignOp::RShiftAssign => AssignOpProto::ASSIGNOP_R_SHIFT_ASSIGN,
    AssignOp::AssignInto => AssignOpProto::ASSIGNOP_ASSIGN_INTO,
    AssignOp::AndAssign => AssignOpProto::ASSIGNOP_AND_ASSIGN,
    AssignOp::OrAssign => AssignOpProto::ASSIGNOP_OR_ASSIGN,
        }
    }
}

impl fmt::Display for AssignOp {
    fn fmt(&self, fmt: &mut fmt::Formatter) -> fmt::Result {
        use self::AssignOp::*;
        fmt.write_str(match *self {
            Assign => "=",
            AddAssign => "+=",
            SubAssign => "-=",
            MulAssign => "*=",
            DivAssign => "/=",
            ModAssign => "%=",
            AssignInto => ":=",
            BitAndAssign => "&=",
            AndAssign => "&&=",
            BitXorAssign => "^=",
            BitOrAssign => "|=",
            OrAssign => "||=",
            LShiftAssign => "<<=",
            RShiftAssign => ">>=",
        })
    }
}

/// The ternary operator, represented uniformly for convenience.
#[derive(Copy, Clone, PartialEq, Eq, Debug)]
pub enum TernaryOp {
    Conditional,
}

macro_rules! augmented {
    ($($bin:ident = $aug:ident;)*) => {
        impl BinaryOp {
            /// Get the corresponding augmented assignment operator, if available.
            pub fn assign_op(self) -> Option<AssignOp> {
                match self {
                    $(BinaryOp::$bin => Some(AssignOp::$aug),)*
                    _ => None,
                }
            }
        }

        impl AssignOp {
            /// Get the corresponding binary operator, if available.
            pub fn binary_op(self) -> Option<BinaryOp> {
                match self {
                    $(AssignOp::$aug => Some(BinaryOp::$bin),)*
                    _ => None,
                }
            }
        }
    }
}
augmented! {
    Add = AddAssign;
    Sub = SubAssign;
    Mul = MulAssign;
    Div = DivAssign;
    BitAnd = BitAndAssign;
    BitOr = BitOrAssign;
    BitXor = BitXorAssign;
    LShift = LShiftAssign;
    RShift = RShiftAssign;
}

/// A typepath optionally followed by a set of variables.
#[derive(Clone, PartialEq, Debug)]
pub struct Prefab {
    pub path: TypePath,
    pub vars: LinkedHashMap<Ident, Expression>,
}

impl Prefab {
    pub fn get_proto_representation(&self) -> PrefabProto {
        let mut prefab_pb = PrefabProto::new();
        for p in &self.path {
            let mut path_pb = TypePathProto::new();
            path_pb.set_path_op(p.0.get_proto_representation());
            path_pb.set_s(p.1.to_string());
            prefab_pb.mut_path().push(path_pb);
        }
        for (key, value) in &self.vars {
            prefab_pb.mut_vars().insert(key.to_string(), value.get_proto_representation());
        }
        prefab_pb
    }
}

impl From<TypePath> for Prefab {
    fn from(path: TypePath) -> Self {
        Prefab {
            path,
            vars: Default::default(),
        }
    }
}

/// Formatting helper for variable arrays.
pub struct FormatVars<'a, E>(pub &'a LinkedHashMap<Ident, E>);

impl<'a, E: fmt::Display> fmt::Display for FormatVars<'a, E> {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        if !self.0.is_empty() {
            write!(f, " {{")?;
            let mut first = true;
            for (k, v) in self.0.iter() {
                if !first {
                    write!(f, "; ")?;
                }
                first = false;
                write!(f, "{} = {}", k, v)?;
            }
            write!(f, "}}")?;
        }
        Ok(())
    }
}

/// The different forms of the `new` command.
#[derive(Clone, PartialEq, Debug)]
pub enum NewType {
    /// Implicit type, taken from context.
    Implicit,
    /// A prefab to be instantiated.
    Prefab(Box<Prefab>),
    /// A "mini-expression" in which to find the prefab to instantiate.
    MiniExpr {
        ident: Ident,
        fields: Vec<IndexOrField>,
    },
}

impl NewType {
    pub fn get_proto_representation<'a>(&'a self) -> NewTypeProto {
        let mut ntp_pb = NewTypeProto::new();
        match self {
            NewType::Implicit => ntp_pb.set_implicit(true),
            NewType::Prefab(p) => ntp_pb.set_prefab(p.get_proto_representation()),
            NewType::MiniExpr{ident, fields} => {
                ntp_pb.mut_mini_expr().set_ident(ident.to_string());
                for field in fields {
                    ntp_pb.mut_mini_expr().mut_fields().push(field.get_proto_representation());
                }
            }
        }
        return ntp_pb;
    }
}

/// The structure of an expression, a tree of terms and operators.
#[derive(Clone, PartialEq, Debug)]
pub enum Expression {
    /// An expression containing a term directly. The term is evaluated first,
    /// then its follows, then its unary operators in reverse order.
    Base {
        /// The unary operations applied to this value, in reverse order.
        unary: Vec<UnaryOp>,
        /// The term of the expression.
        term: Box<Spanned<Term>>,
        /// The follow operations applied to this value.
        follow: Vec<Spanned<Follow>>,
    },
    /// A binary operation.
    BinaryOp {
        /// The binary operation.
        op: BinaryOp,
        /// The left-hand side of the operation.
        lhs: Box<Expression>,
        /// The right-hand side of the operation.
        rhs: Box<Expression>,
    },
    /// An assignment operation.
    AssignOp {
        /// The assignment operation.
        op: AssignOp,
        /// The left-hand side of the assignment.
        lhs: Box<Expression>,
        /// The right-hand side of the assignment.
        rhs: Box<Expression>,
    },
    /// A ternary operation.
    TernaryOp {
        /// The condition.
        cond: Box<Expression>,
        /// The value if the condition is truthy.
        if_: Box<Expression>,
        /// The value otherwise.
        else_: Box<Expression>,
    }
}

impl Expression {
    /// If this expression consists of a single term, return it.
    pub fn as_term(&self) -> Option<&Term> {
        match *self {
            Expression::Base { ref unary, ref follow, ref term }
                if unary.is_empty() && follow.is_empty() => Some(&term.elem),
            _ => None,
        }
    }

    /// If this expression consists of a single term, return it.
    pub fn into_term(self) -> Option<Term> {
        match self {
            Expression::Base { unary, follow, term } => {
                if unary.is_empty() && follow.is_empty() {
                    Some(term.elem)
                } else {
                    None
                }
            },
            _ => None,
        }
    }

    pub fn is_const_eval(&self) -> bool {
        match self {
            Expression::BinaryOp { op, lhs, rhs } => {
                guard!(let Some(lhterm) = lhs.as_term() else {
                    return false
                });
                guard!(let Some(rhterm) = rhs.as_term() else {
                    return false
                });
                if !lhterm.is_static() {
                    return false
                }
                if !rhterm.is_static() {
                    return false
                }
                match op {
                    BinaryOp::Eq |
                    BinaryOp::NotEq |
                    BinaryOp::Less |
                    BinaryOp::Greater |
                    BinaryOp::LessEq |
                    BinaryOp::GreaterEq |
                    BinaryOp::And |
                    BinaryOp::Or => true,
                    _ => false,
                }
            },
            _ => false,
        }
    }

    pub fn is_truthy(&self) -> Option<bool> {
        match self {
            Expression::Base { unary, term, follow: _ } => {
                guard!(let Some(truthy) = term.elem.is_truthy() else {
                    return None
                });
                let mut negation = false;
                for u in unary {
                    if let UnaryOp::Not = u {
                        negation = !negation;
                    }
                }
                if negation {
                    Some(!truthy)
                } else {
                    Some(truthy)
                }
            },
            Expression::BinaryOp { op, lhs, rhs } => {
                guard!(let Some(lhtruth) = lhs.is_truthy() else {
                    return None
                });
                guard!(let Some(rhtruth) = rhs.is_truthy() else {
                    return None
                });
                match op {
                    BinaryOp::And => Some(lhtruth && rhtruth),
                    BinaryOp::Or => Some(lhtruth || rhtruth),
                    _ => None,
                }
            },
            Expression::AssignOp { op, lhs: _, rhs } => {
                if let AssignOp::Assign = op {
                    return match rhs.as_term() {
                        Some(term) => term.is_truthy(),
                        _ => None,
                    }
                } else {
                    return None
                }
            },
            Expression::TernaryOp { cond, if_, else_ } => {
                guard!(let Some(condtruth) = cond.is_truthy() else {
                    return None
                });
                if condtruth {
                    if_.is_truthy()
                } else {
                    else_.is_truthy()
                }
            }
        }
    }

    pub fn get_proto_representation<'a>(&'a self) -> ExpressionProto {
        let mut expr_pb = ExpressionProto::new();
           match self {
            Expression::Base { unary, term, follow } => {
                let mut base_pb = BaseExpressionProto::new();
                for u in unary {
                    base_pb.mut_unary().push(u.get_proto_representation());
                }
                base_pb.set_term(term.elem.get_proto_representation());
                for f in follow {
                    base_pb.mut_follow().push(f.elem.get_proto_representation());
                }
                expr_pb.set_base(base_pb);
            },
            Expression::BinaryOp { op, lhs, rhs } => {
                let mut binary_op_pb = BinaryOpExpressionProto::new();
                binary_op_pb.set_op(op.get_proto_representation());
                binary_op_pb.set_lhs(lhs.get_proto_representation());
                binary_op_pb.set_rhs(rhs.get_proto_representation());
                expr_pb.set_binary_op(binary_op_pb);
            },
            Expression::AssignOp { op, lhs, rhs } => {
                let mut assign_op_pb = AssignOpExpressionProto::new();
                assign_op_pb.set_op(op.get_proto_representation());
                assign_op_pb.set_lhs(lhs.get_proto_representation());
                assign_op_pb.set_rhs(rhs.get_proto_representation());
                expr_pb.set_assign_op(assign_op_pb);
            },
            Expression::TernaryOp { cond, if_, else_ } => {
                let mut ternary_op_pb = TernaryOpExpressionProto::new();
                ternary_op_pb.set_cond_expr(cond.get_proto_representation());
                ternary_op_pb.set_if_expr(if_.get_proto_representation());
                ternary_op_pb.set_else_expr(else_.get_proto_representation());
                expr_pb.set_ternary_op(ternary_op_pb);
            }
        }
        expr_pb
    }
}

impl From<Term> for Expression {
    fn from(term: Term) -> Expression {
        match term {
            Term::Expr(expr) => *expr,
            term => Expression::Base {
                unary: Default::default(),
                follow: Default::default(),
                term: Box::new(Spanned::new(Default::default(), term)),
            },
        }
    }
}

/// The structure of a term, the basic building block of the AST.
#[derive(Clone, PartialEq, Debug)]
pub enum Term {
    // Terms with no recursive contents ---------------------------------------
    /// The literal `null`.
    Null,
    /// An integer literal.
    Int(i32),
    /// A floating-point literal.
    Float(f32),
    /// An identifier.
    Ident(Ident),
    /// A string literal.
    String(String),
    /// A resource literal.
    Resource(String),
    /// An `as()` call, with an input type. Undocumented.
    As(InputType),

    // Non-function calls with recursive contents -----------------------------
    /// An expression contained in a term.
    Expr(Box<Expression>),
    /// A prefab literal (path + vars).
    Prefab(Box<Prefab>),
    /// An interpolated string, alternating string/expr/string/expr.
    InterpString(String, Vec<(Option<Expression>, String)>),

    // Function calls with recursive contents ---------------------------------
    /// An unscoped function call.
    Call(Ident, Vec<Expression>),
    /// A `.()` call.
    SelfCall(Vec<Expression>),
    /// A `..()` call. If arguments is empty, the proc's arguments are passed.
    ParentCall(Vec<Expression>),
    /// A `new` call.
    New {
        /// The type to be instantiated.
        type_: NewType,
        /// The list of arguments to pass to the `New()` proc.
        args: Option<Vec<Expression>>,
    },
    /// A `list` call. Associations are represented by assignment expressions.
    List(Vec<Expression>),
    /// An `input` call.
    Input {
        args: Vec<Expression>,
        input_type: Option<InputType>, // as
        in_list: Option<Box<Expression>>, // in
    },
    /// A `locate` call.
    Locate {
        args: Vec<Expression>,
        in_list: Option<Box<Expression>>, // in
    },
    /// A `pick` call, possibly with weights.
    Pick(Vec<(Option<Expression>, Expression)>),
    /// A use of the `call()()` primitive.
    DynamicCall(Vec<Expression>, Vec<Expression>),
}

impl Term {
    pub fn is_static(&self) -> bool {
        matches!(self,
            Term::Null
            | Term::Int(_)
            | Term::Float(_)
            | Term::String(_)
            | Term::Prefab(_)
        )
    }

    pub fn is_truthy(&self) -> Option<bool> {
        return match self {
            // `null`, `0`, and empty strings are falsey.
            Term::Null => Some(false),
            Term::Int(i) => Some(*i != 0),
            Term::Float(i) => Some(*i != 0f32),
            Term::String(s) => Some(!s.is_empty()),

            // Paths/prefabs are truthy.
            Term::Prefab(_) => Some(true),
            // `new()` and `list()` return the newly-created reference.
            Term::New{type_: _, args: _} => Some(true),
            Term::List(_) => Some(true),

            // Truthy if any of the literal parts are non-empty.
            // Otherwise, don't try to determine the content of the parts.
            Term::InterpString(first, parts) => {
                if !first.is_empty() || parts.iter().any(|(_, p)| !p.is_empty()) {
                    Some(true)
                } else {
                    None
                }
            },

            // Recurse.
            Term::Expr(e) => e.is_truthy(),

            _ => None,
        };
    }

    pub fn valid_for_range(&self, other: &Term, step: Option<&Expression>) -> Option<bool> {
        if let Term::Int(i) = *self {
            if let Term::Int(o) = *other {
                // edge case
                if i == 0 && o == 0 {
                    return Some(false)
                }
                if let Some(stepexp) = step {
                    if let Some(stepterm) = stepexp.as_term() {
                        if let Term::Int(_s) = stepterm {
                            return Some(true)
                        }
                    } else {
                        return Some(true)
                    }
                }
                return Some(i <= o)
            }
        }
        None
    }

    pub fn get_proto_representation(&self) -> TermProto {
        let mut term_pb = TermProto::new();
        match self {
            Term::Null => {
                term_pb.set_null_t(true);
            },
            Term::Int(i) => {
                term_pb.set_int_t(*i);
            },
            Term::Float(i) => {
                term_pb.set_float_t(*i);
            },
            Term::Ident(s) => {
                term_pb.set_ident(s.to_string());
            },
            Term::String(s) => {
                term_pb.set_string_t(s.to_string());
            },
            Term::Resource(s) => {
                term_pb.set_resource(s.to_string());
            },
            Term::As(t) => {
                term_pb.set_as_t(t.get_proto_representation());
            }

            Term::Expr(e) => {
                term_pb.set_expr(e.get_proto_representation());
            },
            Term::Prefab(p) => {
                term_pb.set_prefab(p.get_proto_representation());
            },
            Term::InterpString(s, strings) => {
                let mut interp_string_pb = InterpStringProto::new();
                interp_string_pb.set_s(s.to_string());
                for st in strings {
                    let mut collection_pb = InterpStringCollectionProto::new();
                    match &st.0 {
                        Some(expr) => collection_pb.set_expr(expr.get_proto_representation()),
                        None => ()
                    }
                    collection_pb.set_s(st.1.to_string());
                    interp_string_pb.mut_collections().push(collection_pb);
                }

                term_pb.set_interp_string(interp_string_pb);
            },

            Term::Call(s, exprs) => {
                let mut term_call_pb = TermCallProto::new();
                term_call_pb.set_s(s.to_string());

                for e in exprs {
                    term_call_pb.mut_expr().push(e.get_proto_representation());
                }
                term_pb.set_call(term_call_pb);
            },
            Term::SelfCall(exprs) => {
                let mut self_call_pb = SelfCallProto::new();
                for e in exprs {
                    self_call_pb.mut_expr().push(e.get_proto_representation());
                }
                term_pb.set_self_call(self_call_pb);
            },
            Term::ParentCall(exprs) => {
                let mut parent_call_pb = ParentCallProto::new();
                for e in exprs {
                    parent_call_pb.mut_expr().push(e.get_proto_representation());
                }
                term_pb.set_parent_call(parent_call_pb);
            },
            Term::New{type_, args} => {
                let mut new_pb = NewProto::new();
                new_pb.set_field_type(type_.get_proto_representation());
                match args {
                    Some(expr) => {
                            for e in expr {
                    new_pb.mut_args().push(e.get_proto_representation());
                }
                    },
                    None => (),
                }

                term_pb.set_new(new_pb);
            },
            Term::List(exprs) => {
                for e in exprs {
                    term_pb.mut_list().mut_call().push(e.get_proto_representation());
                }
            },
            Term::Input{args, input_type, in_list} => {
                for e in args {
                    term_pb.mut_input().mut_args().push(e.get_proto_representation());
                }
                match input_type {
                    Some(expr) => term_pb.mut_input().set_input_type(expr.get_proto_representation()),
                    None => (),
                }
                match in_list {
                    Some(expr) => term_pb.mut_input().set_in_list(expr.get_proto_representation()),
                    None => (),
                }
            },
            Term::Locate{args, in_list} => {
                for e in args {
                    term_pb.mut_locate().mut_args().push(e.get_proto_representation());
                }
                match in_list {
                    Some(expr) => term_pb.mut_locate().set_in_list(expr.get_proto_representation()),
                    None => (),
                }
            },
            Term::Pick(/*list of opt expr to expr tuples */l) => {
                for tuple in l {
                    let mut pp_pb = PickPairProto::new();
                    match &tuple.0 {
                        Some(expr) => pp_pb.set_first(expr.get_proto_representation()),
                        None => (),
                    }
                    pp_pb.set_second(tuple.1.get_proto_representation());
                    term_pb.mut_pick().mut_pick().push(pp_pb);
                }
            },
            Term::DynamicCall(l1, l2) => {
                for expr in l1 {
                    term_pb.mut_dynamic_call().mut_first().push(expr.get_proto_representation());
                }
                for expr in l2 {
                    term_pb.mut_dynamic_call().mut_second().push(expr.get_proto_representation());
                }
            }
        };
        term_pb
    }
}

impl From<Expression> for Term {
    fn from(expr: Expression) -> Term {
        match expr {
            Expression::Base { term, unary, follow } => if unary.is_empty() && follow.is_empty() {
                match term.elem {
                    Term::Expr(expr) => Term::from(*expr),
                    other => other,
                }
            } else {
                Term::Expr(Box::new(Expression::Base { term, unary, follow }))
            },
            other => Term::Expr(Box::new(other)),
        }
    }
}

/// The possible kinds of index operators, for both fields and methods.
#[derive(Debug, Copy, Clone, Eq, PartialEq)]
pub enum IndexKind {
    /// `a.b`
    Dot,
    /// `a:b`
    Colon,
    /// `a?.b`
    SafeDot,
    /// `a?:b`
    SafeColon,
}

impl IndexKind {
    pub fn name(self) -> &'static str {
        match self {
            IndexKind::Dot => ".",
            IndexKind::Colon => ":",
            IndexKind::SafeDot => "?.",
            IndexKind::SafeColon => "?:",
        }
    }

    pub fn get_proto_representation(&self) -> IndexKindProto {
       match self {
            IndexKind::Dot => IndexKindProto::INDEX_KIND_DOT,
            IndexKind::Colon => IndexKindProto::INDEX_KIND_COLON,
            IndexKind::SafeDot => IndexKindProto::INDEX_KIND_SAFE_DOT,
            IndexKind::SafeColon => IndexKindProto::INDEX_KIND_SAFE_COLON,
        }
    }
}

impl fmt::Display for IndexKind {
    fn fmt(&self, fmt: &mut fmt::Formatter) -> fmt::Result {
        fmt.write_str(self.name())
    }
}

/// An expression part which is applied to a term or another follow.
#[derive(Debug, Clone, PartialEq)]
pub enum Follow {
    /// Index the value by an expression.
    Index(Box<Expression>),
    /// Access a field of the value.
    Field(IndexKind, Ident),
    /// Call a method of the value.
    Call(IndexKind, Ident, Vec<Expression>),
}

impl Follow {
    pub fn get_proto_representation(&self) -> FollowProto {
        let mut follow_pb = FollowProto::new();
        match self {
            Follow::Index(e) => {
                follow_pb.set_index(e.get_proto_representation());
            },
            Follow::Field(i, s) => {
                let mut field_pb = FieldProto::new();
                field_pb.set_index_kind(i.get_proto_representation());
                field_pb.set_s(s.to_string());
                follow_pb.set_field(field_pb);
             },
             Follow::Call(i, s, exprs) => {
                let mut call_pb = FollowCallProto::new();
                call_pb.set_index_kind(i.get_proto_representation());
                call_pb.set_s(s.to_string());
                for expr in exprs {
                    call_pb.mut_expr().push(expr.get_proto_representation());
                }
                follow_pb.set_call(call_pb);
             }
        }
        follow_pb
    }
}

/// Like a `Follow` but supports index or fields only.
#[derive(Debug, Clone, PartialEq)]
pub enum IndexOrField {
    /// Index the value by an expression.
    Index(Box<Expression>),
    /// Access a field of the value.
    Field(IndexKind, Ident),
}

impl IndexOrField {
     pub fn get_proto_representation(&self) -> IndexOrFieldProto {
        let mut iof_pb = IndexOrFieldProto::new();
        match self {
            IndexOrField::Index(expr) => iof_pb.set_index(expr.get_proto_representation()),
            IndexOrField::Field(ik, s) => {
                iof_pb.mut_field().set_index_kind(ik.get_proto_representation());
                iof_pb.mut_field().set_s(s.to_string());
            }
        }
        return iof_pb;
     }
}

impl From<IndexOrField> for Follow {
    fn from(input: IndexOrField) -> Follow {
        match input {
            IndexOrField::Index(expr) => Follow::Index(expr),
            IndexOrField::Field(kind, name) => Follow::Field(kind, name),
        }
    }
}

/// The proc declaration kind, either `proc` or `verb`.
///
/// DM requires referencing proc paths to include whether the target is
/// declared as a proc or verb, even though the two modes are functionally
/// identical in many other respects.
#[derive(Debug, Clone, PartialEq, Eq, Copy, Hash)]
pub enum ProcDeclKind {
    Proc,
    Verb,
}

impl ProcDeclKind {
    /// Attempt to convert a string to a declaration kind.
    pub fn from_name(name: &str) -> Option<ProcDeclKind> {
        match name {
            "proc" => Some(ProcDeclKind::Proc),
            "verb" => Some(ProcDeclKind::Verb),
            _ => None,
        }
    }

    /// Return whether `self` is `ProcDeclKind::Verb`.
    pub fn is_verb(self) -> bool {
        self == ProcDeclKind::Verb
    }

    /// Return the string representation of this declaration kind.
    pub fn name(self) -> &'static str {
        match self {
            ProcDeclKind::Proc => "proc",
            ProcDeclKind::Verb => "verb",
        }
    }

    pub fn get_proto_representation(self) -> ProcDeclKindProto {
        match self {
            ProcDeclKind::Proc => ProcDeclKindProto::PROC_DECL_KIND_PROC,
            ProcDeclKind::Verb => ProcDeclKindProto::PROC_DECL_KIND_VERB,
        }
    }
}

impl fmt::Display for ProcDeclKind {
    fn fmt(&self, fmt: &mut fmt::Formatter) -> fmt::Result {
        fmt.write_str(self.name())
    }
}

/// A parameter declaration in the header of a proc.
#[derive(Debug, Clone, PartialEq, Default)]
pub struct Parameter {
    pub var_type: VarType,
    pub name: Ident,
    pub default: Option<Expression>,
    pub input_type: Option<InputType>,
    pub in_list: Option<Expression>,
    pub location: Location,
}

impl Parameter {
    pub fn get_proto_representation(&self)  -> ParameterProto {
        let mut param_pb = ParameterProto::new();
        param_pb.set_var_type(self.var_type.get_proto_representation());
        param_pb.set_name(self.name.to_string());
        match &self.default {
            Some(expr) => param_pb.set_default(expr.get_proto_representation()),
            None => (),
        }
        match self.input_type {
            Some(expr) => param_pb.set_input_type(expr.get_proto_representation()),
            None => (),
        }
        match &self.in_list {
            Some(expr) => param_pb.set_in_list(expr.get_proto_representation()),
            None => (),
        }
        param_pb.set_location(self.location.get_proto_representation());
        param_pb
    }
}

impl fmt::Display for Parameter {
    fn fmt(&self, fmt: &mut fmt::Formatter) -> fmt::Result {
        write!(fmt, "{}{}", self.var_type, self.name)?;
        if let Some(input_type) = self.input_type {
            write!(fmt, " as {}", input_type)?;
        }
        Ok(())
    }
}

macro_rules! type_table {
    ($(#[$attr:meta])* pub struct $name:ident; $($txt:expr, $i:ident, $val:expr, $proto:expr;)*) => {
        bitflags! {
            $(#[$attr])*
            /// A type specifier for verb arguments and input() calls.
            pub struct $name: u32 {
                $(const $i = $val;)*
            }
        }

        impl $name {
            pub fn from_str(text: &str) -> Option<Self> {
                match text {
                    $(
                        $txt => Some($name::$i),
                    )*
                    _ => None,
                }
            }

            pub fn get_proto_representation(self) -> InputTypeProto {
                let mut input_type_pb = InputTypeProto::new();
                $(
                    if self.contains($name::$i) {
                        input_type_pb.mut_key_name().push($proto);
                    }
                )*
                input_type_pb.set_val(0);
                input_type_pb.set_display(format!("{}", self));
                return input_type_pb;
             }
        }


        impl fmt::Display for $name {
            fn fmt(&self, fmt: &mut fmt::Formatter) -> fmt::Result {
                let mut first = true;
                $(
                    if self.contains($name::$i) {
                        write!(fmt, "{}{}", if first { "" } else { "|" }, $txt)?;
                        first = false;
                    }
                )*
                if first {
                    fmt.write_str("()")?;
                }
                Ok(())
            }
        }
    }
}

type_table! {
    /// A type specifier for verb arguments and input() calls.
    pub struct InputType;

    // These values can be known with an invocation such as:
    //     src << as(command_text)
    "mob",          MOB,          1 << 0,  InputTypeKeyProtoEnum::INPUT_TYPE_MOB;
    "obj",          OBJ,          1 << 1,  InputTypeKeyProtoEnum::INPUT_TYPE_OBJ;
    "text",         TEXT,         1 << 2,  InputTypeKeyProtoEnum::INPUT_TYPE_TEXT;
    "num",          NUM,          1 << 3,  InputTypeKeyProtoEnum::INPUT_TYPE_NUM;
    "file",         FILE,         1 << 4,  InputTypeKeyProtoEnum::INPUT_TYPE_FILE;
    "turf",         TURF,         1 << 5,  InputTypeKeyProtoEnum::INPUT_TYPE_TURF;
    "key",          KEY,          1 << 6,  InputTypeKeyProtoEnum::INPUT_TYPE_KEY;
    "null",         NULL,         1 << 7,  InputTypeKeyProtoEnum::INPUT_TYPE_NULL;
    "area",         AREA,         1 << 8,  InputTypeKeyProtoEnum::INPUT_TYPE_AREA;
    "icon",         ICON,         1 << 9,  InputTypeKeyProtoEnum::INPUT_TYPE_ICON;
    "sound",        SOUND,        1 << 10, InputTypeKeyProtoEnum::INPUT_TYPE_SOUND;
    "message",      MESSAGE,      1 << 11, InputTypeKeyProtoEnum::INPUT_TYPE_MESSAGE;
    "anything",     ANYTHING,     1 << 12, InputTypeKeyProtoEnum::INPUT_TYPE_ANYTHING;
    "password",     PASSWORD,     1 << 15, InputTypeKeyProtoEnum::INPUT_TYPE_PASSWORD;
    "command_text", COMMAND_TEXT, 1 << 16, InputTypeKeyProtoEnum::INPUT_TYPE_COMMAND_TEXT;
    "color",        COLOR,        1 << 17, InputTypeKeyProtoEnum::INPUT_TYPE_COLOR;
}

impl InputType {

}

bitflags! {
    #[derive(Default)]
    pub struct VarTypeFlags: u8 {
        // DM flags
        const STATIC = 1 << 0;
        const CONST = 1 << 2;
        const TMP = 1 << 3;
        // SpacemanDMM flags
        const FINAL = 1 << 4;
        const PRIVATE = 1 << 5;
        const PROTECTED = 1 << 6;
    }
}

impl VarTypeFlags {
    pub fn from_name(name: &str) -> Option<VarTypeFlags> {
        match name {
            // DM flags
            "global" | "static" => Some(VarTypeFlags::STATIC),
            "const" => Some(VarTypeFlags::CONST),
            "tmp" => Some(VarTypeFlags::TMP),
            // SpacemanDMM flags
            "SpacemanDMM_final" => Some(VarTypeFlags::FINAL),
            "SpacemanDMM_private" => Some(VarTypeFlags::PRIVATE),
            "SpacemanDMM_protected" => Some(VarTypeFlags::PROTECTED),
            // Fallback
            _ => None,
        }
    }

    #[inline]
    pub fn is_static(&self) -> bool {
        self.contains(VarTypeFlags::STATIC)
    }

    #[inline]
    pub fn is_const(&self) -> bool {
        self.contains(VarTypeFlags::CONST)
    }

    #[inline]
    pub fn is_tmp(&self) -> bool {
        self.contains(VarTypeFlags::TMP)
    }

    #[inline]
    pub fn is_final(&self) -> bool {
        self.contains(VarTypeFlags::FINAL)
    }

    #[inline]
    pub fn is_private(&self) -> bool {
        self.contains(VarTypeFlags::PRIVATE)
    }

    #[inline]
    pub fn is_protected(&self) -> bool {
        self.contains(VarTypeFlags::PROTECTED)
    }

    #[inline]
    pub fn is_const_evaluable(&self) -> bool {
        self.contains(VarTypeFlags::CONST) || !self.intersects(VarTypeFlags::STATIC | VarTypeFlags::PROTECTED)
    }

    #[inline]
    pub fn is_normal(&self) -> bool {
        !self.intersects(VarTypeFlags::CONST | VarTypeFlags::STATIC | VarTypeFlags::PROTECTED)
    }

    pub fn to_vec(&self) -> Vec<&'static str> {
        let mut v = Vec::new();
        if self.is_static() { v.push("static"); }
        if self.is_const() { v.push("const"); }
        if self.is_tmp() { v.push("tmp"); }
        if self.is_final() { v.push("SpacemanDMM_final"); }
        if self.is_private() { v.push("SpacemanDMM_private"); }
        if self.is_protected() { v.push("SpacemanDMM_protected"); }
        v
    }
}

impl fmt::Display for VarTypeFlags {
    fn fmt(&self, fmt: &mut fmt::Formatter) -> fmt::Result {
        if self.is_static() {
            fmt.write_str("static/")?;
        }
        if self.is_const() {
            fmt.write_str("const/")?;
        }
        if self.is_tmp() {
            fmt.write_str("tmp/")?;
        }
        if self.is_final() {
            fmt.write_str("SpacemanDMM_final/")?;
        }
        if self.is_private() {
            fmt.write_str("SpacemanDMM_private/")?;
        }
        if self.is_protected() {
            fmt.write_str("SpacemanDMM_protected/")?;
        }
        Ok(())
    }
}

/// A type which may be ascribed to a `var`.
#[derive(Debug, Clone, PartialEq, Default)]
pub struct VarType {
    pub flags: VarTypeFlags,
    pub type_path: TreePath,
}

impl VarType {
    #[inline]
    pub fn is_const_evaluable(&self) -> bool {
        self.flags.is_const_evaluable()
    }

    #[inline]
    pub fn is_normal(&self) -> bool {
        self.flags.is_normal()
    }

    pub fn suffix(&mut self, suffix: &VarSuffix) {
        if !suffix.list.is_empty() {
            self.type_path.insert(0, "list".to_owned());
        }
    }

    pub fn get_proto_representation(&self) -> VarTypeProto {
        let mut var_type_pb = VarTypeProto::new();
        // TODO: Set these fields according to VarTypeFlags
        for path in &self.type_path {
            var_type_pb.mut_type_path().mut_s().push(path.to_string());
        }
        var_type_pb
    }
}

impl FromIterator<String> for VarType {
    fn from_iter<T: IntoIterator<Item=String>>(iter: T) -> Self {
        let mut flags = VarTypeFlags::default();
        let type_path = iter
            .into_iter()
            .skip_while(|p| {
                if let Some(flag) = VarTypeFlags::from_name(p) {
                    flags |= flag;
                    true
                } else {
                    false
                }
            }).collect();
        VarType {
            flags,
            type_path,
        }
    }
}

impl fmt::Display for VarType {
    fn fmt(&self, fmt: &mut fmt::Formatter) -> fmt::Result {
        self.flags.fmt(fmt)?;
        for bit in self.type_path.iter() {
            fmt.write_str(bit)?;
            fmt.write_str("/")?;
        }
        Ok(())
    }
}

/// Suffixes which may appear after a variable's name in its declaration.
#[derive(Debug, Clone, PartialEq, Default)]
pub struct VarSuffix {
    // var/L[], var/L[10]
    pub list: Vec<Option<Expression>>,
}

impl VarSuffix {
    pub fn is_empty(&self) -> bool {
        self.list.is_empty()
    }

    pub fn into_initializer(self) -> Option<Expression> {
        // `var/L[10]` is equivalent to `var/list/L = new /list(10)`
        // `var/L[2][][3]` is equivalent to `var/list/list/list = new /list(2, 3)`
        let args: Vec<_> = self.list.into_iter().filter_map(|x| x).collect();
        if args.is_empty() {
            None
        } else {
            Some(Expression::from(Term::New {
                type_: NewType::Prefab(Box::new(Prefab::from(vec![(PathOp::Slash, "list".to_owned())]))),
                args: Some(args),
            }))
        }
    }
}

/// A block of statements.
pub type Block = Box<[Spanned<Statement>]>;

/// A statement in a proc body.
#[derive(Debug, Clone, PartialEq)]
pub enum Statement {
    Expr(Expression),
    Return(Option<Expression>),
    Throw(Expression),
    While {
        condition: Expression,
        block: Block,
    },
    DoWhile {
        block: Block,
        condition: Spanned<Expression>,
    },
    If {
        arms: Vec<(Spanned<Expression>, Block)>,
        else_arm: Option<Block>
    },
    ForLoop {
        init: Option<Box<Statement>>,
        test: Option<Box<Expression>>,
        inc: Option<Box<Statement>>,
        block: Block,
    },
    ForList {
        var_type: Option<VarType>,
        name: Ident,
        /// If zero, uses the declared type of the variable.
        input_type: Option<InputType>,
        /// Defaults to 'world'.
        in_list: Option<Box<Expression>>,
        block: Block,
    },
    ForRange {
        var_type: Option<VarType>,
        name: Ident,
        start: Box<Expression>,
        end: Box<Expression>,
        step: Option<Box<Expression>>,
        block: Block,
    },
    Var(Box<VarStatement>),
    Vars(Vec<VarStatement>),
    Setting {
        name: Ident,
        mode: SettingMode,
        value: Expression
    },
    Spawn {
        delay: Option<Expression>,
        block: Block,
    },
    Switch {
        input: Box<Expression>,
        cases: Box<[(Spanned<Vec<Case>>, Block)]>,
        default: Option<Block>,
    },
    TryCatch {
        try_block: Block,
        catch_params: Vec<TreePath>,
        catch_block: Block,
    },
    Continue(Option<Ident>),
    Break(Option<Ident>),
    Goto(Ident),
    Label {
        name: Ident,
        block: Block,
    },
    Del(Expression),
    Crash(Expression),
}

fn block_to_proto(block: &Block) -> BlockProto {
    let mut block_pb = BlockProto::new();
    for s in block.iter() {
        block_pb.mut_statement().push(s.elem.get_proto_representation());
    }
    block_pb
}

impl Statement {
    pub fn get_proto_representation(&self) -> StatementProto {
        let mut statement_pb = StatementProto::new();
        match self {
            Statement::Expr(expr) => {
                statement_pb.set_expr(expr.get_proto_representation());
            },
            Statement::Return(expr) => {
                match expr {
                    Some(e) => statement_pb.mut_return_s().set_expr(e.get_proto_representation()),
                    None => (),
                }
            },
            Statement::Throw(expr) => {
                statement_pb.mut_throw().set_expr(expr.get_proto_representation());
            },
            Statement::While {condition, block} => {
                let mut while_pb = WhileProto::new();
                while_pb.set_condition(condition.get_proto_representation());
                while_pb.set_block(block_to_proto(block));
                statement_pb.set_while_s(while_pb);
            },
            Statement::DoWhile {block, condition: spanned} => {
                let mut do_while_pb = DoWhileProto::new();
                do_while_pb.set_condition(spanned.elem.get_proto_representation());
                do_while_pb.set_block(block_to_proto(block));
                statement_pb.set_do_while(do_while_pb);
            },
            Statement::If {arms, else_arm} => {
                let mut if_pb = IfProto::new();
                for arm in arms {
                    let mut if_arm_pb = IfArmProto::new();
                    if_arm_pb.set_expr(arm.0.elem.get_proto_representation());
                    if_arm_pb.set_block(block_to_proto(&arm.1));
                    if_pb.mut_arm().push(if_arm_pb);
                }
                match else_arm {
                    Some(expr) => if_pb.set_else_arm(block_to_proto(expr)),
                    None => (),
                }
                statement_pb.set_if_s(if_pb);
            },
            Statement::ForList {var_type, name, input_type, in_list, block} => {
                match var_type {
                    Some(expr) => {
                        statement_pb.mut_for_list().set_var_type(expr.get_proto_representation());
                    },
                    None => (),
                }
                statement_pb.mut_for_list().set_name(name.to_string());
                match input_type {
                    Some(expr) =>statement_pb.mut_for_list().set_input_type(expr.get_proto_representation()),
                    None => (),
                }
                match in_list {
                    Some(expr) => statement_pb.mut_for_list().set_in_list(expr.get_proto_representation()),
                    None => (),
                }
                statement_pb.mut_for_list().set_block(block_to_proto(block));
            },
            Statement::ForLoop {init, test, inc, block} => {
                let mut for_loop_pb = ForLoopProto::new();
                match init {
                    Some(expr) => for_loop_pb.set_init(expr.get_proto_representation()),
                    None => (),
                };
                match test {
                    Some(expr) => for_loop_pb.set_test(expr.get_proto_representation()),
                    None => (),
                };
                match inc {
                    Some(expr) => for_loop_pb.set_inc(expr.get_proto_representation()),
                    None => (),
                }
                for_loop_pb.set_block(block_to_proto(block));
                statement_pb.set_for_loop(for_loop_pb);
            },
            Statement::ForRange {var_type, name, start, end, step, block} => {
                let mut for_range_pb = ForRangeProto::new();
                match var_type {
                    Some(expr) => for_range_pb.set_var_type(expr.get_proto_representation()),
                    None => (),
                }
                for_range_pb.set_name(name.to_string());
                for_range_pb.set_start(start.get_proto_representation());
                for_range_pb.set_end(end.get_proto_representation());
                match step {
                    Some(expr) => for_range_pb.set_step(expr.get_proto_representation()),
                    None => (),
                }
                for_range_pb.set_block(block_to_proto(block));
                statement_pb.set_for_range(for_range_pb);
            },
            Statement::Var(expr) => {
                statement_pb.set_var(expr.get_proto_representation());
            },
            Statement::Vars(exprs) => {
                for expr in exprs {
                    statement_pb.mut_vars().push(expr.get_proto_representation());
                }
            },
            Statement::Setting{name, mode, value} => {
                statement_pb.mut_setting().set_name(name.to_string());
                statement_pb.mut_setting().set_mode(mode.get_proto_representation());
                statement_pb.mut_setting().set_value(value.get_proto_representation());
            },
            Statement::Spawn {delay, block} => {
                match delay {
                    Some(expr) => statement_pb.mut_spawn().set_delay(expr.get_proto_representation()),
                    None => (),
                }
                statement_pb.mut_spawn().set_block(block_to_proto(block));
            },
            Statement::Switch {input, cases, default} => {
                statement_pb.mut_switch().set_input(input.get_proto_representation());
                for case in cases.iter() {
                    let mut cases_pb = SwitchCasesProto::new();
                    for s in &case.0.elem {
                        cases_pb.mut_case().push(s.get_proto_representation());
                    }
                    cases_pb.set_block(block_to_proto(&case.1));
                    statement_pb.mut_switch().mut_cases().push(cases_pb);
                }
                match default {
                    Some(expr) => statement_pb.mut_switch().set_default(block_to_proto(expr)),
                    None => (),
                };
            },
            Statement::TryCatch { try_block, catch_params, catch_block} => {
                statement_pb.mut_try_catch().set_try_block(block_to_proto(try_block));
                for param in catch_params {
                    let mut treepath_pb = TreePathProto::new();
                    for s in param {
                        treepath_pb.mut_s().push(s.to_string());
                    }
                    statement_pb.mut_try_catch().mut_catch_params().push(treepath_pb);
                }

                statement_pb.mut_try_catch().set_catch_block(block_to_proto(catch_block));
            },
            Statement::Continue(s) => {
                match s {
                    Some(expr) => statement_pb.mut_continue_s().set_s(expr.to_string()),
                    None => (),
                };
            },
            Statement::Break(s) => {
                match s {
                    Some(expr) => statement_pb.mut_break_s().set_s(expr.to_string()),
                    None => (),
                };
            },
              Statement::Goto(s) => {
                statement_pb.mut_goto().set_s(s.to_string());
            },
              Statement::Label{name, block} => {
                statement_pb.mut_label().set_name(name.to_string());
                statement_pb.mut_label().set_block(block_to_proto(block));
            },
            Statement::Del(expr) => {
                statement_pb.mut_del().set_expr(expr.get_proto_representation());
            },
            Statement::Crash(expr) => {
                statement_pb.mut_crash().set_expr(expr.get_proto_representation());
            }
        }
        statement_pb
    }
}

#[derive(Debug, Clone, PartialEq)]
pub struct VarStatement {
    pub var_type: VarType,
    pub name: Ident,
    pub value: Option<Expression>,
}

impl VarStatement {
    pub fn get_proto_representation(&self) -> VarStatementProto {
        let mut var_stmt_pb = VarStatementProto::new();
        var_stmt_pb.set_var_type(self.var_type.get_proto_representation());
        var_stmt_pb.set_name(self.name.to_string());
        match &self.value {
            Some(expr) => var_stmt_pb.set_value(expr.get_proto_representation()),
            None => (),
        };
        var_stmt_pb
    }
}

#[derive(Debug, Clone, Copy, PartialEq)]
pub enum SettingMode {
    /// As in `set name = "Use"`.
    Assign,
    /// As in `set src in usr`.
    In,
}

impl SettingMode {
    /// Return the string representation of this setting mode.
    pub fn name(self) -> &'static str {
        match self {
            SettingMode::Assign => "=",
            SettingMode::In => "in",
        }
    }

    pub fn get_proto_representation(self) -> SettingModeProto{
        return match self {
            SettingMode::Assign => SettingModeProto::SETTING_MODE_ASSIGN,
            SettingMode::In => SettingModeProto::SETTING_MODE_IN,
        }
    }
}

impl fmt::Display for SettingMode {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        f.write_str(self.name())
    }
}

#[derive(Debug, Clone, PartialEq)]
pub enum Case {
    Exact(Expression),
    Range(Expression, Expression),
}

impl Case {
    pub fn get_proto_representation(&self) -> SwitchCaseProto {
        let mut switch_case_pb = SwitchCaseProto::new();
        match self {
            Case::Exact(expr) => {
                switch_case_pb.set_exact(expr.get_proto_representation());
            },
            Case::Range(start, end) => {
                switch_case_pb.mut_range().set_start(start.get_proto_representation());
                switch_case_pb.mut_range().set_end(end.get_proto_representation());
            },
        }
        switch_case_pb
    }
}

pub const KNOWN_SETTING_NAMES: &[&str] = &[
    "name",
    "desc",
    "category",
    "hidden",
    "popup_menu",
    "instant",
    "invisibility",
    "src",
    "background",
    "waitfor",
];

// TODO: maybe put this somewhere more suitable?
pub static VALID_FILTER_TYPES: phf::Map<&'static str, &[&str]> = phf_map! {
    "alpha" => &[ "x", "y", "icon", "render_source", "flags" ],
    "angular_blur" => &[ "x", "y", "size" ],
    "bloom" => &[ "threshold", "size", "offset", "alpha" ],
    "color" => &[ "color", "space" ],
    "displace" => &[ "x", "y", "size", "icon", "render_source" ],
    "drop_shadow" => &[ "x", "y", "size", "offset", "color"],
    "blur" => &[ "size" ],
    "layer" => &[ "x", "y", "icon", "render_source", "flags", "color", "transform", "blend_mode" ],
    "motion_blur" => &[ "x", "y" ],
    "outline" => &[ "size", "color", "flags" ],
    "radial_blur" => &[ "x", "y", "size" ],
    "rays" => &[ "x", "y", "size", "color", "offset", "density", "threshold", "factor", "flags" ],
    "ripple" => &[ "x", "y", "size", "repeat", "radius", "falloff", "flags" ],
    "wave" => &[ "x", "y", "size", "offset", "flags" ],
};

// filter type => (flag field name, exclusive, can_be_0, valid flag values)
pub static VALID_FILTER_FLAGS: phf::Map<&'static str, (&str, bool, bool, &[&str])> = phf_map! {
    "alpha" => ("flags", false, true, &[ "MASK_INVERSE", "MASK_SWAP" ]),
    "color" => ("space", true, false, &[ "FILTER_COLOR_RGB", "FILTER_COLOR_HSV", "FILTER_COLOR_HSL", "FILTER_COLOR_HCY" ]),
    "layer" => ("flags", true, true, &[ "FILTER_OVERLAY", "FILTER_UNDERLAY" ]),
    "rays" => ("flags", false, true, &[ "FILTER_OVERLAY", "FILTER_UNDERLAY" ]),
    "outline" => ("flags", false, true, &[ "OUTLINE_SHARP", "OUTLINE_SQUARE" ]),
    "ripple" => ("flags", false, true, &[ "WAVE_BOUNDED" ]),
    "wave" => ("flags", false, true, &[ "WAVE_SIDEWAYS", "WAVE_BOUNDED" ]),
};
