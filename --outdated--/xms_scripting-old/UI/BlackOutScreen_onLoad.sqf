#define DISABLERETURN
#include "\x\xms\extensivemedicalsystem\scripting\defaultSQF.hpp"
#include "\x\xms\extensivemedicalsystem\scripting\header.hpp"
#include "BlackOutScreen_IDs.hpp"

params ["_ctrl"];

//Init uiNamespace variable with display object
uiNamespace setVariable ["XMS_BlackOutScreen_UI", _ctrl];
//Start ui update loop
uiNamespace setVariable ["XMS_BlackOutScreen_LOOP", _ctrl spawn {
    private ["_time", "_currentFade"];
    _last = time;
    while { true } do
    {
        sleep 0.001; //sleep one frame
        (_this displayCtrl BlackOutScreen_IDC_BlackOutText) ctrlSetText (uiNamespace getVariable ["XMS_BlackOutScreen_displaytext", ""]);
        if((time - _time) < 10) then
        {
            _currentFade = ctrlFade (_this displayCtrl BlackOutScreen_IDC_PulseBack);
            (_this displayCtrl BlackOutScreen_IDC_PulseBack) ctrlSetFade ([0.1, 1] select (_currentFade < 0.5));
            (_this displayCtrl BlackOutScreen_IDC_PulseBack) ctrlCommit 7;
            _last = time;
        };
    };
}];

(_ctrl displayCtrl BlackOutScreen_IDC_RespawnButton) ctrlAddEventHandler ["MouseButtonClick", {
    //Just kill the player
    player setDamage 1;
}];

(_ctrl displayCtrl BlackOutScreen_IDC_AbortButton) ctrlAddEventHandler ["MouseButtonClick", {
    //end the mission for this specific player
    "KILLED" call BIS_fnc_endMission;
}];


#include "\x\xms\extensivemedicalsystem\scripting\footer.hpp"
