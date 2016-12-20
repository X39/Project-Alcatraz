/*
 * Author:
 *      X39
 * 
 * Description:
 *      Adds new wound to given unit
 * 
 * Arguments:
 *      <OBJECT> Unit to add the wound to.
 *      <SCALAR> Size of the wound.
 *      <STRING> Area the wound got inflicted
 *      <STRING> OPTIONAL - The projectile that caused the wound
 * Return:
 *      -/-
 */
#define DISABLERETURN
#include "\x\x39\extensivemedicalsystem\scripting\defaultSQF.hpp"
#include "\x\x39\extensivemedicalsystem\scripting\header.hpp"

#include "\x\x39\extensivemedicalsystem\scripting\Body\ArrayIndexies.hpp"

params [
    ["_unit", objNull, [objNull]],
    ["_size", 1, [1]],
    ["_area", "", [""]],
    ["_projectile", "", [""]]
];
private ["_hits", "_tmp"];

_hits = _unit getVariable [BODY_VAR_BLEEDINGHITS, []];

_tmp = [];
_tmp set [BODY_OFF_BLEEDINGHITS_PROJECTILE, _projectile];
_tmp set [BODY_OFF_BLEEDINGHITS_SIZE, _size];
_tmp set [BODY_OFF_BLEEDINGHITS_HEAL_STATE, 1];
_tmp set [BODY_OFF_BLEEDINGHITS_AREA, _area];
_hits pushBack _tmp;

_unit setVariable [BODY_VAR_BLEEDINGHITS, _tmp];

#include "\x\x39\extensivemedicalsystem\scripting\footer.hpp"