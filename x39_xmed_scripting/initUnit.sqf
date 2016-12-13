/*
 * Author:
 *      X39
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
#include "x\x39\ExtensiveMedicalsystem\scripting\defaultSQF.hpp"
#include "x\x39\ExtensiveMedicalsystem\scripting\header.hpp"


params [
    ["_unit", objNull, [objNull]]
];

if (hasInterface && {_unit == player}) then
{
    _unit spawn
    {
        private ["_tmp"];
        waitUntil {!isNull (findDisplay 46)};
        _tmp = (findDisplay 46) displayAddEventHandler["keyDown", X39_XMed_fnc_CB_46_OnKeyDown];
        _this setVariable ["X39_XMed_var_CB_46_OnKeyDown", _tmp];
    };
};


#include "x\x39\ExtensiveMedicalsystem\scripting\footer.hpp"
