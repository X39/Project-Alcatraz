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
private ["_tickFnc"];

{
    _tickFnc = _x select OFF_DRUG_TICKFNC;
    [_unit, _compensation] call _tickFnc;
    false
} count X39_XMed_var_Drug;

#include "x\x39\ExtensiveMedicalsystem\scripting\footer.hpp"