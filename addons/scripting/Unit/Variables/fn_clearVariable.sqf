#include "\z\xms\scripting\default.hpp"
#include "\z\xms\scripting\header.hpp"
/*
 * Author:
 *      xms
 * 
 * Description:
 *      Clears a unit variable from a unit.
 * 
 * Arguments:
 *      [
 *         <OBJECT>, // _unit - The unit to clear the variable from.
 *         <STRING>  // _unitVariableName - The name of the unit variable to clear.
 *      ]
 * 
 * Throws:
 *      - XMS_UNIT_VARIABLES_EXCEPTION_INVALID_UNIT_PROVIDED
 *        Thrown if the unit is not provided, is not an object or is null.
 *      - XMS_UNIT_VARIABLES_EXCEPTION_FAILED_TO_FIND_USER_VARIABLE
 *        Thrown if the unit variable could not be found.
 *      - XMS_UNIT_VARIABLES_EXCEPTION_UNIT_NOT_INITIALIZED
 *        Thrown if the unit is not initialized by the Extensive Medical System.
 * 
 * Return:
 *      -/-
 */

params [
    ["_unit", objNull, [objNull]],
    ["_unitVariableName", "", [""]],
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

// Throw an exception if the unit not initialized.
if !(_unit getVariable["XMS_Unit_Initialization_var_Initialized", false]) exitWith {
    throw [
        XMS_UNIT_VARIABLES_EXCEPTION_UNIT_NOT_INITIALIZED,
        "The '_unit' argument must be initialized by the Extensive Medical System.",
        _this
    ];
};

// Find the unit variable config.
private _unitVariable = _unitVariableName call XMS_Unit_Variables_fnc_GetVariableDeclaration;
private _variableName = _unitVariable get "name";
private _variableSynchronization = _unitVariable get "synchronization";

// Abort if the variable did not change.
private _currentValue = _unit getVariable [_variableName, _unitVariable get "default"];
if (_currentValue isEqualTo _value) exitWith { /* empty */ };

// Trigger the value change event.
private _cbUninit = _unitVariable get "events" get "uninit";
if (_cbUninit isNotEqualTo {}) then {
    [_unit, _variableName, _currentValue, _value] call _cbUninit;
};

// Set the variable.
if (_variableSynchronization < 0) then {
    _unit setVariable [_variableName, nil, false];
} else {
    _unit setVariable [_variableName, _value, true];
};

#include "\z\xms\scripting\footer.hpp"
 