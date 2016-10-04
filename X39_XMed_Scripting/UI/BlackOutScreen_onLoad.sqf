#define DISABLERETURN
#include "x\x39\ExtensiveMedicalsystem\scripting\defaultSQF.hpp"
#include "x\x39\ExtensiveMedicalsystem\scripting\header.hpp"


//Init uiNamespace variable with display object
uiNamespace setVariable ["XMS_BlackOutScreen_UI", _this select 0];
//Start ui update loop
uiNamespace setVariable ["XMS_BlackOutScreen_LOOP", (_this select 0) spawn {
    while { true } do
    {
        sleep 0.001; //sleep one frame
        (_this displayCtrl 1) ctrlSetText (uiNamespace getVariable ["XMS_BlackOutScreen_displaytext", ""]);
    };
}];


#include "x\x39\ExtensiveMedicalsystem\scripting\footer.hpp"
