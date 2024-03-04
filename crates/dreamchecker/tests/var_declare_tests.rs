
extern crate dreamchecker as dc;

use dc::test_helpers::*;

pub const VAR_DEC_ERRORS: &[(u32, u16, &str)] = &[
    (5, 12, "/mob/subtype redeclares var \"foo\""),
];

#[test]
fn var_redec() {
    let code = r##"
/mob
    var/foo

/mob/subtype
    var/foo
"##.trim();
    check_errors_match(code, VAR_DEC_ERRORS);
}

pub const VAR_FINAL_ERRORS: &[(u32, u16, &str)] = &[
    (5, 9, "/mob/subtype overrides final var \"foo\""),
];

#[test]
fn var_spaceman_final() {
    let code = r##"
/mob
    var/SpacemanDMM_final/foo = 0

/mob/subtype
    foo = 1
"##.trim();
    check_errors_match(code, VAR_FINAL_ERRORS);
}

#[test]
fn var_final() {
    let code = r##"
/mob
    var/final/foo = 0

/mob/subtype
    foo = 1
"##.trim();
    check_errors_match(code, VAR_FINAL_ERRORS);
}

pub const VAR_UNDECL_ERRORS: &[(u32, u16, &str)] = &[
    (6, 5, "undefined var: \"bar\""),
];

#[test]
fn var_undecl() {
    let code = r##"
/mob
    var/foo = 0

/mob/proc/test()
    foo++
    bar++
"##.trim();
    check_errors_match(code, VAR_UNDECL_ERRORS);
}

pub const VAR_TYPEPATH_ERRORS: &[(u32, u16, &str)] = &[
    (6, 43, "/mob declares var \"invalid_type\" as typepath but sets it to \"not a type\""),
    (11, 14, "/mob declares var \"foo_type\" as typepath /obj/foo but /mob/subtype assigns it a non-subtype /obj/bar"),
    (12, 15, "/mob declares var \"foo_type2\" as typepath /obj/foo but /mob/subtype sets it to 3"),
];

#[test]
fn var_typepath() {
    let code = r##"
/obj/foo

/obj/bar

/mob
    var/SpacemanDMM_typepath/invalid_type = "not a type"
    var/SpacemanDMM_typepath/foo_type = /obj/foo
    var/SpacemanDMM_typepath/foo_type2 = /obj/foo

/mob/subtype
    foo_type = /obj/bar
    foo_type2 = 3
"##.trim();
    check_errors_match(code, VAR_TYPEPATH_ERRORS);
}
