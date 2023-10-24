#include "\z\xms\scripting\default.hpp"
#include "\z\xms\scripting\header.hpp"
/*
 * Author:
 *      xms
 * 
 * Description:
 *      Simulates the unit's blood loss over time.
 * 
 * Arguments:
 *      [
 *          <OBJECT>, // _unit - The unit to simulate blood loss for.
 *          <NUMBER>  // _deltaT - Time relative to second for the simulation to stay in sync with the game.
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
    ["_deltaT", 0, [0]]
];

// Receive the current values
private _bloodPressure = [_unit, "CardiovascularSystem_BloodPressure"] call XMS_Unit_Variable_fnc_GetVariable;
private _bloodValue = [_unit, "CardiovascularSystem_BloodValue"] call XMS_Unit_Variable_fnc_GetVariable;
private _heartRate = [_unit, "CardiovascularSystem_HeartRate"] call XMS_Unit_Variable_fnc_GetVariable;

#pragma region Heart rate
private _isInVehicle = vehicle _unit != _unit;
private _velocity = velocity _unit;
private _angleUpDown = abs (_velocity vectorCos [0, 0, 1]);
private _speed = vectorMagnitude _velocity;
private _heartRateChange = 0;

// Calculate heart rate change with speed and angle of movement
if !_isInVehicle then {
    _heartRateChange = _speed * (_angleUpDown + 1);
};


// Increase: log(x) * 80 = ~ curve of heart rate change
// Decrease: x * 0.9 + 6 = reduce heart rate by 10% and add 6 to make sure it doesn't go below 60 by itself
if (_heartRateChange > 0) then {
    _heartRate = _heartRate + log _heartRateChange * 80;
} else {
    _heartRate = _heartRate * 0.9 + 6;
};
#pragma endregion Heart rate

// BloodThickness / hemostasis

// Write out current values
[_unit, "CardiovascularSystem_BloodPressure", _bloodPressure] call XMS_Unit_Variable_fnc_SetVariable;
[_unit, "CardiovascularSystem_BloodValue", _bloodValue] call XMS_Unit_Variable_fnc_SetVariable;
[_unit, "CardiovascularSystem_HeartRate", _heartRate] call XMS_Unit_Variable_fnc_SetVariable;

#include "\z\xms\scripting\footer.hpp"
