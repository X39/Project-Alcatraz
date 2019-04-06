#define DISABLERETURN
#include "\x\xms\extensivemedicalsystem\scripting\defaultSQF.hpp"
#include "\x\xms\extensivemedicalsystem\scripting\header.hpp"


//Reset UI Variable to nil
uiNamespace setVariable ["XMS_BlackOutScreen_UI", nil];
//terminate background refresh loop
terminate (uiNamespace getVariable ["XMS_BlackOutScreen_UI", scriptNull]);


#include "\x\xms\extensivemedicalsystem\scripting\footer.hpp"