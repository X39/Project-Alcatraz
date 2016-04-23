#include "x\x39\ExtensiveMedicalsystem\scripting\default.hpp"
#include "x\x39\ExtensiveMedicalsystem\scripting\exceptionIds.hpp"
#define STR(EXT) #EXT
#define FNC(EXT) X39_XMed_fnc_##EXT
#define GVAR(EXT) X39_XMed_var_##EXT
#define FNCS(EXT) STR(FNC(EXT))
#define GVARS(EXT) STR(GVAR(EXT))

#define EXNOTIMPLEMENTED throw [EX_ID_GENERIC_NOTIMPLEMENTED, "Not Implemented", STACKTRACE, nil]

#ifdef DEBUG
    //If in debug mode, enable tracing & printing call arguments
    #define DOTRACE
    #define DOCARGS
#endif