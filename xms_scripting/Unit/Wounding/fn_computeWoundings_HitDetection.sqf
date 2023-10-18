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
#include "\z\extensivemedicalsystem\scripting\default.hpp"
#include "\z\extensivemedicalsystem\scripting\header.hpp"

params ["_hitType", "_radius", "_velocity", "_section", "_penetration", "_damage", "_chance"];

private _configClassesFilter = "getNumber (_x >> 'scope') > 0 && getNumber (_x >> 'Infliction' >> 'HitDetection' >> 'enabled')";
private _configWounds = _configClassesFilter configClasses (configFile >> "ExtensiveMedicalsystem" >> "Wounds");
private _missionConfigWounds = _configClassesFilter configClasses (configFile >> "ExtensiveMedicalsystem" >> "Wounds");
_configWounds append _missionConfigWounds;

private _outWounds = [];
{
    private _baseChance = getNumber (_x >> "baseChance");
    if (_baseChance <= _chance) then { continue; };
    private _inflictionChance = getNumber (_x >> "Infliction" >> "HitDetection" >> "chance");
    if (_inflictionChance <= _chance) then { continue; };
    private _sections = getArray (_x >> "Infliction" >> "HitDetection" >> "sections");
    if !(_section in _sections) then { continue; };
    private _requirePenetration = getNumber (_x >> "Infliction" >> "HitDetection" >> "requirePenetration");
    if (_requirePenetration > _penetration) then { continue; };
    private _damageThreshold = getNumber (_x >> "Infliction" >> "HitDetection" >> "damageThreshold");
    if (_damageThreshold > _damage) then { continue; };
    private _radiusThreshold = getNumber (_x >> "Infliction" >> "HitDetection" >> "radiusThreshold");
    if (_radiusThreshold > _radius) then { continue; };
    private _velocityThreshold = getNumber (_x >> "Infliction" >> "HitDetection" >> "velocityThreshold");
    if (_velocityThreshold > _velocity) then { continue; };
    private _hitTypes = getArray (_x >> "Infliction" >> "HitDetection" >> "hitTypes");
    if !(_hitType in _hitTypes) then { continue; };
    private _wound = _x call XMS_Unit_Wounding_fnc_CreateWound;
    _outWounds pushBack _wound;
} forEach _configWounds;

_outWounds

#include "\z\extensivemedicalsystem\scripting\footer.hpp"
    