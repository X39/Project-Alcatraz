#include "\z\xms\scripting\default.hpp"
#include "\z\xms\scripting\header.hpp"
/*
 * Author:
 *      xms
 * 
 * Description:
 *      Applies a single wound to a unit.
 * 
 * Arguments:
 *      [
 *          <OBJECT>,  // Unit to apply the wound to
 *          <STRING>,  // Section of the wound to apply
 *          <HASHMAP>, // Wound to apply as created by XMS_Unit_Wounding_fnc_CreateWound
 *      ]
 * 
 * Throws:
 *      - XMS_UNIT_WOUNDING_EXCEPTION_UNIT_ARGUMENT_ERROR
 *        The '_unit' argument is null.
 *      - XMS_UNIT_WOUNDING_EXCEPTION_UNIT_NOT_INITIALIZED
 *        The '_unit' argument must be initialized by the Extensive Medical System.
 *      - XMS_UNIT_WOUNDING_EXCEPTION_SECTION_ARGUMENT_ERROR
 *        The '_section' argument is empty.
 *      - XMS_UNIT_WOUNDING_EXCEPTION_WOUND_ARGUMENT_ERROR
 *        The '_wound' argument is nil or not a hashmap.
 *      - XMS_UNIT_WOUNDING_EXCEPTION_SECTION_UNKNOWN
 *        The '_section' argument is invalid.
 * 
 * Return:
 *      -/-
 */

params [
    ["_unit", objNull, [objNull]],
    ["_section", "", [""]],
    ["_wound", nil, [createHashMap]]
];

if isNull _unit exitWith {
    throw [
        XMS_UNIT_WOUNDING_EXCEPTION_UNIT_ARGUMENT_ERROR,
        "The '_unit' argument is null.",
        _this
    ];
};

// Throw an exception if the unit not initialized.
if !(_unit getVariable["XMS_Unit_Initialization_var_Initialized", false]) exitWith {
    throw [
        XMS_UNIT_WOUNDING_EXCEPTION_UNIT_NOT_INITIALIZED,
        "The '_unit' argument must be initialized by the Extensive Medical System.",
        _this
    ];
};

if (_section == "") exitWith {
    throw [
        XMS_UNIT_WOUNDING_EXCEPTION_SECTION_ARGUMENT_ERROR,
        "The '_section' argument is empty.",
        _this
    ];
};

if (isNil "_wound") exitWith {
    throw [
        XMS_UNIT_WOUNDING_EXCEPTION_WOUND_ARGUMENT_ERROR,
        "The '_wound' argument is nil or not a hashmap.",
        _this
    ];
};

isNil {
    switch _section do {
        case "head": {
            private _wounds = [_unit, "Wound_Head"] call XMS_Unit_Variables_fnc_GetVariable;
            _wounds pushBack _wound;
            [_unit, "Wound_Head", _wounds] call XMS_Unit_Variables_fnc_SetVariable;
        };
        case "rips": {
            private _wounds = [_unit, "Wound_Rips"] call XMS_Unit_Variables_fnc_GetVariable;
            _wounds pushBack _wound;
            [_unit, "Wound_Rips", _wounds] call XMS_Unit_Variables_fnc_SetVariable;
        };
        case "body": {
            private _wounds = [_unit, "Wound_Body"] call XMS_Unit_Variables_fnc_GetVariable;
            _wounds pushBack _wound;
            [_unit, "Wound_Body", _wounds] call XMS_Unit_Variables_fnc_SetVariable;
        };
        case "left-upper-arm": {
            private _wounds = [_unit, "Wound_LeftUpperArm"] call XMS_Unit_Variables_fnc_GetVariable;
            _wounds pushBack _wound;
            [_unit, "Wound_LeftUpperArm", _wounds] call XMS_Unit_Variables_fnc_SetVariable;
        };
        case "left-lower-arm": {
            private _wounds = [_unit, "Wound_LeftLowerArm"] call XMS_Unit_Variables_fnc_GetVariable;
            _wounds pushBack _wound;
            [_unit, "Wound_LeftLowerArm", _wounds] call XMS_Unit_Variables_fnc_SetVariable;
        };
        case "left-hand": {
            private _wounds = [_unit, "Wound_LeftHand"] call XMS_Unit_Variables_fnc_GetVariable;
            _wounds pushBack _wound;
            [_unit, "Wound_LeftHand", _wounds] call XMS_Unit_Variables_fnc_SetVariable;
        };
        case "right-upper-arm": {
            private _wounds = [_unit, "Wound_RightUpperArm"] call XMS_Unit_Variables_fnc_GetVariable;
            _wounds pushBack _wound;
            [_unit, "Wound_RightUpperArm", _wounds] call XMS_Unit_Variables_fnc_SetVariable;
        };
        case "right-lower-arm": {
            private _wounds = [_unit, "Wound_RightLowerArm"] call XMS_Unit_Variables_fnc_GetVariable;
            _wounds pushBack _wound;
            [_unit, "Wound_RightLowerArm", _wounds] call XMS_Unit_Variables_fnc_SetVariable;
        };
        case "right-hand": {
            private _wounds = [_unit, "Wound_RightHand"] call XMS_Unit_Variables_fnc_GetVariable;
            _wounds pushBack _wound;
            [_unit, "Wound_RightHand", _wounds] call XMS_Unit_Variables_fnc_SetVariable;
        };
        case "left-upper-leg": {
            private _wounds = [_unit, "Wound_LeftUpperLeg"] call XMS_Unit_Variables_fnc_GetVariable;
            _wounds pushBack _wound;
            [_unit, "Wound_LeftUpperLeg", _wounds] call XMS_Unit_Variables_fnc_SetVariable;
        };
        case "left-lower-leg": {
            private _wounds = [_unit, "Wound_LeftLowerLeg"] call XMS_Unit_Variables_fnc_GetVariable;
            _wounds pushBack _wound;
            [_unit, "Wound_LeftLowerLeg", _wounds] call XMS_Unit_Variables_fnc_SetVariable;
        };
        case "left-foot": {
            private _wounds = [_unit, "Wound_LeftFoot"] call XMS_Unit_Variables_fnc_GetVariable;
            _wounds pushBack _wound;
            [_unit, "Wound_LeftFoot", _wounds] call XMS_Unit_Variables_fnc_SetVariable;
        };
        case "right-upper-leg": {
            private _wounds = [_unit, "Wound_RightUpperLeg"] call XMS_Unit_Variables_fnc_GetVariable;
            _wounds pushBack _wound;
            [_unit, "Wound_RightUpperLeg", _wounds] call XMS_Unit_Variables_fnc_SetVariable;
        };
        case "right-lower-leg": {
            private _wounds = [_unit, "Wound_RightLowerLeg"] call XMS_Unit_Variables_fnc_GetVariable;
            _wounds pushBack _wound;
            [_unit, "Wound_RightLowerLeg", _wounds] call XMS_Unit_Variables_fnc_SetVariable;
        };
        case "right-foot": {
            private _wounds = [_unit, "Wound_RightFoot"] call XMS_Unit_Variables_fnc_GetVariable;
            _wounds pushBack _wound;
            [_unit, "Wound_RightFoot", _wounds] call XMS_Unit_Variables_fnc_SetVariable;
        };
        default {
            throw [
                XMS_UNIT_WOUNDING_EXCEPTION_SECTION_UNKNOWN,
                format ["The '_section' argument is invalid: %1", _section],
                _this
            ];
        };

    };
    false
};

#include "\z\xms\scripting\footer.hpp"
