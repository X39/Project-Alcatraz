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

SETUVAR3(_unit, Tick_TimeoutCount, nil);
SETUVAR3(_unit, Tick_Properties, nil);
SETUVAR3(_unit, _varName, nil);

#include "x\x39\ExtensiveMedicalsystem\scripting\footer.hpp"
