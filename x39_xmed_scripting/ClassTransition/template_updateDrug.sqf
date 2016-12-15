/*
 * Author:
 *      X39
 * 
 * Description:
 *      PreInit file of this mod.
 *      Called BEFORE the objects are initialized.
 *      For further details, check:
 *      https://community.bistudio.com/wiki/Initialization_Order
 * 
 * Arguments:
 *      [<UNIT:OBJECT>, <FPSCOMPENSATION:SCALAR>]
 * 
 * Return:
 *      -/-
 */
private "_fnc_scriptName";
_fnc_scriptName = "GenFunc_DrugUpdateTick_%1";

#define DISABLERETURN
#include "\x\x39\extensivemedicalsystem\scripting\defaultSQF.hpp"
#include "\x\x39\extensivemedicalsystem\scripting\header.hpp"

params ["_unit", "_compensation"];
private ["_currentValue", "_tmpValue"];
_currentValue = _unit getVariable "X39_XMed_var_%2";
_currentValue = _currentValue + (%3 * _compensation);

%4

_unit setVariable ["X39_XMed_var_%2", _currentValue];

#include "\x\x39\extensivemedicalsystem\scripting\footer.hpp"
