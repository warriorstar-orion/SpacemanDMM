"""
@generated
cargo-raze generated Bazel file.

DO NOT EDIT! Replaced on runs of cargo-raze
"""

load("@bazel_tools//tools/build_defs/repo:git.bzl", "new_git_repository")  # buildifier: disable=load
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")  # buildifier: disable=load
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")  # buildifier: disable=load

def raze_fetch_remote_crates():
    """This function defines a collection of repos and should be called in a WORKSPACE file"""
    maybe(
        http_archive,
        name = "raze__addr2line__0_14_1",
        url = "https://crates.io/api/v1/crates/addr2line/0.14.1/download",
        type = "tar.gz",
        sha256 = "a55f82cfe485775d02112886f4169bde0c5894d75e79ead7eafe7e40a25e45f7",
        strip_prefix = "addr2line-0.14.1",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.addr2line-0.14.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__adler__0_2_3",
        url = "https://crates.io/api/v1/crates/adler/0.2.3/download",
        type = "tar.gz",
        sha256 = "ee2a4ec343196209d6594e19543ae87a39f96d5534d7174822a3ad825dd6ed7e",
        strip_prefix = "adler-0.2.3",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.adler-0.2.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__adler32__1_2_0",
        url = "https://crates.io/api/v1/crates/adler32/1.2.0/download",
        type = "tar.gz",
        sha256 = "aae1277d39aeec15cb388266ecc24b11c80469deae6067e17a1a7aa9e5c1f234",
        strip_prefix = "adler32-1.2.0",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.adler32-1.2.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__ahash__0_4_7",
        url = "https://crates.io/api/v1/crates/ahash/0.4.7/download",
        type = "tar.gz",
        sha256 = "739f4a8db6605981345c5654f3a85b056ce52f37a39d34da03f25bf2151ea16e",
        strip_prefix = "ahash-0.4.7",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.ahash-0.4.7.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__aho_corasick__0_7_15",
        url = "https://crates.io/api/v1/crates/aho-corasick/0.7.15/download",
        type = "tar.gz",
        sha256 = "7404febffaa47dac81aa44dba71523c9d069b1bdc50a77db41195149e17f68e5",
        strip_prefix = "aho-corasick-0.7.15",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.aho-corasick-0.7.15.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__andrew__0_2_1",
        url = "https://crates.io/api/v1/crates/andrew/0.2.1/download",
        type = "tar.gz",
        sha256 = "9b7f09f89872c2b6b29e319377b1fbe91c6f5947df19a25596e121cf19a7b35e",
        strip_prefix = "andrew-0.2.1",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.andrew-0.2.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__android_glue__0_2_3",
        url = "https://crates.io/api/v1/crates/android_glue/0.2.3/download",
        type = "tar.gz",
        sha256 = "000444226fcff248f2bc4c7625be32c63caccfecc2723a2b9f78a7487a49c407",
        strip_prefix = "android_glue-0.2.3",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.android_glue-0.2.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__ansi_term__0_11_0",
        url = "https://crates.io/api/v1/crates/ansi_term/0.11.0/download",
        type = "tar.gz",
        sha256 = "ee49baf6cb617b853aa8d93bf420db2383fab46d314482ca2803b40d5fde979b",
        strip_prefix = "ansi_term-0.11.0",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.ansi_term-0.11.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__approx__0_3_2",
        url = "https://crates.io/api/v1/crates/approx/0.3.2/download",
        type = "tar.gz",
        sha256 = "f0e60b75072ecd4168020818c0107f2857bb6c4e64252d8d3983f6263b40a5c3",
        strip_prefix = "approx-0.3.2",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.approx-0.3.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__atty__0_2_14",
        url = "https://crates.io/api/v1/crates/atty/0.2.14/download",
        type = "tar.gz",
        sha256 = "d9b39be18770d11421cdb1b9947a45dd3f37e93092cbf377614828a319d5fee8",
        strip_prefix = "atty-0.2.14",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.atty-0.2.14.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__autocfg__1_0_1",
        url = "https://crates.io/api/v1/crates/autocfg/1.0.1/download",
        type = "tar.gz",
        sha256 = "cdb031dd78e28731d87d56cc8ffef4a8f36ca26c38fe2de700543e627f8a464a",
        strip_prefix = "autocfg-1.0.1",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.autocfg-1.0.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__backtrace__0_3_56",
        url = "https://crates.io/api/v1/crates/backtrace/0.3.56/download",
        type = "tar.gz",
        sha256 = "9d117600f438b1707d4e4ae15d3595657288f8235a0eb593e80ecc98ab34e1bc",
        strip_prefix = "backtrace-0.3.56",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.backtrace-0.3.56.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__base64__0_12_3",
        url = "https://crates.io/api/v1/crates/base64/0.12.3/download",
        type = "tar.gz",
        sha256 = "3441f0f7b02788e948e47f457ca01f1d7e6d92c693bc132c22b087d3141c03ff",
        strip_prefix = "base64-0.12.3",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.base64-0.12.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__bincode__1_3_1",
        url = "https://crates.io/api/v1/crates/bincode/1.3.1/download",
        type = "tar.gz",
        sha256 = "f30d3a39baa26f9651f17b375061f3233dde33424a8b72b0dbe93a68a0bc896d",
        strip_prefix = "bincode-1.3.1",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.bincode-1.3.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__bitflags__1_2_1",
        url = "https://crates.io/api/v1/crates/bitflags/1.2.1/download",
        type = "tar.gz",
        sha256 = "cf1de2fe8c75bc145a2f577add951f8134889b4795d47466a54a5c846d691693",
        strip_prefix = "bitflags-1.2.1",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.bitflags-1.2.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__block__0_1_6",
        url = "https://crates.io/api/v1/crates/block/0.1.6/download",
        type = "tar.gz",
        sha256 = "0d8c1fef690941d3e7788d328517591fecc684c084084702d6ff1641e993699a",
        strip_prefix = "block-0.1.6",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.block-0.1.6.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__block_buffer__0_7_3",
        url = "https://crates.io/api/v1/crates/block-buffer/0.7.3/download",
        type = "tar.gz",
        sha256 = "c0940dc441f31689269e10ac70eb1002a3a1d3ad1390e030043662eb7fe4688b",
        strip_prefix = "block-buffer-0.7.3",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.block-buffer-0.7.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__block_padding__0_1_5",
        url = "https://crates.io/api/v1/crates/block-padding/0.1.5/download",
        type = "tar.gz",
        sha256 = "fa79dedbb091f449f1f39e53edf88d5dbe95f895dae6135a8d7b881fb5af73f5",
        strip_prefix = "block-padding-0.1.5",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.block-padding-0.1.5.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__bstr__0_2_15",
        url = "https://crates.io/api/v1/crates/bstr/0.2.15/download",
        type = "tar.gz",
        sha256 = "a40b47ad93e1a5404e6c18dec46b628214fee441c70f4ab5d6942142cc268a3d",
        strip_prefix = "bstr-0.2.15",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.bstr-0.2.15.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__bumpalo__3_6_0",
        url = "https://crates.io/api/v1/crates/bumpalo/3.6.0/download",
        type = "tar.gz",
        sha256 = "099e596ef14349721d9016f6b80dd3419ea1bf289ab9b44df8e4dfd3a005d5d9",
        strip_prefix = "bumpalo-3.6.0",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.bumpalo-3.6.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__byte_tools__0_3_1",
        url = "https://crates.io/api/v1/crates/byte-tools/0.3.1/download",
        type = "tar.gz",
        sha256 = "e3b5ca7a04898ad4bcd41c90c5285445ff5b791899bb1b0abdd2a2aa791211d7",
        strip_prefix = "byte-tools-0.3.1",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.byte-tools-0.3.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__bytemuck__1_5_0",
        url = "https://crates.io/api/v1/crates/bytemuck/1.5.0/download",
        type = "tar.gz",
        sha256 = "5a4bad0c5981acc24bc09e532f35160f952e35422603f0563cd7a73c2c2e65a0",
        strip_prefix = "bytemuck-1.5.0",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.bytemuck-1.5.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__byteorder__1_4_2",
        url = "https://crates.io/api/v1/crates/byteorder/1.4.2/download",
        type = "tar.gz",
        sha256 = "ae44d1a3d5a19df61dd0c8beb138458ac2a53a7ac09eba97d55592540004306b",
        strip_prefix = "byteorder-1.4.2",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.byteorder-1.4.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__cc__1_0_66",
        url = "https://crates.io/api/v1/crates/cc/1.0.66/download",
        type = "tar.gz",
        sha256 = "4c0496836a84f8d0495758516b8621a622beb77c0fed418570e50764093ced48",
        strip_prefix = "cc-1.0.66",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.cc-1.0.66.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__cfg_if__0_1_10",
        url = "https://crates.io/api/v1/crates/cfg-if/0.1.10/download",
        type = "tar.gz",
        sha256 = "4785bdd1c96b2a846b2bd7cc02e86b6b3dbf14e7e53446c4f54c92a361040822",
        strip_prefix = "cfg-if-0.1.10",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.cfg-if-0.1.10.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__cfg_if__1_0_0",
        url = "https://crates.io/api/v1/crates/cfg-if/1.0.0/download",
        type = "tar.gz",
        sha256 = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd",
        strip_prefix = "cfg-if-1.0.0",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.cfg-if-1.0.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__cgl__0_2_3",
        url = "https://crates.io/api/v1/crates/cgl/0.2.3/download",
        type = "tar.gz",
        sha256 = "55e7ec0b74fe5897894cbc207092c577e87c52f8a59e8ca8d97ef37551f60a49",
        strip_prefix = "cgl-0.2.3",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.cgl-0.2.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__chrono__0_4_19",
        url = "https://crates.io/api/v1/crates/chrono/0.4.19/download",
        type = "tar.gz",
        sha256 = "670ad68c9088c2a963aaa298cb369688cf3f9465ce5e2d4ca10e6e0098a1ce73",
        strip_prefix = "chrono-0.4.19",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.chrono-0.4.19.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__chrono_tz__0_5_3",
        url = "https://crates.io/api/v1/crates/chrono-tz/0.5.3/download",
        type = "tar.gz",
        sha256 = "2554a3155fec064362507487171dcc4edc3df60cb10f3a1fb10ed8094822b120",
        strip_prefix = "chrono-tz-0.5.3",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.chrono-tz-0.5.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__clap__2_33_3",
        url = "https://crates.io/api/v1/crates/clap/2.33.3/download",
        type = "tar.gz",
        sha256 = "37e58ac78573c40708d45522f0d80fa2f01cc4f9b4e2bf749807255454312002",
        strip_prefix = "clap-2.33.3",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.clap-2.33.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__cloudabi__0_0_3",
        url = "https://crates.io/api/v1/crates/cloudabi/0.0.3/download",
        type = "tar.gz",
        sha256 = "ddfc5b9aa5d4507acaf872de71051dfd0e309860e88966e1051e462a077aac4f",
        strip_prefix = "cloudabi-0.0.3",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.cloudabi-0.0.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__cocoa__0_18_5",
        url = "https://crates.io/api/v1/crates/cocoa/0.18.5/download",
        type = "tar.gz",
        sha256 = "1706996401131526e36b3b49f0c4d912639ce110996f3ca144d78946727bce54",
        strip_prefix = "cocoa-0.18.5",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.cocoa-0.18.5.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__const_fn__0_4_5",
        url = "https://crates.io/api/v1/crates/const_fn/0.4.5/download",
        type = "tar.gz",
        sha256 = "28b9d6de7f49e22cf97ad17fc4036ece69300032f45f78f30b4a4482cdc3f4a6",
        strip_prefix = "const_fn-0.4.5",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.const_fn-0.4.5.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__core_foundation__0_6_4",
        url = "https://crates.io/api/v1/crates/core-foundation/0.6.4/download",
        type = "tar.gz",
        sha256 = "25b9e03f145fd4f2bf705e07b900cd41fc636598fe5dc452fd0db1441c3f496d",
        strip_prefix = "core-foundation-0.6.4",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.core-foundation-0.6.4.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__core_foundation_sys__0_6_2",
        url = "https://crates.io/api/v1/crates/core-foundation-sys/0.6.2/download",
        type = "tar.gz",
        sha256 = "e7ca8a5221364ef15ce201e8ed2f609fc312682a8f4e0e3d4aa5879764e0fa3b",
        strip_prefix = "core-foundation-sys-0.6.2",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.core-foundation-sys-0.6.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__core_graphics__0_17_3",
        url = "https://crates.io/api/v1/crates/core-graphics/0.17.3/download",
        type = "tar.gz",
        sha256 = "56790968ab1c8a1202a102e6de05fc6e1ec87da99e4e93e9a7d13efbfc1e95a9",
        strip_prefix = "core-graphics-0.17.3",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.core-graphics-0.17.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__crc32fast__1_2_1",
        url = "https://crates.io/api/v1/crates/crc32fast/1.2.1/download",
        type = "tar.gz",
        sha256 = "81156fece84ab6a9f2afdb109ce3ae577e42b1228441eded99bd77f627953b1a",
        strip_prefix = "crc32fast-1.2.1",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.crc32fast-1.2.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__crossbeam_channel__0_5_0",
        url = "https://crates.io/api/v1/crates/crossbeam-channel/0.5.0/download",
        type = "tar.gz",
        sha256 = "dca26ee1f8d361640700bde38b2c37d8c22b3ce2d360e1fc1c74ea4b0aa7d775",
        strip_prefix = "crossbeam-channel-0.5.0",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.crossbeam-channel-0.5.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__crossbeam_deque__0_8_0",
        url = "https://crates.io/api/v1/crates/crossbeam-deque/0.8.0/download",
        type = "tar.gz",
        sha256 = "94af6efb46fef72616855b036a624cf27ba656ffc9be1b9a3c931cfc7749a9a9",
        strip_prefix = "crossbeam-deque-0.8.0",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.crossbeam-deque-0.8.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__crossbeam_epoch__0_9_1",
        url = "https://crates.io/api/v1/crates/crossbeam-epoch/0.9.1/download",
        type = "tar.gz",
        sha256 = "a1aaa739f95311c2c7887a76863f500026092fb1dce0161dab577e559ef3569d",
        strip_prefix = "crossbeam-epoch-0.9.1",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.crossbeam-epoch-0.9.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__crossbeam_utils__0_8_1",
        url = "https://crates.io/api/v1/crates/crossbeam-utils/0.8.1/download",
        type = "tar.gz",
        sha256 = "02d96d1e189ef58269ebe5b97953da3274d83a93af647c2ddd6f9dab28cedb8d",
        strip_prefix = "crossbeam-utils-0.8.1",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.crossbeam-utils-0.8.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__deflate__0_8_6",
        url = "https://crates.io/api/v1/crates/deflate/0.8.6/download",
        type = "tar.gz",
        sha256 = "73770f8e1fe7d64df17ca66ad28994a0a623ea497fa69486e14984e715c5d174",
        strip_prefix = "deflate-0.8.6",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.deflate-0.8.6.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__deunicode__0_4_3",
        url = "https://crates.io/api/v1/crates/deunicode/0.4.3/download",
        type = "tar.gz",
        sha256 = "850878694b7933ca4c9569d30a34b55031b9b139ee1fc7b94a527c4ef960d690",
        strip_prefix = "deunicode-0.4.3",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.deunicode-0.4.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__digest__0_8_1",
        url = "https://crates.io/api/v1/crates/digest/0.8.1/download",
        type = "tar.gz",
        sha256 = "f3d0c8c8752312f9713efd397ff63acb9f85585afbf179282e720e7704954dd5",
        strip_prefix = "digest-0.8.1",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.digest-0.8.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__divrem__0_1_0",
        url = "https://crates.io/api/v1/crates/divrem/0.1.0/download",
        type = "tar.gz",
        sha256 = "bc9f8914dcb99891bdfee82536bbff8d9aa612b0dbe83872afbc66902bdec0b9",
        strip_prefix = "divrem-0.1.0",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.divrem-0.1.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__dlib__0_4_2",
        url = "https://crates.io/api/v1/crates/dlib/0.4.2/download",
        type = "tar.gz",
        sha256 = "b11f15d1e3268f140f68d390637d5e76d849782d971ae7063e0da69fe9709a76",
        strip_prefix = "dlib-0.4.2",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.dlib-0.4.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__downcast_rs__1_2_0",
        url = "https://crates.io/api/v1/crates/downcast-rs/1.2.0/download",
        type = "tar.gz",
        sha256 = "9ea835d29036a4087793836fa931b08837ad5e957da9e23886b29586fb9b6650",
        strip_prefix = "downcast-rs-1.2.0",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.downcast-rs-1.2.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__draw_state__0_8_0",
        url = "https://crates.io/api/v1/crates/draw_state/0.8.0/download",
        type = "tar.gz",
        sha256 = "33cf9537e2d06891448799b96d5a8c8083e0e90522a7fdabe6ebf4f41d79d651",
        strip_prefix = "draw_state-0.8.0",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.draw_state-0.8.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__either__1_6_1",
        url = "https://crates.io/api/v1/crates/either/1.6.1/download",
        type = "tar.gz",
        sha256 = "e78d4f1cc4ae33bbfc157ed5d5a5ef3bc29227303d595861deb238fcec4e9457",
        strip_prefix = "either-1.6.1",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.either-1.6.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__fake_simd__0_1_2",
        url = "https://crates.io/api/v1/crates/fake-simd/0.1.2/download",
        type = "tar.gz",
        sha256 = "e88a8acf291dafb59c2d96e8f59828f3838bb1a70398823ade51a84de6a6deed",
        strip_prefix = "fake-simd-0.1.2",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.fake-simd-0.1.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__fallible_collections__0_4_0",
        url = "https://crates.io/api/v1/crates/fallible_collections/0.4.0/download",
        type = "tar.gz",
        sha256 = "74bebf0efe2e883c1619c455e3f1764333064694ebd5125d2faddabfb5963186",
        strip_prefix = "fallible_collections-0.4.0",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.fallible_collections-0.4.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__fixedbitset__0_2_0",
        url = "https://crates.io/api/v1/crates/fixedbitset/0.2.0/download",
        type = "tar.gz",
        sha256 = "37ab347416e802de484e4d03c7316c48f1ecb56574dfd4a46a80f173ce1de04d",
        strip_prefix = "fixedbitset-0.2.0",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.fixedbitset-0.2.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__flate2__1_0_20",
        url = "https://crates.io/api/v1/crates/flate2/1.0.20/download",
        type = "tar.gz",
        sha256 = "cd3aec53de10fe96d7d8c565eb17f2c687bb5518a2ec453b5b1252964526abe0",
        strip_prefix = "flate2-1.0.20",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.flate2-1.0.20.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__fnv__1_0_7",
        url = "https://crates.io/api/v1/crates/fnv/1.0.7/download",
        type = "tar.gz",
        sha256 = "3f9eec918d3f24069decb9af1554cad7c880e2da24a9afd88aca000531ab82c1",
        strip_prefix = "fnv-1.0.7",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.fnv-1.0.7.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__foreign_types__0_3_2",
        url = "https://crates.io/api/v1/crates/foreign-types/0.3.2/download",
        type = "tar.gz",
        sha256 = "f6f339eb8adc052cd2ca78910fda869aefa38d22d5cb648e6485e4d3fc06f3b1",
        strip_prefix = "foreign-types-0.3.2",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.foreign-types-0.3.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__foreign_types_shared__0_1_1",
        url = "https://crates.io/api/v1/crates/foreign-types-shared/0.1.1/download",
        type = "tar.gz",
        sha256 = "00b0228411908ca8685dba7fc2cdd70ec9990a6e753e89b6ac91a84c40fbaf4b",
        strip_prefix = "foreign-types-shared-0.1.1",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.foreign-types-shared-0.1.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__form_urlencoded__1_0_0",
        url = "https://crates.io/api/v1/crates/form_urlencoded/1.0.0/download",
        type = "tar.gz",
        sha256 = "ece68d15c92e84fa4f19d3780f1294e5ca82a78a6d515f1efaabcc144688be00",
        strip_prefix = "form_urlencoded-1.0.0",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.form_urlencoded-1.0.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__futures__0_1_30",
        url = "https://crates.io/api/v1/crates/futures/0.1.30/download",
        type = "tar.gz",
        sha256 = "4c7e4c2612746b0df8fed4ce0c69156021b704c9aefa360311c04e6e9e002eed",
        strip_prefix = "futures-0.1.30",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.futures-0.1.30.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__generic_array__0_12_3",
        url = "https://crates.io/api/v1/crates/generic-array/0.12.3/download",
        type = "tar.gz",
        sha256 = "c68f0274ae0e023facc3c97b2e00f076be70e254bc851d972503b328db79b2ec",
        strip_prefix = "generic-array-0.12.3",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.generic-array-0.12.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__getopts__0_2_21",
        url = "https://crates.io/api/v1/crates/getopts/0.2.21/download",
        type = "tar.gz",
        sha256 = "14dbbfd5c71d70241ecf9e6f13737f7b5ce823821063188d7e46c41d371eebd5",
        strip_prefix = "getopts-0.2.21",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.getopts-0.2.21.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__getrandom__0_1_16",
        url = "https://crates.io/api/v1/crates/getrandom/0.1.16/download",
        type = "tar.gz",
        sha256 = "8fc3cb4d91f53b50155bdcfd23f6a4c39ae1969c2ae85982b135750cccaf5fce",
        strip_prefix = "getrandom-0.1.16",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.getrandom-0.1.16.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__getrandom__0_2_2",
        url = "https://crates.io/api/v1/crates/getrandom/0.2.2/download",
        type = "tar.gz",
        sha256 = "c9495705279e7140bf035dde1f6e750c162df8b625267cd52cc44e0b156732c8",
        strip_prefix = "getrandom-0.2.2",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.getrandom-0.2.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__gfx__0_18_2",
        url = "https://crates.io/api/v1/crates/gfx/0.18.2/download",
        type = "tar.gz",
        sha256 = "01de46f9508a5c259aef105f0bff760ceddca832ea9c87ce03d1923e22ee155b",
        strip_prefix = "gfx-0.18.2",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.gfx-0.18.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__gfx_core__0_9_2",
        url = "https://crates.io/api/v1/crates/gfx_core/0.9.2/download",
        type = "tar.gz",
        sha256 = "75fbddaef2e12b4995900539d7209d947b988a3d87ee8737484d049b526e5441",
        strip_prefix = "gfx_core-0.9.2",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.gfx_core-0.9.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__gfx_device_gl__0_16_2",
        url = "https://crates.io/api/v1/crates/gfx_device_gl/0.16.2/download",
        type = "tar.gz",
        sha256 = "109c385fa380c18888633aa27d1e16cbae518469702a2f69dcb5f52d5378bebc",
        strip_prefix = "gfx_device_gl-0.16.2",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.gfx_device_gl-0.16.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__gfx_gl__0_6_1",
        url = "https://crates.io/api/v1/crates/gfx_gl/0.6.1/download",
        type = "tar.gz",
        sha256 = "f2d38164670920cfb7491bc0cf6f49f0554bd1c44cdbedc6c78d2bf91691ff5e",
        strip_prefix = "gfx_gl-0.6.1",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.gfx_gl-0.6.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__gfx_window_glutin__0_31_0",
        url = "https://crates.io/api/v1/crates/gfx_window_glutin/0.31.0/download",
        type = "tar.gz",
        sha256 = "310ff66f08b5a55854b18fea2f48bdbb75c94458207ba574c9723be78e97a646",
        strip_prefix = "gfx_window_glutin-0.31.0",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.gfx_window_glutin-0.31.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__gimli__0_23_0",
        url = "https://crates.io/api/v1/crates/gimli/0.23.0/download",
        type = "tar.gz",
        sha256 = "f6503fe142514ca4799d4c26297c4248239fe8838d827db6bd6065c6ed29a6ce",
        strip_prefix = "gimli-0.23.0",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.gimli-0.23.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__git2__0_13_17",
        url = "https://crates.io/api/v1/crates/git2/0.13.17/download",
        type = "tar.gz",
        sha256 = "1d250f5f82326884bd39c2853577e70a121775db76818ffa452ed1e80de12986",
        strip_prefix = "git2-0.13.17",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.git2-0.13.17.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__gl_generator__0_13_1",
        url = "https://crates.io/api/v1/crates/gl_generator/0.13.1/download",
        type = "tar.gz",
        sha256 = "ca98bbde17256e02d17336a6bdb5a50f7d0ccacee502e191d3e3d0ec2f96f84a",
        strip_prefix = "gl_generator-0.13.1",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.gl_generator-0.13.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__gl_generator__0_14_0",
        url = "https://crates.io/api/v1/crates/gl_generator/0.14.0/download",
        type = "tar.gz",
        sha256 = "1a95dfc23a2b4a9a2f5ab41d194f8bfda3cabec42af4e39f08c339eb2a0c124d",
        strip_prefix = "gl_generator-0.14.0",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.gl_generator-0.14.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__gleam__0_6_19",
        url = "https://crates.io/api/v1/crates/gleam/0.6.19/download",
        type = "tar.gz",
        sha256 = "cae10d7c99d0e77b4766e850a60898a17c1abaf01075531f1066f03dc7dc5fc5",
        strip_prefix = "gleam-0.6.19",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.gleam-0.6.19.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__globset__0_4_6",
        url = "https://crates.io/api/v1/crates/globset/0.4.6/download",
        type = "tar.gz",
        sha256 = "c152169ef1e421390738366d2f796655fec62621dabbd0fd476f905934061e4a",
        strip_prefix = "globset-0.4.6",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.globset-0.4.6.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__globwalk__0_8_1",
        url = "https://crates.io/api/v1/crates/globwalk/0.8.1/download",
        type = "tar.gz",
        sha256 = "93e3af942408868f6934a7b85134a3230832b9977cf66125df2f9edcfce4ddcc",
        strip_prefix = "globwalk-0.8.1",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.globwalk-0.8.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__glutin__0_21_2",
        url = "https://crates.io/api/v1/crates/glutin/0.21.2/download",
        type = "tar.gz",
        sha256 = "5371b35b309dace06be1b81b5f6adb1c9de578b7dbe1e74bf7e4ef762cf6febd",
        strip_prefix = "glutin-0.21.2",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.glutin-0.21.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__glutin_egl_sys__0_1_5",
        url = "https://crates.io/api/v1/crates/glutin_egl_sys/0.1.5/download",
        type = "tar.gz",
        sha256 = "2abb6aa55523480c4adc5a56bbaa249992e2dddb2fc63dc96e04a3355364c211",
        strip_prefix = "glutin_egl_sys-0.1.5",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.glutin_egl_sys-0.1.5.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__glutin_emscripten_sys__0_1_1",
        url = "https://crates.io/api/v1/crates/glutin_emscripten_sys/0.1.1/download",
        type = "tar.gz",
        sha256 = "80de4146df76e8a6c32b03007bc764ff3249dcaeb4f675d68a06caf1bac363f1",
        strip_prefix = "glutin_emscripten_sys-0.1.1",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.glutin_emscripten_sys-0.1.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__glutin_gles2_sys__0_1_5",
        url = "https://crates.io/api/v1/crates/glutin_gles2_sys/0.1.5/download",
        type = "tar.gz",
        sha256 = "e8094e708b730a7c8a1954f4f8a31880af00eb8a1c5b5bf85d28a0a3c6d69103",
        strip_prefix = "glutin_gles2_sys-0.1.5",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.glutin_gles2_sys-0.1.5.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__glutin_glx_sys__0_1_7",
        url = "https://crates.io/api/v1/crates/glutin_glx_sys/0.1.7/download",
        type = "tar.gz",
        sha256 = "7e393c8fc02b807459410429150e9c4faffdb312d59b8c038566173c81991351",
        strip_prefix = "glutin_glx_sys-0.1.7",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.glutin_glx_sys-0.1.7.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__glutin_wgl_sys__0_1_5",
        url = "https://crates.io/api/v1/crates/glutin_wgl_sys/0.1.5/download",
        type = "tar.gz",
        sha256 = "3da5951a1569dbab865c6f2a863efafff193a93caf05538d193e9e3816d21696",
        strip_prefix = "glutin_wgl_sys-0.1.5",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.glutin_wgl_sys-0.1.5.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__guard__0_5_0",
        url = "https://crates.io/api/v1/crates/guard/0.5.0/download",
        type = "tar.gz",
        sha256 = "e1f3d64ec55b293a2ddfee276c6d7733616925b55dd337ddc0dc83aba96fbbb1",
        strip_prefix = "guard-0.5.0",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.guard-0.5.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__hashbrown__0_9_1",
        url = "https://crates.io/api/v1/crates/hashbrown/0.9.1/download",
        type = "tar.gz",
        sha256 = "d7afe4a420e3fe79967a00898cc1f4db7c8a49a9333a29f8a4bd76a253d5cd04",
        strip_prefix = "hashbrown-0.9.1",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.hashbrown-0.9.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__heck__0_3_2",
        url = "https://crates.io/api/v1/crates/heck/0.3.2/download",
        type = "tar.gz",
        sha256 = "87cbf45460356b7deeb5e3415b5563308c0a9b057c85e12b06ad551f98d0a6ac",
        strip_prefix = "heck-0.3.2",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.heck-0.3.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__hermit_abi__0_1_18",
        url = "https://crates.io/api/v1/crates/hermit-abi/0.1.18/download",
        type = "tar.gz",
        sha256 = "322f4de77956e22ed0e5032c359a0f1273f1f7f0d79bfa3b8ffbc730d7fbcc5c",
        strip_prefix = "hermit-abi-0.1.18",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.hermit-abi-0.1.18.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__humansize__1_1_0",
        url = "https://crates.io/api/v1/crates/humansize/1.1.0/download",
        type = "tar.gz",
        sha256 = "b6cab2627acfc432780848602f3f558f7e9dd427352224b0d9324025796d2a5e",
        strip_prefix = "humansize-1.1.0",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.humansize-1.1.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__idna__0_2_1",
        url = "https://crates.io/api/v1/crates/idna/0.2.1/download",
        type = "tar.gz",
        sha256 = "de910d521f7cc3135c4de8db1cb910e0b5ed1dc6f57c381cd07e8e661ce10094",
        strip_prefix = "idna-0.2.1",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.idna-0.2.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__ignore__0_4_17",
        url = "https://crates.io/api/v1/crates/ignore/0.4.17/download",
        type = "tar.gz",
        sha256 = "b287fb45c60bb826a0dc68ff08742b9d88a2fea13d6e0c286b3172065aaf878c",
        strip_prefix = "ignore-0.4.17",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.ignore-0.4.17.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__imgui__0_2_1",
        url = "https://crates.io/api/v1/crates/imgui/0.2.1/download",
        type = "tar.gz",
        sha256 = "e70a1b421ac503e94009cc9bcd6ed256f6bf38ced98d841b095da6b94ea67702",
        strip_prefix = "imgui-0.2.1",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.imgui-0.2.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__imgui_gfx_renderer__0_2_0",
        url = "https://crates.io/api/v1/crates/imgui-gfx-renderer/0.2.0/download",
        type = "tar.gz",
        sha256 = "3637284fef18e3ace53d4c57add0e4fa7d3cf58dc8abaa4ca1dab9360a992989",
        strip_prefix = "imgui-gfx-renderer-0.2.0",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.imgui-gfx-renderer-0.2.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__imgui_sys__0_2_0",
        url = "https://crates.io/api/v1/crates/imgui-sys/0.2.0/download",
        type = "tar.gz",
        sha256 = "0350b22f0a64eeb852ed3995ddb5d6d24bd3038024d2bd81720a6573baa602dc",
        strip_prefix = "imgui-sys-0.2.0",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.imgui-sys-0.2.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__indexmap__1_6_1",
        url = "https://crates.io/api/v1/crates/indexmap/1.6.1/download",
        type = "tar.gz",
        sha256 = "4fb1fa934250de4de8aef298d81c729a7d33d8c239daa3a7575e6b92bfc7313b",
        strip_prefix = "indexmap-1.6.1",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.indexmap-1.6.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__inflate__0_4_5",
        url = "https://crates.io/api/v1/crates/inflate/0.4.5/download",
        type = "tar.gz",
        sha256 = "1cdb29978cc5797bd8dcc8e5bf7de604891df2a8dc576973d71a281e916db2ff",
        strip_prefix = "inflate-0.4.5",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.inflate-0.4.5.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__itoa__0_4_7",
        url = "https://crates.io/api/v1/crates/itoa/0.4.7/download",
        type = "tar.gz",
        sha256 = "dd25036021b0de88a0aff6b850051563c6516d0bf53f8638938edbb9de732736",
        strip_prefix = "itoa-0.4.7",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.itoa-0.4.7.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__jobserver__0_1_21",
        url = "https://crates.io/api/v1/crates/jobserver/0.1.21/download",
        type = "tar.gz",
        sha256 = "5c71313ebb9439f74b00d9d2dcec36440beaf57a6aa0623068441dd7cd81a7f2",
        strip_prefix = "jobserver-0.1.21",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.jobserver-0.1.21.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__jsonrpc_core__14_2_0",
        url = "https://crates.io/api/v1/crates/jsonrpc-core/14.2.0/download",
        type = "tar.gz",
        sha256 = "a0747307121ffb9703afd93afbd0fb4f854c38fb873f2c8b90e0e902f27c7b62",
        strip_prefix = "jsonrpc-core-14.2.0",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.jsonrpc-core-14.2.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__khronos_api__3_1_0",
        url = "https://crates.io/api/v1/crates/khronos_api/3.1.0/download",
        type = "tar.gz",
        sha256 = "e2db585e1d738fc771bf08a151420d3ed193d9d895a36df7f6f8a9456b911ddc",
        strip_prefix = "khronos_api-3.1.0",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.khronos_api-3.1.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__lazy_static__1_4_0",
        url = "https://crates.io/api/v1/crates/lazy_static/1.4.0/download",
        type = "tar.gz",
        sha256 = "e2abad23fbc42b3700f2f279844dc832adb2b2eb069b2df918f455c4e18cc646",
        strip_prefix = "lazy_static-1.4.0",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.lazy_static-1.4.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__libc__0_2_86",
        url = "https://crates.io/api/v1/crates/libc/0.2.86/download",
        type = "tar.gz",
        sha256 = "b7282d924be3275cec7f6756ff4121987bc6481325397dde6ba3e7802b1a8b1c",
        strip_prefix = "libc-0.2.86",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.libc-0.2.86.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__libgit2_sys__0_12_18_1_1_0",
        url = "https://crates.io/api/v1/crates/libgit2-sys/0.12.18+1.1.0/download",
        type = "tar.gz",
        sha256 = "3da6a42da88fc37ee1ecda212ffa254c25713532980005d5f7c0b0fbe7e6e885",
        strip_prefix = "libgit2-sys-0.12.18+1.1.0",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.libgit2-sys-0.12.18+1.1.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__libloading__0_5_2",
        url = "https://crates.io/api/v1/crates/libloading/0.5.2/download",
        type = "tar.gz",
        sha256 = "f2b111a074963af1d37a139918ac6d49ad1d0d5e47f72fd55388619691a7d753",
        strip_prefix = "libloading-0.5.2",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.libloading-0.5.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__libloading__0_6_7",
        url = "https://crates.io/api/v1/crates/libloading/0.6.7/download",
        type = "tar.gz",
        sha256 = "351a32417a12d5f7e82c368a66781e307834dae04c6ce0cd4456d52989229883",
        strip_prefix = "libloading-0.6.7",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.libloading-0.6.7.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__libz_sys__1_1_2",
        url = "https://crates.io/api/v1/crates/libz-sys/1.1.2/download",
        type = "tar.gz",
        sha256 = "602113192b08db8f38796c4e85c39e960c145965140e918018bcde1952429655",
        strip_prefix = "libz-sys-1.1.2",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.libz-sys-1.1.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__line_drawing__0_7_0",
        url = "https://crates.io/api/v1/crates/line_drawing/0.7.0/download",
        type = "tar.gz",
        sha256 = "5cc7ad3d82c845bdb5dde34ffdcc7a5fb4d2996e1e1ee0f19c33bc80e15196b9",
        strip_prefix = "line_drawing-0.7.0",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.line_drawing-0.7.0.bazel"),
    )

    maybe(
        new_git_repository,
        name = "raze__linked_hash_map__0_5_2",
        remote = "https://github.com/SpaceManiac/linked-hash-map",
        commit = "7e6de06f9817fbb17a257af3777b0852f46cb894",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.linked-hash-map-0.5.2.bazel"),
        init_submodules = True,
    )

    maybe(
        http_archive,
        name = "raze__lock_api__0_3_4",
        url = "https://crates.io/api/v1/crates/lock_api/0.3.4/download",
        type = "tar.gz",
        sha256 = "c4da24a77a3d8a6d4862d95f72e6fdb9c09a643ecdb402d754004a557f2bec75",
        strip_prefix = "lock_api-0.3.4",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.lock_api-0.3.4.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__lodepng__3_4_3",
        url = "https://crates.io/api/v1/crates/lodepng/3.4.3/download",
        type = "tar.gz",
        sha256 = "11443d177d97dc468ee5cc956769bbdeb4c20707d443c62dfd8b473505365613",
        strip_prefix = "lodepng-3.4.3",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.lodepng-3.4.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__log__0_4_14",
        url = "https://crates.io/api/v1/crates/log/0.4.14/download",
        type = "tar.gz",
        sha256 = "51b9bbe6c47d51fc3e1a9b945965946b4c44142ab8792c50835a980d362c2710",
        strip_prefix = "log-0.4.14",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.log-0.4.14.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__lsp_types__0_80_0",
        url = "https://crates.io/api/v1/crates/lsp-types/0.80.0/download",
        type = "tar.gz",
        sha256 = "f4265e2715bdacbb4dad029fce525e420cd66dc0af24ff9cb996a8ab48ac92ef",
        strip_prefix = "lsp-types-0.80.0",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.lsp-types-0.80.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__malloc_buf__0_0_6",
        url = "https://crates.io/api/v1/crates/malloc_buf/0.0.6/download",
        type = "tar.gz",
        sha256 = "62bb907fe88d54d8d9ce32a3cceab4218ed2f6b7d35617cafe9adf84e43919cb",
        strip_prefix = "malloc_buf-0.0.6",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.malloc_buf-0.0.6.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__maplit__1_0_2",
        url = "https://crates.io/api/v1/crates/maplit/1.0.2/download",
        type = "tar.gz",
        sha256 = "3e2e65a1a2e43cfcb47a895c4c8b10d1f4a61097f9f254f183aee60cad9c651d",
        strip_prefix = "maplit-1.0.2",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.maplit-1.0.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__matches__0_1_8",
        url = "https://crates.io/api/v1/crates/matches/0.1.8/download",
        type = "tar.gz",
        sha256 = "7ffc5c5338469d4d3ea17d269fa8ea3512ad247247c30bd2df69e68309ed0a08",
        strip_prefix = "matches-0.1.8",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.matches-0.1.8.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__matrixmultiply__0_2_4",
        url = "https://crates.io/api/v1/crates/matrixmultiply/0.2.4/download",
        type = "tar.gz",
        sha256 = "916806ba0031cd542105d916a97c8572e1fa6dd79c9c51e7eb43a09ec2dd84c1",
        strip_prefix = "matrixmultiply-0.2.4",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.matrixmultiply-0.2.4.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__maybe_uninit__2_0_0",
        url = "https://crates.io/api/v1/crates/maybe-uninit/2.0.0/download",
        type = "tar.gz",
        sha256 = "60302e4db3a61da70c0cb7991976248362f30319e88850c487b9b95bbf059e00",
        strip_prefix = "maybe-uninit-2.0.0",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.maybe-uninit-2.0.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__memchr__2_3_4",
        url = "https://crates.io/api/v1/crates/memchr/2.3.4/download",
        type = "tar.gz",
        sha256 = "0ee1c47aaa256ecabcaea351eae4a9b01ef39ed810004e298d2511ed284b1525",
        strip_prefix = "memchr-2.3.4",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.memchr-2.3.4.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__memmap__0_7_0",
        url = "https://crates.io/api/v1/crates/memmap/0.7.0/download",
        type = "tar.gz",
        sha256 = "6585fd95e7bb50d6cc31e20d4cf9afb4e2ba16c5846fc76793f11218da9c475b",
        strip_prefix = "memmap-0.7.0",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.memmap-0.7.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__memoffset__0_6_1",
        url = "https://crates.io/api/v1/crates/memoffset/0.6.1/download",
        type = "tar.gz",
        sha256 = "157b4208e3059a8f9e78d559edc658e13df41410cb3ae03979c83130067fdd87",
        strip_prefix = "memoffset-0.6.1",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.memoffset-0.6.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__miniz_oxide__0_3_7",
        url = "https://crates.io/api/v1/crates/miniz_oxide/0.3.7/download",
        type = "tar.gz",
        sha256 = "791daaae1ed6889560f8c4359194f56648355540573244a5448a83ba1ecc7435",
        strip_prefix = "miniz_oxide-0.3.7",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.miniz_oxide-0.3.7.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__miniz_oxide__0_4_3",
        url = "https://crates.io/api/v1/crates/miniz_oxide/0.4.3/download",
        type = "tar.gz",
        sha256 = "0f2d26ec3309788e423cfbf68ad1800f061638098d76a83681af979dc4eda19d",
        strip_prefix = "miniz_oxide-0.4.3",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.miniz_oxide-0.4.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__ndarray__0_13_1",
        url = "https://crates.io/api/v1/crates/ndarray/0.13.1/download",
        type = "tar.gz",
        sha256 = "ac06db03ec2f46ee0ecdca1a1c34a99c0d188a0d83439b84bf0cb4b386e4ab09",
        strip_prefix = "ndarray-0.13.1",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.ndarray-0.13.1.bazel"),
    )

    maybe(
        new_git_repository,
        name = "raze__nfd__0_0_4",
        remote = "https://github.com/SpaceManiac/nfd-rs",
        commit = "d9ae53d9f375f38fc2fff71b8ccf0dc7fb039322",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.nfd-0.0.4.bazel"),
        init_submodules = True,
    )

    maybe(
        http_archive,
        name = "raze__nix__0_14_1",
        url = "https://crates.io/api/v1/crates/nix/0.14.1/download",
        type = "tar.gz",
        sha256 = "6c722bee1037d430d0f8e687bbdbf222f27cc6e4e68d5caf630857bb2b6dbdce",
        strip_prefix = "nix-0.14.1",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.nix-0.14.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__num_complex__0_2_4",
        url = "https://crates.io/api/v1/crates/num-complex/0.2.4/download",
        type = "tar.gz",
        sha256 = "b6b19411a9719e753aff12e5187b74d60d3dc449ec3f4dc21e3989c3f554bc95",
        strip_prefix = "num-complex-0.2.4",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.num-complex-0.2.4.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__num_integer__0_1_44",
        url = "https://crates.io/api/v1/crates/num-integer/0.1.44/download",
        type = "tar.gz",
        sha256 = "d2cc698a63b549a70bc047073d2949cce27cd1c7b0a4a862d08a8031bc2801db",
        strip_prefix = "num-integer-0.1.44",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.num-integer-0.1.44.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__num_traits__0_2_14",
        url = "https://crates.io/api/v1/crates/num-traits/0.2.14/download",
        type = "tar.gz",
        sha256 = "9a64b1ec5cda2586e284722486d802acf1f7dbdc623e2bfc57e65ca1cd099290",
        strip_prefix = "num-traits-0.2.14",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.num-traits-0.2.14.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__num_cpus__1_13_0",
        url = "https://crates.io/api/v1/crates/num_cpus/1.13.0/download",
        type = "tar.gz",
        sha256 = "05499f3756671c15885fee9034446956fff3f243d6077b91e5767df161f766b3",
        strip_prefix = "num_cpus-1.13.0",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.num_cpus-1.13.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__objc__0_2_7",
        url = "https://crates.io/api/v1/crates/objc/0.2.7/download",
        type = "tar.gz",
        sha256 = "915b1b472bc21c53464d6c8461c9d3af805ba1ef837e1cac254428f4a77177b1",
        strip_prefix = "objc-0.2.7",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.objc-0.2.7.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__object__0_23_0",
        url = "https://crates.io/api/v1/crates/object/0.23.0/download",
        type = "tar.gz",
        sha256 = "a9a7ab5d64814df0fe4a4b5ead45ed6c5f181ee3ff04ba344313a6c80446c5d4",
        strip_prefix = "object-0.23.0",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.object-0.23.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__once_cell__1_5_2",
        url = "https://crates.io/api/v1/crates/once_cell/1.5.2/download",
        type = "tar.gz",
        sha256 = "13bd41f508810a131401606d54ac32a467c97172d74ba7662562ebba5ad07fa0",
        strip_prefix = "once_cell-1.5.2",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.once_cell-1.5.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__opaque_debug__0_2_3",
        url = "https://crates.io/api/v1/crates/opaque-debug/0.2.3/download",
        type = "tar.gz",
        sha256 = "2839e79665f131bdb5782e51f2c6c9599c133c6098982a54c794358bf432529c",
        strip_prefix = "opaque-debug-0.2.3",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.opaque-debug-0.2.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__ordered_float__1_1_1",
        url = "https://crates.io/api/v1/crates/ordered-float/1.1.1/download",
        type = "tar.gz",
        sha256 = "3305af35278dd29f46fcdd139e0b1fbfae2153f0e5928b39b035542dd31e37b7",
        strip_prefix = "ordered-float-1.1.1",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.ordered-float-1.1.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__ordered_float__2_1_1",
        url = "https://crates.io/api/v1/crates/ordered-float/2.1.1/download",
        type = "tar.gz",
        sha256 = "766f840da25490628d8e63e529cd21c014f6600c6b8517add12a6fa6167a6218",
        strip_prefix = "ordered-float-2.1.1",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.ordered-float-2.1.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__osmesa_sys__0_1_2",
        url = "https://crates.io/api/v1/crates/osmesa-sys/0.1.2/download",
        type = "tar.gz",
        sha256 = "88cfece6e95d2e717e0872a7f53a8684712ad13822a7979bc760b9c77ec0013b",
        strip_prefix = "osmesa-sys-0.1.2",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.osmesa-sys-0.1.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__parking_lot__0_9_0",
        url = "https://crates.io/api/v1/crates/parking_lot/0.9.0/download",
        type = "tar.gz",
        sha256 = "f842b1982eb6c2fe34036a4fbfb06dd185a3f5c8edfaacdf7d1ea10b07de6252",
        strip_prefix = "parking_lot-0.9.0",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.parking_lot-0.9.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__parking_lot_core__0_6_2",
        url = "https://crates.io/api/v1/crates/parking_lot_core/0.6.2/download",
        type = "tar.gz",
        sha256 = "b876b1b9e7ac6e1a74a6da34d25c42e17e8862aa409cbbbdcfc8d86c6f3bc62b",
        strip_prefix = "parking_lot_core-0.6.2",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.parking_lot_core-0.6.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__parse_zoneinfo__0_3_0",
        url = "https://crates.io/api/v1/crates/parse-zoneinfo/0.3.0/download",
        type = "tar.gz",
        sha256 = "c705f256449c60da65e11ff6626e0c16a0a0b96aaa348de61376b249bc340f41",
        strip_prefix = "parse-zoneinfo-0.3.0",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.parse-zoneinfo-0.3.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__percent_encoding__2_1_0",
        url = "https://crates.io/api/v1/crates/percent-encoding/2.1.0/download",
        type = "tar.gz",
        sha256 = "d4fd5641d01c8f18a23da7b6fe29298ff4b55afcccdf78973b24cf3175fee32e",
        strip_prefix = "percent-encoding-2.1.0",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.percent-encoding-2.1.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__pest__2_1_3",
        url = "https://crates.io/api/v1/crates/pest/2.1.3/download",
        type = "tar.gz",
        sha256 = "10f4872ae94d7b90ae48754df22fd42ad52ce740b8f370b03da4835417403e53",
        strip_prefix = "pest-2.1.3",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.pest-2.1.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__pest_derive__2_1_0",
        url = "https://crates.io/api/v1/crates/pest_derive/2.1.0/download",
        type = "tar.gz",
        sha256 = "833d1ae558dc601e9a60366421196a8d94bc0ac980476d0b67e1d0988d72b2d0",
        strip_prefix = "pest_derive-2.1.0",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.pest_derive-2.1.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__pest_generator__2_1_3",
        url = "https://crates.io/api/v1/crates/pest_generator/2.1.3/download",
        type = "tar.gz",
        sha256 = "99b8db626e31e5b81787b9783425769681b347011cc59471e33ea46d2ea0cf55",
        strip_prefix = "pest_generator-2.1.3",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.pest_generator-2.1.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__pest_meta__2_1_3",
        url = "https://crates.io/api/v1/crates/pest_meta/2.1.3/download",
        type = "tar.gz",
        sha256 = "54be6e404f5317079812fc8f9f5279de376d8856929e21c184ecf6bbd692a11d",
        strip_prefix = "pest_meta-2.1.3",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.pest_meta-2.1.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__petgraph__0_5_1",
        url = "https://crates.io/api/v1/crates/petgraph/0.5.1/download",
        type = "tar.gz",
        sha256 = "467d164a6de56270bd7c4d070df81d07beace25012d5103ced4e9ff08d6afdb7",
        strip_prefix = "petgraph-0.5.1",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.petgraph-0.5.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__phf__0_8_0",
        url = "https://crates.io/api/v1/crates/phf/0.8.0/download",
        type = "tar.gz",
        sha256 = "3dfb61232e34fcb633f43d12c58f83c1df82962dcdfa565a4e866ffc17dafe12",
        strip_prefix = "phf-0.8.0",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.phf-0.8.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__phf_generator__0_8_0",
        url = "https://crates.io/api/v1/crates/phf_generator/0.8.0/download",
        type = "tar.gz",
        sha256 = "17367f0cc86f2d25802b2c26ee58a7b23faeccf78a396094c13dced0d0182526",
        strip_prefix = "phf_generator-0.8.0",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.phf_generator-0.8.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__phf_macros__0_8_0",
        url = "https://crates.io/api/v1/crates/phf_macros/0.8.0/download",
        type = "tar.gz",
        sha256 = "7f6fde18ff429ffc8fe78e2bf7f8b7a5a5a6e2a8b58bc5a9ac69198bbda9189c",
        strip_prefix = "phf_macros-0.8.0",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.phf_macros-0.8.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__phf_shared__0_8_0",
        url = "https://crates.io/api/v1/crates/phf_shared/0.8.0/download",
        type = "tar.gz",
        sha256 = "c00cf8b9eafe68dde5e9eaa2cef8ee84a9336a47d566ec55ca16589633b65af7",
        strip_prefix = "phf_shared-0.8.0",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.phf_shared-0.8.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__pkg_config__0_3_19",
        url = "https://crates.io/api/v1/crates/pkg-config/0.3.19/download",
        type = "tar.gz",
        sha256 = "3831453b3449ceb48b6d9c7ad7c96d5ea673e9b470a1dc578c2ce6521230884c",
        strip_prefix = "pkg-config-0.3.19",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.pkg-config-0.3.19.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__png__0_16_8",
        url = "https://crates.io/api/v1/crates/png/0.16.8/download",
        type = "tar.gz",
        sha256 = "3c3287920cb847dee3de33d301c463fba14dda99db24214ddf93f83d3021f4c6",
        strip_prefix = "png-0.16.8",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.png-0.16.8.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__ppv_lite86__0_2_10",
        url = "https://crates.io/api/v1/crates/ppv-lite86/0.2.10/download",
        type = "tar.gz",
        sha256 = "ac74c624d6b2d21f425f752262f42188365d7b8ff1aff74c82e45136510a4857",
        strip_prefix = "ppv-lite86-0.2.10",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.ppv-lite86-0.2.10.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__proc_macro_error__1_0_4",
        url = "https://crates.io/api/v1/crates/proc-macro-error/1.0.4/download",
        type = "tar.gz",
        sha256 = "da25490ff9892aab3fcf7c36f08cfb902dd3e71ca0f9f9517bea02a73a5ce38c",
        strip_prefix = "proc-macro-error-1.0.4",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.proc-macro-error-1.0.4.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__proc_macro_error_attr__1_0_4",
        url = "https://crates.io/api/v1/crates/proc-macro-error-attr/1.0.4/download",
        type = "tar.gz",
        sha256 = "a1be40180e52ecc98ad80b184934baf3d0d29f979574e439af5a55274b35f869",
        strip_prefix = "proc-macro-error-attr-1.0.4",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.proc-macro-error-attr-1.0.4.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__proc_macro_hack__0_5_19",
        url = "https://crates.io/api/v1/crates/proc-macro-hack/0.5.19/download",
        type = "tar.gz",
        sha256 = "dbf0c48bc1d91375ae5c3cd81e3722dff1abcf81a30960240640d223f59fe0e5",
        strip_prefix = "proc-macro-hack-0.5.19",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.proc-macro-hack-0.5.19.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__proc_macro2__0_4_30",
        url = "https://crates.io/api/v1/crates/proc-macro2/0.4.30/download",
        type = "tar.gz",
        sha256 = "cf3d2011ab5c909338f7887f4fc896d35932e29146c12c8d01da6b22a80ba759",
        strip_prefix = "proc-macro2-0.4.30",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.proc-macro2-0.4.30.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__proc_macro2__1_0_24",
        url = "https://crates.io/api/v1/crates/proc-macro2/1.0.24/download",
        type = "tar.gz",
        sha256 = "1e0704ee1a7e00d7bb417d0770ea303c1bccbabf0ef1667dae92b5967f5f8a71",
        strip_prefix = "proc-macro2-1.0.24",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.proc-macro2-1.0.24.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__protobuf__2_22_0",
        url = "https://crates.io/api/v1/crates/protobuf/2.22.0/download",
        type = "tar.gz",
        sha256 = "73f72884896d22e0da0e5b266cb9a780b791f6c3b2f5beab6368d6cd4f0dbb86",
        strip_prefix = "protobuf-2.22.0",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.protobuf-2.22.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__protobuf_codegen__2_22_0",
        url = "https://crates.io/api/v1/crates/protobuf-codegen/2.22.0/download",
        type = "tar.gz",
        sha256 = "e8217a1652dbc91d19c509c558234145faed729191a966896414e5889f62d543",
        strip_prefix = "protobuf-codegen-2.22.0",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.protobuf-codegen-2.22.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__protobuf_codegen_pure__2_22_0",
        url = "https://crates.io/api/v1/crates/protobuf-codegen-pure/2.22.0/download",
        type = "tar.gz",
        sha256 = "1f239d71417bdc5f8d83c07aeb265f911346e5540a1a6c4285f9c3d1966ed6e3",
        strip_prefix = "protobuf-codegen-pure-2.22.0",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.protobuf-codegen-pure-2.22.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__pulldown_cmark__0_7_2",
        url = "https://crates.io/api/v1/crates/pulldown-cmark/0.7.2/download",
        type = "tar.gz",
        sha256 = "ca36dea94d187597e104a5c8e4b07576a8a45aa5db48a65e12940d3eb7461f55",
        strip_prefix = "pulldown-cmark-0.7.2",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.pulldown-cmark-0.7.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__quote__0_6_13",
        url = "https://crates.io/api/v1/crates/quote/0.6.13/download",
        type = "tar.gz",
        sha256 = "6ce23b6b870e8f94f81fb0a363d65d86675884b34a09043c81e5562f11c1f8e1",
        strip_prefix = "quote-0.6.13",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.quote-0.6.13.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__quote__1_0_8",
        url = "https://crates.io/api/v1/crates/quote/1.0.8/download",
        type = "tar.gz",
        sha256 = "991431c3519a3f36861882da93630ce66b52918dcf1b8e2fd66b397fc96f28df",
        strip_prefix = "quote-1.0.8",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.quote-1.0.8.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rand__0_7_3",
        url = "https://crates.io/api/v1/crates/rand/0.7.3/download",
        type = "tar.gz",
        sha256 = "6a6b1679d49b24bbfe0c803429aa1874472f50d9b363131f0e89fc356b544d03",
        strip_prefix = "rand-0.7.3",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.rand-0.7.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rand__0_8_3",
        url = "https://crates.io/api/v1/crates/rand/0.8.3/download",
        type = "tar.gz",
        sha256 = "0ef9e7e66b4468674bfcb0c81af8b7fa0bb154fa9f28eb840da5c447baeb8d7e",
        strip_prefix = "rand-0.8.3",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.rand-0.8.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rand_chacha__0_2_2",
        url = "https://crates.io/api/v1/crates/rand_chacha/0.2.2/download",
        type = "tar.gz",
        sha256 = "f4c8ed856279c9737206bf725bf36935d8666ead7aa69b52be55af369d193402",
        strip_prefix = "rand_chacha-0.2.2",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.rand_chacha-0.2.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rand_chacha__0_3_0",
        url = "https://crates.io/api/v1/crates/rand_chacha/0.3.0/download",
        type = "tar.gz",
        sha256 = "e12735cf05c9e10bf21534da50a147b924d555dc7a547c42e6bb2d5b6017ae0d",
        strip_prefix = "rand_chacha-0.3.0",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.rand_chacha-0.3.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rand_core__0_5_1",
        url = "https://crates.io/api/v1/crates/rand_core/0.5.1/download",
        type = "tar.gz",
        sha256 = "90bde5296fc891b0cef12a6d03ddccc162ce7b2aff54160af9338f8d40df6d19",
        strip_prefix = "rand_core-0.5.1",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.rand_core-0.5.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rand_core__0_6_1",
        url = "https://crates.io/api/v1/crates/rand_core/0.6.1/download",
        type = "tar.gz",
        sha256 = "c026d7df8b298d90ccbbc5190bd04d85e159eaf5576caeacf8741da93ccbd2e5",
        strip_prefix = "rand_core-0.6.1",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.rand_core-0.6.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rand_hc__0_2_0",
        url = "https://crates.io/api/v1/crates/rand_hc/0.2.0/download",
        type = "tar.gz",
        sha256 = "ca3129af7b92a17112d59ad498c6f81eaf463253766b90396d39ea7a39d6613c",
        strip_prefix = "rand_hc-0.2.0",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.rand_hc-0.2.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rand_hc__0_3_0",
        url = "https://crates.io/api/v1/crates/rand_hc/0.3.0/download",
        type = "tar.gz",
        sha256 = "3190ef7066a446f2e7f42e239d161e905420ccab01eb967c9eb27d21b2322a73",
        strip_prefix = "rand_hc-0.3.0",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.rand_hc-0.3.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rand_pcg__0_2_1",
        url = "https://crates.io/api/v1/crates/rand_pcg/0.2.1/download",
        type = "tar.gz",
        sha256 = "16abd0c1b639e9eb4d7c50c0b8100b0d0f849be2349829c740fe8e6eb4816429",
        strip_prefix = "rand_pcg-0.2.1",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.rand_pcg-0.2.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__raw_window_handle__0_3_3",
        url = "https://crates.io/api/v1/crates/raw-window-handle/0.3.3/download",
        type = "tar.gz",
        sha256 = "0a441a7a6c80ad6473bd4b74ec1c9a4c951794285bf941c2126f607c72e48211",
        strip_prefix = "raw-window-handle-0.3.3",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.raw-window-handle-0.3.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rawpointer__0_2_1",
        url = "https://crates.io/api/v1/crates/rawpointer/0.2.1/download",
        type = "tar.gz",
        sha256 = "60a357793950651c4ed0f3f52338f53b2f809f32d83a07f72909fa13e4c6c1e3",
        strip_prefix = "rawpointer-0.2.1",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.rawpointer-0.2.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rayon__1_5_0",
        url = "https://crates.io/api/v1/crates/rayon/1.5.0/download",
        type = "tar.gz",
        sha256 = "8b0d8e0819fadc20c74ea8373106ead0600e3a67ef1fe8da56e39b9ae7275674",
        strip_prefix = "rayon-1.5.0",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.rayon-1.5.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rayon_core__1_9_0",
        url = "https://crates.io/api/v1/crates/rayon-core/1.9.0/download",
        type = "tar.gz",
        sha256 = "9ab346ac5921dc62ffa9f89b7a773907511cdfa5490c572ae9be1be33e8afa4a",
        strip_prefix = "rayon-core-1.9.0",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.rayon-core-1.9.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__redox_syscall__0_1_57",
        url = "https://crates.io/api/v1/crates/redox_syscall/0.1.57/download",
        type = "tar.gz",
        sha256 = "41cc0f7e4d5d4544e8861606a285bb08d3e70712ccc7d2b84d7c0ccfaf4b05ce",
        strip_prefix = "redox_syscall-0.1.57",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.redox_syscall-0.1.57.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__regex__1_4_3",
        url = "https://crates.io/api/v1/crates/regex/1.4.3/download",
        type = "tar.gz",
        sha256 = "d9251239e129e16308e70d853559389de218ac275b515068abc96829d05b948a",
        strip_prefix = "regex-1.4.3",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.regex-1.4.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__regex_syntax__0_6_22",
        url = "https://crates.io/api/v1/crates/regex-syntax/0.6.22/download",
        type = "tar.gz",
        sha256 = "b5eb417147ba9860a96cfe72a0b93bf88fee1744b5636ec99ab20c1aa9376581",
        strip_prefix = "regex-syntax-0.6.22",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.regex-syntax-0.6.22.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rgb__0_8_25",
        url = "https://crates.io/api/v1/crates/rgb/0.8.25/download",
        type = "tar.gz",
        sha256 = "287f3c3f8236abb92d8b7e36797f19159df4b58f0a658cc3fb6dd3004b1f3bd3",
        strip_prefix = "rgb-0.8.25",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.rgb-0.8.25.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rustc_demangle__0_1_18",
        url = "https://crates.io/api/v1/crates/rustc-demangle/0.1.18/download",
        type = "tar.gz",
        sha256 = "6e3bad0ee36814ca07d7968269dd4b7ec89ec2da10c4bb613928d3077083c232",
        strip_prefix = "rustc-demangle-0.1.18",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.rustc-demangle-0.1.18.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rustc_version__0_2_3",
        url = "https://crates.io/api/v1/crates/rustc_version/0.2.3/download",
        type = "tar.gz",
        sha256 = "138e3e0acb6c9fb258b19b67cb8abd63c00679d2851805ea151465464fe9030a",
        strip_prefix = "rustc_version-0.2.3",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.rustc_version-0.2.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rusttype__0_7_9",
        url = "https://crates.io/api/v1/crates/rusttype/0.7.9/download",
        type = "tar.gz",
        sha256 = "310942406a39981bed7e12b09182a221a29e0990f3e7e0c971f131922ed135d5",
        strip_prefix = "rusttype-0.7.9",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.rusttype-0.7.9.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rusttype__0_8_3",
        url = "https://crates.io/api/v1/crates/rusttype/0.8.3/download",
        type = "tar.gz",
        sha256 = "9f61411055101f7b60ecf1041d87fb74205fb20b0c7a723f07ef39174cf6b4c0",
        strip_prefix = "rusttype-0.8.3",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.rusttype-0.8.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__ryu__1_0_5",
        url = "https://crates.io/api/v1/crates/ryu/1.0.5/download",
        type = "tar.gz",
        sha256 = "71d301d4193d031abdd79ff7e3dd721168a9572ef3fe51a1517aba235bd8f86e",
        strip_prefix = "ryu-1.0.5",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.ryu-1.0.5.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__same_file__1_0_6",
        url = "https://crates.io/api/v1/crates/same-file/1.0.6/download",
        type = "tar.gz",
        sha256 = "93fc1dc3aaa9bfed95e02e6eadabb4baf7e3078b0bd1b4d7b6b0b68378900502",
        strip_prefix = "same-file-1.0.6",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.same-file-1.0.6.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__scopeguard__1_1_0",
        url = "https://crates.io/api/v1/crates/scopeguard/1.1.0/download",
        type = "tar.gz",
        sha256 = "d29ab0c6d3fc0ee92fe66e2d99f700eab17a8d57d1c1d3b748380fb20baa78cd",
        strip_prefix = "scopeguard-1.1.0",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.scopeguard-1.1.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__semver__0_9_0",
        url = "https://crates.io/api/v1/crates/semver/0.9.0/download",
        type = "tar.gz",
        sha256 = "1d7eb9ef2c18661902cc47e535f9bc51b78acd254da71d375c2f6720d9a40403",
        strip_prefix = "semver-0.9.0",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.semver-0.9.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__semver_parser__0_7_0",
        url = "https://crates.io/api/v1/crates/semver-parser/0.7.0/download",
        type = "tar.gz",
        sha256 = "388a1df253eca08550bef6c72392cfe7c30914bf41df5269b68cbd6ff8f570a3",
        strip_prefix = "semver-parser-0.7.0",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.semver-parser-0.7.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__serde__1_0_123",
        url = "https://crates.io/api/v1/crates/serde/1.0.123/download",
        type = "tar.gz",
        sha256 = "92d5161132722baa40d802cc70b15262b98258453e85e5d1d365c757c73869ae",
        strip_prefix = "serde-1.0.123",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.serde-1.0.123.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__serde_derive__1_0_123",
        url = "https://crates.io/api/v1/crates/serde_derive/1.0.123/download",
        type = "tar.gz",
        sha256 = "9391c295d64fc0abb2c556bad848f33cb8296276b1ad2677d1ae1ace4f258f31",
        strip_prefix = "serde_derive-1.0.123",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.serde_derive-1.0.123.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__serde_json__1_0_62",
        url = "https://crates.io/api/v1/crates/serde_json/1.0.62/download",
        type = "tar.gz",
        sha256 = "ea1c6153794552ea7cf7cf63b1231a25de00ec90db326ba6264440fa08e31486",
        strip_prefix = "serde_json-1.0.62",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.serde_json-1.0.62.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__serde_repr__0_1_6",
        url = "https://crates.io/api/v1/crates/serde_repr/0.1.6/download",
        type = "tar.gz",
        sha256 = "2dc6b7951b17b051f3210b063f12cc17320e2fe30ae05b0fe2a3abb068551c76",
        strip_prefix = "serde_repr-0.1.6",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.serde_repr-0.1.6.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__sha_1__0_8_2",
        url = "https://crates.io/api/v1/crates/sha-1/0.8.2/download",
        type = "tar.gz",
        sha256 = "f7d94d0bede923b3cea61f3f1ff57ff8cdfd77b400fb8f9998949e0cf04163df",
        strip_prefix = "sha-1-0.8.2",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.sha-1-0.8.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__shared_library__0_1_9",
        url = "https://crates.io/api/v1/crates/shared_library/0.1.9/download",
        type = "tar.gz",
        sha256 = "5a9e7e0f2bfae24d8a5b5a66c5b257a83c7412304311512a0c054cd5e619da11",
        strip_prefix = "shared_library-0.1.9",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.shared_library-0.1.9.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__siphasher__0_3_3",
        url = "https://crates.io/api/v1/crates/siphasher/0.3.3/download",
        type = "tar.gz",
        sha256 = "fa8f3741c7372e75519bd9346068370c9cdaabcc1f9599cbcf2a2719352286b7",
        strip_prefix = "siphasher-0.3.3",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.siphasher-0.3.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__slice_of_array__0_2_1",
        url = "https://crates.io/api/v1/crates/slice-of-array/0.2.1/download",
        type = "tar.gz",
        sha256 = "8fffe93cb1051a724788529b504be2a1016498582545e50d76de4ffca1906367",
        strip_prefix = "slice-of-array-0.2.1",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.slice-of-array-0.2.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__slug__0_1_4",
        url = "https://crates.io/api/v1/crates/slug/0.1.4/download",
        type = "tar.gz",
        sha256 = "b3bc762e6a4b6c6fcaade73e77f9ebc6991b676f88bb2358bddb56560f073373",
        strip_prefix = "slug-0.1.4",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.slug-0.1.4.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__smallvec__0_6_14",
        url = "https://crates.io/api/v1/crates/smallvec/0.6.14/download",
        type = "tar.gz",
        sha256 = "b97fcaeba89edba30f044a10c6a3cc39df9c3f17d7cd829dd1446cab35f890e0",
        strip_prefix = "smallvec-0.6.14",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.smallvec-0.6.14.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__smithay_client_toolkit__0_4_6",
        url = "https://crates.io/api/v1/crates/smithay-client-toolkit/0.4.6/download",
        type = "tar.gz",
        sha256 = "2ccb8c57049b2a34d2cc2b203fa785020ba0129d31920ef0d317430adaf748fa",
        strip_prefix = "smithay-client-toolkit-0.4.6",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.smithay-client-toolkit-0.4.6.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__stb_truetype__0_3_1",
        url = "https://crates.io/api/v1/crates/stb_truetype/0.3.1/download",
        type = "tar.gz",
        sha256 = "f77b6b07e862c66a9f3e62a07588fee67cd90a9135a2b942409f195507b4fb51",
        strip_prefix = "stb_truetype-0.3.1",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.stb_truetype-0.3.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__strsim__0_8_0",
        url = "https://crates.io/api/v1/crates/strsim/0.8.0/download",
        type = "tar.gz",
        sha256 = "8ea5119cdb4c55b55d432abb513a0429384878c15dde60cc77b1c99de1a95a6a",
        strip_prefix = "strsim-0.8.0",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.strsim-0.8.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__structopt__0_3_21",
        url = "https://crates.io/api/v1/crates/structopt/0.3.21/download",
        type = "tar.gz",
        sha256 = "5277acd7ee46e63e5168a80734c9f6ee81b1367a7d8772a2d765df2a3705d28c",
        strip_prefix = "structopt-0.3.21",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.structopt-0.3.21.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__structopt_derive__0_4_14",
        url = "https://crates.io/api/v1/crates/structopt-derive/0.4.14/download",
        type = "tar.gz",
        sha256 = "5ba9cdfda491b814720b6b06e0cac513d922fc407582032e8706e9f137976f90",
        strip_prefix = "structopt-derive-0.4.14",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.structopt-derive-0.4.14.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__syn__1_0_60",
        url = "https://crates.io/api/v1/crates/syn/1.0.60/download",
        type = "tar.gz",
        sha256 = "c700597eca8a5a762beb35753ef6b94df201c81cca676604f547495a0d7f0081",
        strip_prefix = "syn-1.0.60",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.syn-1.0.60.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__tera__1_6_1",
        url = "https://crates.io/api/v1/crates/tera/1.6.1/download",
        type = "tar.gz",
        sha256 = "eac6ab7eacf40937241959d540670f06209c38ceadb62116999db4a950fbf8dc",
        strip_prefix = "tera-1.6.1",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.tera-1.6.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__termcolor__1_1_2",
        url = "https://crates.io/api/v1/crates/termcolor/1.1.2/download",
        type = "tar.gz",
        sha256 = "2dfed899f0eb03f32ee8c6a0aabdb8a7949659e3466561fc0adf54e26d88c5f4",
        strip_prefix = "termcolor-1.1.2",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.termcolor-1.1.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__textwrap__0_11_0",
        url = "https://crates.io/api/v1/crates/textwrap/0.11.0/download",
        type = "tar.gz",
        sha256 = "d326610f408c7a4eb6f51c37c330e496b08506c9457c9d34287ecc38809fb060",
        strip_prefix = "textwrap-0.11.0",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.textwrap-0.11.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__thread_local__1_1_3",
        url = "https://crates.io/api/v1/crates/thread_local/1.1.3/download",
        type = "tar.gz",
        sha256 = "8018d24e04c95ac8790716a5987d0fec4f8b27249ffa0f7d33f1369bdfb88cbd",
        strip_prefix = "thread_local-1.1.3",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.thread_local-1.1.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__time__0_1_43",
        url = "https://crates.io/api/v1/crates/time/0.1.43/download",
        type = "tar.gz",
        sha256 = "ca8a50ef2360fbd1eeb0ecd46795a87a19024eb4b53c5dc916ca1fd95fe62438",
        strip_prefix = "time-0.1.43",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.time-0.1.43.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__tinyvec__1_1_1",
        url = "https://crates.io/api/v1/crates/tinyvec/1.1.1/download",
        type = "tar.gz",
        sha256 = "317cca572a0e89c3ce0ca1f1bdc9369547fe318a683418e42ac8f59d14701023",
        strip_prefix = "tinyvec-1.1.1",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.tinyvec-1.1.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__tinyvec_macros__0_1_0",
        url = "https://crates.io/api/v1/crates/tinyvec_macros/0.1.0/download",
        type = "tar.gz",
        sha256 = "cda74da7e1a664f795bb1f8a87ec406fb89a02522cf6e50620d016add6dbbf5c",
        strip_prefix = "tinyvec_macros-0.1.0",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.tinyvec_macros-0.1.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__toml__0_5_8",
        url = "https://crates.io/api/v1/crates/toml/0.5.8/download",
        type = "tar.gz",
        sha256 = "a31142970826733df8241ef35dc040ef98c679ab14d7c3e54d827099b3acecaa",
        strip_prefix = "toml-0.5.8",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.toml-0.5.8.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__typenum__1_12_0",
        url = "https://crates.io/api/v1/crates/typenum/1.12.0/download",
        type = "tar.gz",
        sha256 = "373c8a200f9e67a0c95e62a4f52fbf80c23b4381c05a17845531982fa99e6b33",
        strip_prefix = "typenum-1.12.0",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.typenum-1.12.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__ucd_trie__0_1_3",
        url = "https://crates.io/api/v1/crates/ucd-trie/0.1.3/download",
        type = "tar.gz",
        sha256 = "56dee185309b50d1f11bfedef0fe6d036842e3fb77413abef29f8f8d1c5d4c1c",
        strip_prefix = "ucd-trie-0.1.3",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.ucd-trie-0.1.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__unic_char_property__0_9_0",
        url = "https://crates.io/api/v1/crates/unic-char-property/0.9.0/download",
        type = "tar.gz",
        sha256 = "a8c57a407d9b6fa02b4795eb81c5b6652060a15a7903ea981f3d723e6c0be221",
        strip_prefix = "unic-char-property-0.9.0",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.unic-char-property-0.9.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__unic_char_range__0_9_0",
        url = "https://crates.io/api/v1/crates/unic-char-range/0.9.0/download",
        type = "tar.gz",
        sha256 = "0398022d5f700414f6b899e10b8348231abf9173fa93144cbc1a43b9793c1fbc",
        strip_prefix = "unic-char-range-0.9.0",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.unic-char-range-0.9.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__unic_common__0_9_0",
        url = "https://crates.io/api/v1/crates/unic-common/0.9.0/download",
        type = "tar.gz",
        sha256 = "80d7ff825a6a654ee85a63e80f92f054f904f21e7d12da4e22f9834a4aaa35bc",
        strip_prefix = "unic-common-0.9.0",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.unic-common-0.9.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__unic_segment__0_9_0",
        url = "https://crates.io/api/v1/crates/unic-segment/0.9.0/download",
        type = "tar.gz",
        sha256 = "e4ed5d26be57f84f176157270c112ef57b86debac9cd21daaabbe56db0f88f23",
        strip_prefix = "unic-segment-0.9.0",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.unic-segment-0.9.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__unic_ucd_segment__0_9_0",
        url = "https://crates.io/api/v1/crates/unic-ucd-segment/0.9.0/download",
        type = "tar.gz",
        sha256 = "2079c122a62205b421f499da10f3ee0f7697f012f55b675e002483c73ea34700",
        strip_prefix = "unic-ucd-segment-0.9.0",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.unic-ucd-segment-0.9.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__unic_ucd_version__0_9_0",
        url = "https://crates.io/api/v1/crates/unic-ucd-version/0.9.0/download",
        type = "tar.gz",
        sha256 = "96bd2f2237fe450fcd0a1d2f5f4e91711124f7857ba2e964247776ebeeb7b0c4",
        strip_prefix = "unic-ucd-version-0.9.0",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.unic-ucd-version-0.9.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__unicase__2_6_0",
        url = "https://crates.io/api/v1/crates/unicase/2.6.0/download",
        type = "tar.gz",
        sha256 = "50f37be617794602aabbeee0be4f259dc1778fabe05e2d67ee8f79326d5cb4f6",
        strip_prefix = "unicase-2.6.0",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.unicase-2.6.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__unicode_bidi__0_3_4",
        url = "https://crates.io/api/v1/crates/unicode-bidi/0.3.4/download",
        type = "tar.gz",
        sha256 = "49f2bd0c6468a8230e1db229cff8029217cf623c767ea5d60bfbd42729ea54d5",
        strip_prefix = "unicode-bidi-0.3.4",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.unicode-bidi-0.3.4.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__unicode_normalization__0_1_17",
        url = "https://crates.io/api/v1/crates/unicode-normalization/0.1.17/download",
        type = "tar.gz",
        sha256 = "07fbfce1c8a97d547e8b5334978438d9d6ec8c20e38f56d4a4374d181493eaef",
        strip_prefix = "unicode-normalization-0.1.17",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.unicode-normalization-0.1.17.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__unicode_segmentation__1_7_1",
        url = "https://crates.io/api/v1/crates/unicode-segmentation/1.7.1/download",
        type = "tar.gz",
        sha256 = "bb0d2e7be6ae3a5fa87eed5fb451aff96f2573d2694942e40543ae0bbe19c796",
        strip_prefix = "unicode-segmentation-1.7.1",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.unicode-segmentation-1.7.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__unicode_width__0_1_8",
        url = "https://crates.io/api/v1/crates/unicode-width/0.1.8/download",
        type = "tar.gz",
        sha256 = "9337591893a19b88d8d87f2cec1e73fad5cdfd10e5a6f349f498ad6ea2ffb1e3",
        strip_prefix = "unicode-width-0.1.8",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.unicode-width-0.1.8.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__unicode_xid__0_1_0",
        url = "https://crates.io/api/v1/crates/unicode-xid/0.1.0/download",
        type = "tar.gz",
        sha256 = "fc72304796d0818e357ead4e000d19c9c174ab23dc11093ac919054d20a6a7fc",
        strip_prefix = "unicode-xid-0.1.0",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.unicode-xid-0.1.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__unicode_xid__0_2_1",
        url = "https://crates.io/api/v1/crates/unicode-xid/0.2.1/download",
        type = "tar.gz",
        sha256 = "f7fe0bb3479651439c9112f72b6c505038574c9fbb575ed1bf3b797fa39dd564",
        strip_prefix = "unicode-xid-0.2.1",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.unicode-xid-0.2.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__url__2_2_0",
        url = "https://crates.io/api/v1/crates/url/2.2.0/download",
        type = "tar.gz",
        sha256 = "5909f2b0817350449ed73e8bcd81c8c3c8d9a7a5d8acba4b27db277f1868976e",
        strip_prefix = "url-2.2.0",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.url-2.2.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__vcpkg__0_2_11",
        url = "https://crates.io/api/v1/crates/vcpkg/0.2.11/download",
        type = "tar.gz",
        sha256 = "b00bca6106a5e23f3eee943593759b7fcddb00554332e856d990c893966879fb",
        strip_prefix = "vcpkg-0.2.11",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.vcpkg-0.2.11.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__vec_map__0_8_2",
        url = "https://crates.io/api/v1/crates/vec_map/0.8.2/download",
        type = "tar.gz",
        sha256 = "f1bddf1187be692e79c5ffeab891132dfb0f236ed36a43c7ed39f1165ee20191",
        strip_prefix = "vec_map-0.8.2",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.vec_map-0.8.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__version_check__0_9_2",
        url = "https://crates.io/api/v1/crates/version_check/0.9.2/download",
        type = "tar.gz",
        sha256 = "b5a972e5669d67ba988ce3dc826706fb0a8b01471c088cb0b6110b805cc36aed",
        strip_prefix = "version_check-0.9.2",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.version_check-0.9.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__void__1_0_2",
        url = "https://crates.io/api/v1/crates/void/1.0.2/download",
        type = "tar.gz",
        sha256 = "6a02e4885ed3bc0f2de90ea6dd45ebcbb66dacffe03547fadbb0eeae2770887d",
        strip_prefix = "void-1.0.2",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.void-1.0.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__walkdir__2_3_1",
        url = "https://crates.io/api/v1/crates/walkdir/2.3.1/download",
        type = "tar.gz",
        sha256 = "777182bc735b6424e1a57516d35ed72cb8019d85c8c9bf536dccb3445c1a2f7d",
        strip_prefix = "walkdir-2.3.1",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.walkdir-2.3.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__wasi__0_10_2_wasi_snapshot_preview1",
        url = "https://crates.io/api/v1/crates/wasi/0.10.2+wasi-snapshot-preview1/download",
        type = "tar.gz",
        sha256 = "fd6fbd9a79829dd1ad0cc20627bf1ed606756a7f77edff7b66b7064f9cb327c6",
        strip_prefix = "wasi-0.10.2+wasi-snapshot-preview1",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.wasi-0.10.2+wasi-snapshot-preview1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__wasi__0_9_0_wasi_snapshot_preview1",
        url = "https://crates.io/api/v1/crates/wasi/0.9.0+wasi-snapshot-preview1/download",
        type = "tar.gz",
        sha256 = "cccddf32554fecc6acb585f82a32a72e28b48f8c4c1883ddfeeeaa96f7d8e519",
        strip_prefix = "wasi-0.9.0+wasi-snapshot-preview1",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.wasi-0.9.0+wasi-snapshot-preview1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__wayland_client__0_21_13",
        url = "https://crates.io/api/v1/crates/wayland-client/0.21.13/download",
        type = "tar.gz",
        sha256 = "49963e5f9eeaf637bfcd1b9f0701c99fd5cd05225eb51035550d4272806f2713",
        strip_prefix = "wayland-client-0.21.13",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.wayland-client-0.21.13.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__wayland_commons__0_21_13",
        url = "https://crates.io/api/v1/crates/wayland-commons/0.21.13/download",
        type = "tar.gz",
        sha256 = "40c08896768b667e1df195d88a62a53a2d1351a1ed96188be79c196b35bb32ec",
        strip_prefix = "wayland-commons-0.21.13",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.wayland-commons-0.21.13.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__wayland_protocols__0_21_13",
        url = "https://crates.io/api/v1/crates/wayland-protocols/0.21.13/download",
        type = "tar.gz",
        sha256 = "4afde2ea2a428eee6d7d2c8584fdbe8b82eee8b6c353e129a434cd6e07f42145",
        strip_prefix = "wayland-protocols-0.21.13",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.wayland-protocols-0.21.13.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__wayland_scanner__0_21_13",
        url = "https://crates.io/api/v1/crates/wayland-scanner/0.21.13/download",
        type = "tar.gz",
        sha256 = "bf3828c568714507315ee425a9529edc4a4aa9901409e373e9e0027e7622b79e",
        strip_prefix = "wayland-scanner-0.21.13",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.wayland-scanner-0.21.13.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__wayland_sys__0_21_13",
        url = "https://crates.io/api/v1/crates/wayland-sys/0.21.13/download",
        type = "tar.gz",
        sha256 = "520ab0fd578017a0ee2206623ba9ef4afe5e8f23ca7b42f6acfba2f4e66b1628",
        strip_prefix = "wayland-sys-0.21.13",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.wayland-sys-0.21.13.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__weak_table__0_2_4",
        url = "https://crates.io/api/v1/crates/weak-table/0.2.4/download",
        type = "tar.gz",
        sha256 = "78e37715e810547b2ae9b6980b25bef319cb779d6c42faa8010ba47e83178113",
        strip_prefix = "weak-table-0.2.4",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.weak-table-0.2.4.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__winapi__0_3_9",
        url = "https://crates.io/api/v1/crates/winapi/0.3.9/download",
        type = "tar.gz",
        sha256 = "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419",
        strip_prefix = "winapi-0.3.9",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.winapi-0.3.9.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__winapi_i686_pc_windows_gnu__0_4_0",
        url = "https://crates.io/api/v1/crates/winapi-i686-pc-windows-gnu/0.4.0/download",
        type = "tar.gz",
        sha256 = "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6",
        strip_prefix = "winapi-i686-pc-windows-gnu-0.4.0",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.winapi-i686-pc-windows-gnu-0.4.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__winapi_util__0_1_5",
        url = "https://crates.io/api/v1/crates/winapi-util/0.1.5/download",
        type = "tar.gz",
        sha256 = "70ec6ce85bb158151cae5e5c87f95a8e97d2c0c4b001223f33a334e3ce5de178",
        strip_prefix = "winapi-util-0.1.5",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.winapi-util-0.1.5.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__winapi_x86_64_pc_windows_gnu__0_4_0",
        url = "https://crates.io/api/v1/crates/winapi-x86_64-pc-windows-gnu/0.4.0/download",
        type = "tar.gz",
        sha256 = "712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f",
        strip_prefix = "winapi-x86_64-pc-windows-gnu-0.4.0",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.winapi-x86_64-pc-windows-gnu-0.4.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__winit__0_19_5",
        url = "https://crates.io/api/v1/crates/winit/0.19.5/download",
        type = "tar.gz",
        sha256 = "1e96eb4bb472fa43e718e8fa4aef82f86cd9deac9483a1e1529230babdb394a8",
        strip_prefix = "winit-0.19.5",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.winit-0.19.5.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__x11_dl__2_18_5",
        url = "https://crates.io/api/v1/crates/x11-dl/2.18.5/download",
        type = "tar.gz",
        sha256 = "2bf981e3a5b3301209754218f962052d4d9ee97e478f4d26d4a6eced34c1fef8",
        strip_prefix = "x11-dl-2.18.5",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.x11-dl-2.18.5.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__xdg__2_2_0",
        url = "https://crates.io/api/v1/crates/xdg/2.2.0/download",
        type = "tar.gz",
        sha256 = "d089681aa106a86fade1b0128fb5daf07d5867a509ab036d99988dec80429a57",
        strip_prefix = "xdg-2.2.0",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.xdg-2.2.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__xml_rs__0_8_3",
        url = "https://crates.io/api/v1/crates/xml-rs/0.8.3/download",
        type = "tar.gz",
        sha256 = "b07db065a5cf61a7e4ba64f29e67db906fb1787316516c4e6e5ff0fea1efcd8a",
        strip_prefix = "xml-rs-0.8.3",
        build_file = Label("//bazelbuild/cargo/remote:BUILD.xml-rs-0.8.3.bazel"),
    )
