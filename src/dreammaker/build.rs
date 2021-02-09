use protobuf_codegen_pure::Customize;

fn main() {
    protobuf_codegen_pure::Codegen::new()
        .customize(Customize {
            gen_mod_rs: Some(true),
            ..Default::default()
        })
        .out_dir("protos")
        .input("protos/ast.proto")
        .include("protos")
        .run()
        .expect("protoc");
}
