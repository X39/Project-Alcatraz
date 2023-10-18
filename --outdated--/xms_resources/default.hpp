#define STR(EXT) #EXT
#define FNC(EXT) xms_XMed_fnc_##EXT
#define GVAR(EXT) xms_XMed_var_##EXT
#define FNCS(EXT) STR(FNC(EXT))
#define GVARS(EXT) STR(GVAR(EXT))