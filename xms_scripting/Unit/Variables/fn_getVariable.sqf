/*
 * Author:
 *      xms
 * 
 * Description:
 *      Receives a unit variable from a unit.
 * 
 * Arguments:
 *      [
 *         <OBJECT>, // _unit - The unit to receive the variable from.
 *         <STRING>  // _unitVariable - The name of the unit variable to receive.
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
#include "\z\extensivemedicalsystem\scripting\default.hpp"
#include "\z\extensivemedicalsystem\scripting\header.hpp"

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

// Return the current value of the variable.
private _currentValue = _unit getVariable [_variableName, _unitVariable get "defaultValue"];
_currentValue

#include "\z\extensivemedicalsystem\scripting\footer.hpp"
 