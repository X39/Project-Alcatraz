/*
 * Author:
 *      X39
 * 
 * Description:
 *      Calls drug update functions
 * 
 * Arguments:
 *      [<UNIT:OBJECT>, <FPSCOMPENSATION:SCALAR>]
 * 
 * Return:
 *      -/-
 */
#define DISABLERETURN
#include "x\x39\ExtensiveMedicalsystem\scripting\defaultSQF.hpp"
#include "x\x39\ExtensiveMedicalsystem\scripting\header.hpp"

#include "x\x39\ExtensiveMedicalsystem\scripting\ClassTransition\DrugsOffset.hpp"

params ["_unit", "_compensation"];
private ["_checkFnc"];

//Just call with state "AWAKE" as the BOS state wont change when conditions are blocking it.
[_unit, 0] call X39_XMed_fnc_BOS_ChangeState;

#include "x\x39\ExtensiveMedicalsystem\scripting\footer.hpp"