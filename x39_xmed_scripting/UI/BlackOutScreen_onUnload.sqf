#define DISABLERETURN
#include "\x\x39\extensivemedicalsystem\scripting\defaultSQF.hpp"
#include "\x\x39\extensivemedicalsystem\scripting\header.hpp"


//Reset UI Variable to nil
uiNamespace setVariable ["XMS_BlackOutScreen_UI", nil];
//terminate background refresh loop
terminate (uiNamespace getVariable ["XMS_BlackOutScreen_UI", scriptNull]);


#include "\x\x39\extensivemedicalsystem\scripting\footer.hpp"