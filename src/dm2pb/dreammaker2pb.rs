extern crate dreammaker as dm;

use dm::protos::ast::Graph as GraphProto;
use protobuf::Message;
use std::io::Error;

// dreammaker2pb uses the SpacemanDMM Rust parser to parse
// out the AST of a Dream Maker environment, and writes it
// to a file as a binary protobuf.
fn main() -> Result<(), Error> {
    let context = dm::Context::default();
    let env = dm::detect_environment_default()
        .expect("error detecting .dme")
        .expect("no .dme found");
    let pp = dm::preprocessor::Preprocessor::new(&context, env)
        .expect("i/o error opening .dme");
    let indents = dm::indents::IndentProcessor::new(&context, pp);
    let mut parser = dm::parser::Parser::new(&context, indents);
    let mut graph_pb = GraphProto::new();

    parser.enable_procs();
    let ot = parser.parse_object_tree();
    ot.root().recurse(&mut |ty| {
        graph_pb.mut_field_type().push(ty.get_proto_representation());
    });

    let mut buf = std::fs::File::create("output.binarypb")?;
    graph_pb.write_to_writer(&mut buf)
        .expect("failed to write binary proto to file.");

    Ok(())
}
