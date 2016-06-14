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
 *      [
 *          <UNIT:OBJECT>
 *      ]
 * 
 * Return:
 *      -/-
 */
private "_fnc_scriptName";
_fnc_scriptName = "GenFunc_DrugUpdateTick_%1";

#define DISABLERETURN
#include "x\x39\ExtensiveMedicalsystem\scripting\defaultSQF.hpp"
#include "x\x39\ExtensiveMedicalsystem\scripting\header.hpp"
#include "x\x39\ExtensiveMedicalsystem\scripting\ClassTransition\CTArrayOffsets.hpp"

params ["_unit"];
private ["_currentValue"];
_currentValue = _unit getVariable GVARS(%2);
_currentValue = _currentValue + %3;

%4

SETUVAR3(_unit, GVARS(%2), _currentValue);

#include "x\x39\ExtensiveMedicalsystem\scripting\footer.hpp"
