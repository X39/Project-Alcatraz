/*
 * Author:
 *      X39
 * 
 * Description:
 *      removes the mod tick from this unit
 * 
 * Arguments:
 *      [<VARNAME:STRING>, <UNIT:OBJECT>]
 * 
 * Return:
 *      -/-
 */
#define DISABLERETURN
#include "x\x39\ExtensiveMedicalsystem\scripting\defaultSQF.hpp"
#include "x\x39\ExtensiveMedicalsystem\scripting\header.hpp"

params ["_varName", "_unit"];
private ["_var"];

removeMissionEventHandler ["EachFrame", _unit getVariable _varName];
_var = [_unit] call BIS_fnc_objectVar;
missionNamespace setVariable [_var, nil];

_unit setVariable ["X39_XMed_var_Tick_TimeoutCount", nil];
_unit setVariable ["X39_XMed_var_Tick_Properties", nil];
_unit setVariable [format["X39_XMed_var_%1", _varName], nil];

#include "x\x39\ExtensiveMedicalsystem\scripting\footer.hpp"
