/*
 * Author:
 *      X39
 * 
 * Description:
 *      Initializes this units mod tick local to calling client
 * 
 * Arguments:
 *      [<VARNAME:STRING>, <UNIT:OBJECT>]
 * 
 * Return:
 *      -/-
 */
#define DISABLERETURN
#include "\x\x39\extensivemedicalsystem\scripting\defaultSQF.hpp"
#include "\x\x39\extensivemedicalsystem\scripting\header.hpp"

params ["_varName", "_unit"];
private ["_tmp", "_var"];

_tmp = [];
{
    _tmp pushBack 0;
    false
} count X39_XMed_var_Ticks;
_unit setVariable ["X39_XMed_var_Tick_Properties", _tmp];


_var = [_unit] call BIS_fnc_objectVar;
_tmp = addMissionEventHandler ["EachFrame", format["[%1] call %2", _var, "X39_XMed_fnc_MT_DoTick"]];
_unit setVariable [format["X39_XMed_var_%1", _varName], _tmp];

#include "\x\x39\extensivemedicalsystem\scripting\footer.hpp"
