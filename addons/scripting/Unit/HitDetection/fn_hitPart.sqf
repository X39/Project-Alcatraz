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
 *      -/-
 * 
 * Return:
 *      -/-
 */
#include "\z\xms\scripting\default.hpp"
#include "\z\xms\scripting\header.hpp"

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
    private _hitSection = _selection call XMS_Unit_HitDetection_fnc_ResolveHitSection;
    _hits pushBack [_radius, vectorMagnitude _velocity, _hitSection];
} forEach _this;
XMS_Unit_HitDetection_var_LastHitPartResult = _hits;

#include "\z\xms\scripting\footer.hpp"
 