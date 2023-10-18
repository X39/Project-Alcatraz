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
 *      -/-
 * 
 * Return:
 *      -/-
 */
#include "\z\extensivemedicalsystem\scripting\default.hpp"
#include "\z\extensivemedicalsystem\scripting\header.hpp"

params ["_unit", "_source", "_damage", "_instigator"];
{
    #pragma sls typehint _radius ["SCALAR"];
    #pragma sls typehint _velocity ["SCALAR"];
    #pragma sls typehint _hitSection ["STRING"];
    _x params ["_radius", "_velocity", "_hitSection"];
    private _isPenetrated = _damage > XMS_Unit_HitDetection_var_PenetrationDamageThreshold;
    private _isDoublePenetration = _velocity > XMS_Unit_HitDetection_var_DoublePenetrationSpeedThreshold;
    private _chance = random 1;

    // Handle wounding
    private _wounds = [
        _radius,
        _velocity,
        _hitSection,
        [0, [1, 2] select _isDoublePenetration] select _isPenetrated,
        _damage,
        _chance
    ] call XMS_Unit_Wounding_fnc_ComputeWoundings_HitDetection;
    {
        _x call XMS_Unit_Wounding_fnc_ApplyWound;
    } forEach _wounds;

} forEach XMS_Unit_HitDetection_var_LastHitPartResult;

    // ToDo: Find out the damage the projectile actually inflicted and apply corresponding wound and pain values and HitIndex damages for bleeding effects
    //       (should be done using a "wound" function)

    /*
        [
            [
                B Alpha 1-2:1,
                B Alpha 1-1:1 (X39),
                164034: tracer_red.p3d,
                [1688.85,5632.95,6.55165],
                [369.328,686.804,-174.796],
                ["spine","hit_spine"],
                [10,0,0,0,"B_65x39_Caseless"],
                [-0.437098,-0.899181,0.020494],
                0.171129,
                "a3\data_f\penetration\meatbones.bisurf",
                true
            ]
        ]












        [
            [
                "hitface",      // 00
                "hitneck",      // 01
                "hithead",      // 02
                "hitpelvis",    // 03
                "hitabdomen",   // 04
                "hitdiaphragm", // 05
                "hitchest",     // 06
                "hitbody",      // 07
                "hitarms",      // 08
                "hithands",     // 09
                "hitlegs",      // 10
                "incapacitated" // 11
            ],
            ["face_hub","neck","head","pelvis","spine1","spine2","spine3","body","arms","hands","legs","body"],
            [0,0,0,0,0,0,0,0,0,0,0.833333,0.201979]
        ]

        cursorTarget setHitIndex [00, 0.999];
        cursorTarget setHitIndex [01, 0.999];
        cursorTarget setHitIndex [02, 0.999];
        cursorTarget setHitIndex [03, 0.999];
        cursorTarget setHitIndex [04, 0.999];
        cursorTarget setHitIndex [05, 0.999];
        cursorTarget setHitIndex [06, 0.999];
        cursorTarget setHitIndex [07, 0.999];
        cursorTarget setHitIndex [08, 0.999];
        cursorTarget setHitIndex [09, 0.999];
        cursorTarget setHitIndex [10, 0.999];
        cursorTarget setHitIndex [11, 0.999];
    */


0

#include "\z\extensivemedicalsystem\scripting\footer.hpp"
   