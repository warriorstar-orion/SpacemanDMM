extern crate dreammaker as dm;
extern crate ast_proto_rust;
extern crate protobuf;

use ast_proto_rust::ast::Graph as GraphProto;
use protobuf::Message;
use std::io::Error;

// dreammaker2pb uses the SpacemanDMM Rust parser to parse
// out the AST of a Dream Maker environment, and writes it
// to a file as a binary protobuf.
fn main() -> Result<(), Error> {
    let mut environment = None;
    let mut proto_output_path = None;

    let mut args = std::env::args();
    let _ = args.next();  // skip executable name
    while let Some(arg) = args.next() {
        if arg == "-e" {
            environment = Some(args.next().expect("must specify a value for -e"));
        } else if arg == "-o" {
            proto_output_path = Some(args.next().expect("must specify an output path for -o"));
        }
    }

    let context = dm::Context::default();
    let dme = environment
        .map(std::path::PathBuf::from)
        .unwrap_or_else(|| dm::detect_environment_default()
            .expect("error detecting .dme")
            .expect("no .dme found"));
    let mut pp = dm::preprocessor::Preprocessor::new(&context, dme)
        .expect("i/o error opening .dme");

    let indents = dm::indents::IndentProcessor::new(&context, &mut pp);
    let mut parser = dm::parser::Parser::new(&context, indents);
    let mut graph_pb = GraphProto::new();

    parser.enable_procs();
    let ot = parser.parse_object_tree();
    ot.root().recurse(&mut |ty| {
        graph_pb.mut_field_type().push(ty.get_proto_representation());
    });

    let pp_pb = pp.get_proto_representation();
    let mut pp_buf = std::fs::File::create("pp.binarypb")
        .expect("unable to create preprocessor file.");
    pp_pb.write_to_writer(&mut pp_buf)
        .expect("failed to write preprocessor binary proto to file.");

    let mut buf = std::fs::File::create(proto_output_path.unwrap_or("output.binarypb".to_string()))
        .expect("unable to create file.");
    graph_pb.write_to_writer(&mut buf)
        .expect("failed to write binary proto to file.");

    Ok(())
}
