/*
 * Author:
 *      xms
 * 
 * Description:
 *      Initialized a non-initialized unit so it is ready for use with ExtensiveMedicalsystem
 * 
 * Arguments:
 *      [
 *          <object>
 *      ]
 * 
 * Return:
 *      -/-
 */
#define DISABLERETURN
#include "\x\xms\extensivemedicalsystem\scripting\defaultSQF.hpp"
#include "\x\xms\extensivemedicalsystem\scripting\header.hpp"


params [
    ["_unit", objNull, [objNull]]
];

if (hasInterface && {_unit == player}) then
{
    _unit spawn
    {
        private ["_tmp"];
        waitUntil {!isNull (findDisplay 46)};
        _tmp = (findDisplay 46) displayAddEventHandler["keyDown", xms_XMed_fnc_CB_46_OnKeyDown];
        _this setVariable ["xms_XMed_var_CB_46_OnKeyDown", _tmp];
    };
};


#include "\x\xms\extensivemedicalsystem\scripting\footer.hpp"
