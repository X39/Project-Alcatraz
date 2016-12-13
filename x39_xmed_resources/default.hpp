#define STR(EXT) #EXT
#define FNC(EXT) X39_XMed_fnc_##EXT
#define GVAR(EXT) X39_XMed_var_##EXT
#define FNCS(EXT) STR(FNC(EXT))
#define GVARS(EXT) STR(GVAR(EXT))