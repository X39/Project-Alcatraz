/*
 * Author:
 *      xms
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
#include "\x\xms\extensivemedicalsystem\scripting\defaultSQF.hpp"
#include "\x\xms\extensivemedicalsystem\scripting\header.hpp"

#include "\x\xms\extensivemedicalsystem\scripting\ClassTransition\DrugsOffset.hpp"

params ["_unit", "_compensation"];
private ["_checkFnc"];

//Just call with state "AWAKE" as the BOS state wont change when conditions are blocking it.
[_unit, 0] call xms_XMed_fnc_BOS_ChangeState;

#include "\x\xms\extensivemedicalsystem\scripting\footer.hpp"