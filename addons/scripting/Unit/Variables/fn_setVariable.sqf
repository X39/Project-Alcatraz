/*
 * Author:
 *      xms
 * 
 * Description:
 *      Sets a unit variable to a given value and handles any events that may be triggered by the change.
 * 
 * Arguments:
 *      [
 *         <OBJECT>, // _unit - The unit to set the variable for.
 *         <STRING>, // _unitVariable - The name of the unit variable to set.
 *         <ANY>     // _value - The value to set the variable to.
 *      ]
 * 
 * Throws:
 *      - XMS_UNIT_VARIABLES_EXCEPTION_INVALID_UNIT_PROVIDED
 *        Thrown if the unit is not provided, is not an object or is null.
 *      - XMS_UNIT_VARIABLES_EXCEPTION_FAILED_TO_FIND_USER_VARIABLE
 *        Thrown if the unit variable could not be found.
 * 
 * Return:
 *      -/-
 */
#include "\z\xms\scripting\default.hpp"
#include "\z\xms\scripting\header.hpp"

params [
    ["_unit", objNull, [objNull]],
    ["_unitVariable", "", [""]],
    ["_value", nil]
];

// Throw an exception if the unit is not provided.
if isNull _unit exitWith {
    throw [
        XMS_UNIT_VARIABLES_EXCEPTION_INVALID_UNIT_PROVIDED,
        "The '_unit' argument must be provided, must be an object and must not be null.",
        _this
    ];
};

// Find the unit variable config.
private _unitVariableConfig = missionConfigFile >> "ExtensiveMedicalSystem" >> "UnitVariables" >> _unitVariable;
if isNull _unitVariableConfig then {
    _unitVariableConfig = configFile >> "ExtensiveMedicalSystem" >> "UnitVariables" >> _unitVariable;
};
if isNull _unitVariableConfig exitWith {
    throw [
        XMS_UNIT_VARIABLES_EXCEPTION_FAILED_TO_FIND_USER_VARIABLE,
        format ["No user variable with the name '%1' was found.", _unitVariable],
        _this
    ];
};

// Get the variable hashmap and the variable name.
private _unitVariable = _unitVariableConfig call XMS_Unit_Variables_fnc_CreateVariable;
private _variableName = _unitVariable get "name";

// Abort if the variable did not change.
private _currentValue = _unit getVariable [_variableName, _unitVariable get "defaultValue"];
if (_currentValue isEqualTo _value) exitWith { /* empty */ };

// Trigger the value change event.
private _cbValueChange = _unitVariable get "events" get "valueChange";
if (_cbValueChange isNotEqualTo {}) then {
    [_unit, _variableName, _currentValue, _value] call _cbValueChange;
};

// Set the variable.
if (_unitVariable get "isLocal") then {
    _unit setVariable [_variableName, _value, false];
} else {
    if (_unitVariable get "isLive") then {
        isNil {
            _unit setVariable [_variableName, _value];
            XMS_Unit_Variables_var_DelayedChanges set [_variableName, true];
            false
        };
    } else {
        _unit setVariable [_variableName, _value, true];
    };
};

#include "\z\xms\scripting\footer.hpp"
 