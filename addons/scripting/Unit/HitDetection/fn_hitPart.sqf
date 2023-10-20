#include "\z\xms\scripting\default.hpp"
#include "\z\xms\scripting\header.hpp"
/*
 * Author:
 *      xms
 * 
 * Description:
 *      Called when a unit is hit by a projectile.
 *      This EH is used to find out which body part was hit.
 *      The actual damage is applied in the hit EH.
 * 
 * Arguments:
 *      Whatever is passed to the EH
 * 
 * Throws:
 *      - XMS_UNIT_HIT_DETECTION_EXCEPTION_UNIT_NOT_INITIALIZED
 *        The unit was not initialized by the Extensive Medical System.
 * 
 * Return:
 *      -/-
 */

private _hits = [];
{
    _x params [
        "_target",
        "_shooter",
        "_projectile",
        "_position",
        "_velocity",
        "_selection",
        "_ammo",
        "_vector",
        "_radius",
        "_surfaceType",
        "_isDirect"
    ];

    // Throw an exception if the unit not initialized.
    if !(_target getVariable["XMS_Unit_Initialization_var_Initialized", false]) exitWith {
        throw [
            XMS_UNIT_HIT_DETECTION_EXCEPTION_UNIT_NOT_INITIALIZED,
            "The '_target' argument provided to the hitPart event handler must be initialized by the Extensive Medical System.",
            _this
        ];
    };
    private _hitSection = _selection call XMS_Unit_HitDetection_fnc_ResolveHitSection;
    _hits pushBack [_radius, vectorMagnitude _velocity, _hitSection];
} forEach _this;
XMS_Unit_HitDetection_var_LastHitPartResult = _hits; // ToDo: Make this use a unit variable instead of a global variable.

#include "\z\xms\scripting\footer.hpp"
 