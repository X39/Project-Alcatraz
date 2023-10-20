#include "\z\xms\scripting\default.hpp"
#include "\z\xms\scripting\header.hpp"
/*
 * Author:
 *      xms
 * 
 * Description:
 *      Resolves the hit section of a projectile hit.
 * 
 * Remarks:
 *      The hit sections resolved are:
 *          - head
 *          - rips
 *          - body
 *          - left-upper-arm
 *          - left-lower-arm
 *          - left-hand
 *          - right-upper-arm
 *          - right-lower-arm
 *          - right-hand
 *          - left-upper-leg
 *          - left-lower-leg
 *          - left-foot
 *          - right-upper-leg
 *          - right-lower-leg
 *          - right-foot
 * 
 * Arguments:
 *      [
 *          <string...> // The hit selection string as provided by the hitPart event handler.
 *      ]
 * 
 * Throws:
 *      - XMS_UNIT_HITDETECTION_EXCEPTION_FAILED_TO_RESOLVE_HIT_SECTION
 *        Thrown when the hit section could not be resolved.
 * 
 * Return:
 *      <string> // The hit section of XMS.
 */


private _hitSection = nil;
{
    #pragma sls disable VV-001 // Variable is not used -- The variable is used in the exitWith statement.
    if (_x in ["head", "neck"]) exitWith {_hitSection = "head";};
    if (_x in ["spine3", "spine2"]) exitWith {_hitSection = "rips";};
    if (_x in ["spine", "spine1", "pelvis"]) exitWith {_hitSection = "body";};
    if (_x in ["leftarmroll", "leftshoulder"]) exitWith {_hitSection = "left-upper-arm";};
    if (_x in ["leftforearmroll", "leftforearm"]) exitWith {_hitSection = "left-lower-arm";};
    if (_x in ["lefthand"]) exitWith {_hitSection = "left-hand";};
    if (_x in ["rightarmroll", "rightshoulder"]) exitWith {_hitSection = "right-upper-arm";};
    if (_x in ["rightforearmroll", "rightforearm"]) exitWith {_hitSection = "right-lower-arm";};
    if (_x in ["righthand"]) exitWith {_hitSection = "right-hand";};
    if (_x in ["leftupleg", "leftuplegroll", "leftleg"]) exitWith {_hitSection = "left-upper-leg";};
    if (_x in ["leftlegroll"]) exitWith {_hitSection = "left-lower-leg";};
    if (_x in ["leftfoot", "lefttoebase"]) exitWith {_hitSection = "left-foot";};
    if (_x in ["rightupleg", "rightuplegroll", "rightleg"]) exitWith {_hitSection = "right-upper-leg";};
    if (_x in ["rightlegroll"]) exitWith {_hitSection = "right-lower-leg";};
    if (_x in ["rightfoot", "righttoebase"]) exitWith {_hitSection = "right-foot";};
    #pragma sls enable VV-001 // Variable is not used
} forEach _this;
if (isNil "_hitSection") exitWith {
    throw [
        XMS_UNIT_HITDETECTION_EXCEPTION_FAILED_TO_RESOLVE_HIT_SECTION,
        "Failed to resolve hit section.",
        _this
    ];
};
_hitSection;

#include "\z\xms\scripting\footer.hpp"
  