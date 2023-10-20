#include "\z\xms\scripting\default.hpp"
#include "\z\xms\scripting\header.hpp"
/*
 * Author:
 *      xms
 * 
 * Description:
 *      Synchronizes all variables due for synchronization since the last call.
 * 
 * Arguments:
 *      [
 *          <OBJECT>, // Unit to synchronize
 *          <SCALAR>  // Time since last call
 *      ]
 * 
 * Throws:
 *      -/-
 * 
 * Return:
 *      -/-
 */

params [
    ["_unit", objNull, [objNull]],
    ["_time", 0, [0]]
];

// Throw an exception if the unit is null.
if (isNull _unit) exitWith {
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

if (_time == 0) exitWith { /* Nothing to be done */ };

if (_time == -1) then {
    isNil {
        {
            _unit setVariable [_x, _unit getVariable _x, true];
            XMS_Unit_Variables_var_DelayedChanges set [_x, -1];
        } forEach XMS_Unit_Variables_var_DelayedChanges;
        false
    };
} else {
    isNil {
        {
            if (_y >= 0) then {
                private _newY = _y - _time;
                if (_newY <= 0) then {
                    _unit setVariable [_x, _unit getVariable _x, true];
                    XMS_Unit_Variables_var_DelayedChanges set [_x, -1];
                } else {
                    XMS_Unit_Variables_var_DelayedChanges set [_x, _newY];
                };
            };
        } forEach XMS_Unit_Variables_var_DelayedChanges;
        false
    };
};

#include "\z\xms\scripting\footer.hpp"
 