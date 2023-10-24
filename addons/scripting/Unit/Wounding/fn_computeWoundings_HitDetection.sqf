#include "\z\xms\scripting\default.hpp"
#include "\z\xms\scripting\header.hpp"
/*
 * Author:
 *      xms
 * 
 * Description:
 *      Using the provided arguments, this function will
 *      check which wound should be applied to the target
 *      and returns them accordingly.
 * 
 * Arguments:
 *      [
 *          <String>,  // Hit type ("bullet", "explosion", "blunt")
 *          <Scalar>,  // Radius of the hit
 *          <Scalar>,  // Velocity of the hit
 *          <String>,  // Section of the hit
 *          <Scalar>,  // Penetration level (0 -> no penetration, 1 -> penetration no exit, 2 -> penetration with exit)
 *          <Scalar>,  // Damage of the hit
 *          <Scalar>   // Random number representing the chance of for the wound to be applied
 *      ]
 * 
 * Throws:
 *      -/-
 * 
 * Return:
 *      -/-
 */

params [
    ["_hitType", "", [""]],
    ["_radius", 0, [0]],
    ["_velocity", 0, [0]],
    ["_section", "", [""]],
    ["_penetration", 0, [0]],
    ["_damage", 0, [0]],
    ["_chance", 0, [0]]
];

private _woundings = XMS_Unit_Wounding_fnc_GetAllWoundingDeclarations;

private _outWounds = [];
{
    private _baseChance = _woundings get "baseChance";
    if (_baseChance <= _chance) then { continue; };
    private _inflictionChance = _woundings get "Infliction" get "HitDetection" get "chance";
    if (_inflictionChance <= _chance) then { continue; };
    private _sections = _woundings get "Infliction" get "HitDetection" get "sections";
    if !(count _sections == 0 || _section in _sections) then { continue; };
    private _requirePenetration = _woundings get "Infliction" get "HitDetection" get "requirePenetration";
    if (_requirePenetration > _penetration) then { continue; };
    private _damageThreshold = _woundings get "Infliction" get "HitDetection" get "damageThreshold";
    if (_damageThreshold > _damage) then { continue; };
    private _radiusThreshold = _woundings get "Infliction" get "HitDetection" get "radiusThreshold";
    if (_radiusThreshold > _radius) then { continue; };
    private _velocityThreshold = _woundings get "Infliction" get "HitDetection" get "velocityThreshold";
    if (_velocityThreshold > _velocity) then { continue; };
    private _hitTypes = _woundings get "Infliction" get "HitDetection" get "hitTypes";
    if !(count _hitTypes == 0 || _hitType in _hitTypes) then { continue; };
    private _wound = _x call XMS_Unit_Wounding_fnc_CreateWound;
    _outWounds pushBack _wound get "declaredName";
} forEach _woundings;

_outWounds

#include "\z\xms\scripting\footer.hpp"
    