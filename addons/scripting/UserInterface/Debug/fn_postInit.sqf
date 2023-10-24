#include "\z\xms\scripting\default.hpp"
#include "\z\xms\scripting\header.hpp"
/*
 * Author:
 *      xms
 * 
 * Description:
 *      Initializes the XMS debug interface features.
 * 
 * Arguments:
 *      -/-
 * 
 * Throws:
 *      -/-
 * 
 * Return:
 *      -/-
 */

#ifdef CMD__XMS_DEBUG
if !hasInterface exitWith {};

[] spawn {
    while {true} do {
        systemChat "XMS Debug Interface is active. If this is not desired, please download the appropriate version of the mod.";
        sleep 60;
    };
};

addMissionEventHandler ["Draw3D", {
    private _cursorObject = cursorObject;
    if (isNull _cursorObject) exitWith {};
    if !(_cursorObject getVariable ["XMS_Unit_Initialization_var_Initialized", false]) exitWith {};
    
    private _unitVariables = [];
    {
        private _name = _x get "name";
        private _declaredName = _x get "declaredName";
        private _value = [_cursorObject, _declaredName] call XMS_Unit_Variables_fnc_GetVariable;
        _unitVariables pushBack format ["%1: %2", _declaredName, _value];
    } forEach ([] call XMS_Unit_Variables_fnc_GetAllVariables);

    private _text = _unitVariables joinString "\n";
    drawIcon3D ["targetIcon.paa", [1,1,1,1], ASLToAGL getPosASLVisual _cursorObject, 1, 1, 45, _text, 1, 0.05, "TahomaB"];
}];

#endif
#include "\z\xms\scripting\footer.hpp"