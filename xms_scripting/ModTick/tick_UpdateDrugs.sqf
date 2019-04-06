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
private ["_tickFnc"];

{
    _tickFnc = _x select OFF_DRUG_TICKFNC;
    [_unit, _compensation] call _tickFnc;
    false
} count xms_XMed_var_Drug;

#include "\x\xms\extensivemedicalsystem\scripting\footer.hpp"