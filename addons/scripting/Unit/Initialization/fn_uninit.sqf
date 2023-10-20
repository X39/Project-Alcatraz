#include "\z\xms\scripting\default.hpp"
#include "\z\xms\scripting\header.hpp"
/*
 * Author:
 *      xms
 * 
 * Description:
 *      Uninitialize a unit so it is no longer handled by ExtensiveMedicalsystem.
 * 
 * Arguments:
 *      [
 *          <object> // The unit to uninitialize
 *      ]
 * 
 * Throws:
 *      - XMS_UNIT_INITIALIZATION_EXCEPTION_UNIT_PASSED_IS_NULL
 *        The input argument '_unit' is null
 *      - XMS_UNIT_INITIALIZATION_EXCEPTION_UNIT_NOT_INITIALIZED
 *        The input argument '_unit' is already initialized
 *      - XMS_UNIT_INITIALIZATION_EXCEPTION_UNIT_ALREADY_IN_INITIALIZATION
 *        The input argument '_unit' is already in initialization
 * 
 * Return:
 *      -/-
 */


params [
    ["_unit", objNull, [objNull]]
];

if isNull _unit exitWith {
    throw [
        XMS_UNIT_INITIALIZATION_EXCEPTION_UNIT_PASSED_IS_NULL,
        "The input argument '_unit' is null",
        _this
    ];
};

isNil {
    if (_unit getVariable ["XMS_Unit_Initialization_var_Initialized", false] isEqualTo false) exitWith {
        throw [
            XMS_UNIT_INITIALIZATION_EXCEPTION_UNIT_NOT_INITIALIZED,
            "The input argument '_unit' is already initialized",
            _this
        ];
    };
    if (_unit getVariable ["XMS_Unit_Initialization_var_InitializingChanges", false] isEqualTo true) exitWith {
        throw [
            XMS_UNIT_INITIALIZATION_EXCEPTION_UNIT_ALREADY_IN_INITIALIZATION,
            "The input argument '_unit' is already in initialization",
            _this
        ];
    };
    _unit setVariable ["XMS_Unit_Initialization_var_InitializingChanges", true];
    false
};


private _hitEventHandler = _unit getVariable ["XMS_Unit_Initialization_var_EventHandler_Hit", -1];
if (_hitEventHandler != -1) then { _unit removeEventHandler ["Hit", _hitEventHandler]; };

private _hitPartEventHandler = _unit getVariable ["XMS_Unit_Initialization_var_EventHandler_HitPart", -1];
if (_hitPartEventHandler != -1) then { _unit removeEventHandler ["HitPart", _hitPartEventHandler]; };

private _handleDamageEventHandler = _unit getVariable ["XMS_Unit_Initialization_var_EventHandler_HandleDamage", -1];
if (_handleDamageEventHandler != -1) then { _unit removeEventHandler ["HandleDamage", _handleDamageEventHandler]; };

_unit setVariable ["XMS_Unit_Initialization_var_Initialized", false];
_unit setVariable ["XMS_Unit_Initialization_var_InitializingChanges", false];

// Uninitialize all unit variables
{
    private _name = _x get "name";
    private _defaultValue = _x get "default";
    [_unit, _name, _defaultValue] call XMS_Unit_Variables_fnc_ClearVariable;
} forEach ([] call XMS_Unit_Variables_fnc_GetAllVariables);

#include "\z\xms\scripting\footer.hpp"
