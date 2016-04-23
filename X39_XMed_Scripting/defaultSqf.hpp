#include "x\x39\ExtensiveMedicalsystem\scripting\defaultSQF.hpp"
#include "x\x39\ExtensiveMedicalsystem\scripting\exceptionIds.hpp"
#define FNC(EXT) X39_XMed_fnc_##EXT
#define GVAR(EXT) X39_XMed_var_##EXT

#ifdef DEBUG
    //If in debug mode, enable tracing
    #define DOCALLTRACE
#endif