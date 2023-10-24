#include "\z\xms\scripting\default.hpp"
#include "\z\xms\scripting\header.hpp"
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
 *         <STRING>  // _unitVariableName - The name of the unit variable to receive.
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
    ["_unitVariableName", "", [""]]
];

// Throw an exception if the unit is not provided.
if isNull _unit exitWith {
    throw [
        XMS_UNIT_VARIABLES_EXCEPTION_INVALID_UNIT_PROVIDED,
        "The '_unit' argument must be provided, must be an object and must not be null.",
        _this
    ];
};

if !(_unit getVariable["XMS_Unit_Initialization_var_Initialized", false]) exitWith {
    throw [
        XMS_UNIT_VARIABLES_EXCEPTION_UNIT_NOT_INITIALIZED,
        "The '_unit' argument must be initialized by the Extensive Medical System.",
        _this
    ];
};

private _unitVariable = _unitVariableName call XMS_Unit_Variables_fnc_GetVariableDeclaration;
private _variableName = _unitVariable get "name";

// Return the current value of the variable.
private _currentValue = _unit getVariable [_variableName, _unitVariable get "default"];
_currentValue

#include "\z\xms\scripting\footer.hpp"
 