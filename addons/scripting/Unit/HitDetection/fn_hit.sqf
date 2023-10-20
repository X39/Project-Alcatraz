#include "\z\xms\scripting\default.hpp"
#include "\z\xms\scripting\header.hpp"
/*
 * Author:
 *      xms
 * 
 * Description:
 *      Event handler to handle damage to a unit.
 * 
 * Arguments:
 *      Whatever is passed to the EH
 * 
 * Throws:
 *      - XMS_UNIT_HIT_DETECTION_EXCEPTION_UNIT_NOT_INITIALIZED
 *        The unit is not initialized by the Extensive Medical System.
 * 
 * Return:
 *      -/-
 */

params ["_unit", "_source", "_damage", "_instigator"];

// Throw an exception if the unit not initialized.
if !(_unit getVariable["XMS_Unit_Initialization_var_Initialized", false]) exitWith {
    throw [
        XMS_UNIT_HIT_DETECTION_EXCEPTION_UNIT_NOT_INITIALIZED,
        "The '_unit' argument provided to the hit event handler must be initialized by the Extensive Medical System.",
        _this
    ];
};

{
    #pragma sls typehint _radius ["SCALAR"];
    #pragma sls typehint _velocity ["SCALAR"];
    #pragma sls typehint _hitSection ["STRING"];
    _x params ["_radius", "_velocity", "_hitSection"];
    private _isPenetrated = _damage > XMS_Unit_HitDetection_var_PenetrationDamageThreshold;
    private _isDoublePenetration = _velocity > XMS_Unit_HitDetection_var_DoublePenetrationSpeedThreshold;
    private _chance = random 1;

    private _hitType = "bullet"; // ToDo: Figure out what hit types there are in arma (bullet, explosion, blunt, fire, drowning, fall, ...?);

    // Handle wounding
    private _wounds = [
        _hitType,
        _radius,
        _velocity,
        _hitSection,
        [0, [1, 2] select _isDoublePenetration] select _isPenetrated,
        _damage,
        _chance
    ] call XMS_Unit_Wounding_fnc_ComputeWoundings_HitDetection;
    {
        [_unit, _hitSection, _x] call XMS_Unit_Wounding_fnc_ApplyWound;
    } forEach _wounds;

} forEach XMS_Unit_HitDetection_var_LastHitPartResult;

0

#include "\z\xms\scripting\footer.hpp"
   