/*
 * Author:
 *      xms
 * 
 * Description:
 *      Initialized a non-initialized unit so it is ready for use with ExtensiveMedicalsystem
 * 
 * Arguments:
 *      [
 *          <object> // The unit to initialize
 *      ]
 * 
 * Throws:
 *      - XMS_UNIT_INITIALIZATION_EXCEPTION_UNIT_PASSED_IS_NULL
 *        The input argument '_unit' is null
 *      - XMS_UNIT_INITIALIZATION_EXCEPTION_UNIT_ALREADY_INITIALIZED
 *        The input argument '_unit' is already initialized
 *      - XMS_UNIT_INITIALIZATION_EXCEPTION_UNIT_ALREADY_IN_INITIALIZATION
 *        The input argument '_unit' is already in initialization
 * 
 * Return:
 *      -/-
 */
#include "\z\extensivemedicalsystem\scripting\default.hpp"
#include "\z\extensivemedicalsystem\scripting\header.hpp"


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
    if (_unit getVariable ["XMS_Unit_Initialization_var_Initialized", false]) exitWith {
        throw [
            XMS_UNIT_INITIALIZATION_EXCEPTION_UNIT_ALREADY_INITIALIZED,
            "The input argument '_unit' is already initialized",
            _this
        ];
    };
    if (_unit getVariable ["XMS_Unit_Initialization_var_InitializingChanges", false]) exitWith {
        throw [
            XMS_UNIT_INITIALIZATION_EXCEPTION_UNIT_ALREADY_IN_INITIALIZATION,
            "The input argument '_unit' is already in initialization",
            _this
        ];
    };
    _unit setVariable ["XMS_Unit_Initialization_var_InitializingChanges", true];
    false
};

_unit setVariable [
    "XMS_Unit_Initialization_var_EventHandler_Hit",
    _unit addEventHandler ["Hit", {_this call XMS_Unit_HitDetection_fnc_Hit}]
];
_unit setVariable [
    "XMS_Unit_Initialization_var_EventHandler_HitPart",
    _unit addEventHandler ["HitPart", {_this call XMS_Unit_HitDetection_fnc_HitPart}]
];
_unit setVariable [
    "XMS_Unit_Initialization_var_EventHandler_HandleDamage",
    _unit addEventHandler ["HandleDamage", {_this call XMS_Unit_HitDetection_fnc_HandleDamage}]
];
_unit setVariable ["XMS_Unit_Initialization_var_Initialized", true];
_unit setVariable ["XMS_Unit_Initialization_var_InitializingChanges", false];

#include "\z\extensivemedicalsystem\scripting\footer.hpp"
