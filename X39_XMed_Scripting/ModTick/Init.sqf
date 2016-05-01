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
#include "x\x39\ExtensiveMedicalsystem\scripting\defaultSQF.hpp"
#include "x\x39\ExtensiveMedicalsystem\scripting\header.hpp"

params ["_varName", "_unit"];
private ["_tmp", "_var"];

_tmp = [];
{
    _tmp pushBack 0;
    false
} count GVAR(Ticks);
SETUVAR3(_unit, Tick_Properties, _tmp);


_var = [_unit] call BIS_fnc_objectVar;
_tmp = addMissionEventHandler ["EachFrame", format["[%1] call %2", _var, FNCS(MT_DoTick)]];
SETUVAR3(_unit, _varName, _tmp);

#include "x\x39\ExtensiveMedicalsystem\scripting\footer.hpp"
