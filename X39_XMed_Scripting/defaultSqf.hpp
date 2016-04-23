#include "x\x39\ExtensiveMedicalsystem\scripting\default.hpp"
#include "x\x39\ExtensiveMedicalsystem\scripting\exceptionIds.hpp"
#define FNC(EXT) X39_XMed_fnc_##EXT
#define GVAR(EXT) X39_XMed_var_##EXT

#ifdef DEBUG
    //If in debug mode, enable tracing & printing call arguments
    #define DOTRACE
    #define DOCARGS
#endif