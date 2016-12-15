/*
 * Author:
 *      X39
 * 
 * Description:
 *      Changes the blackOutState of this unit.
 *      Unit variables this function uses:
 *          - BOS_STATE
 *          - BOS_INFO
 * 
 * Arguments:
 *      <OBJECT>            Object to change the blackOutState of
 *      <SCALAR>            Target State to reach
 *                              * -1 -> Update Text
 *                              *  0 -> awake
 *                              *  1 -> blackedOut, timed (calling twice resets timer)
 *                              *  2 -> blackedOut, conditioned
 *                              *  3 -> dead
 *      <SCALAR|NIL>        Time a unit should remain in state 1
 *                          OR
 *                          nil for all other states
 *      <BOOL>              Override the transition checks
 *                          Allows to change the current state to another which would normally not
 *                          be allowed due to transition rules
 * 
 * Return:
 *      <BOOL>  TRUE if change was successfull, FALSE if something moved wrong
 *              (eg. unit is in state > 1 & not everything is yet healed)
 * Throws:
 *      EX_ID_GENERIC_INVALID_ARG       if inArg0 is NULL object
 *      EX_ID_GENERIC_INVALID_ARG       if inArg0 is not having CAManBase as parent (--> vehicle)
 *      EX_ID_GENERIC_INVALID_ARG       if inArg2 is not valid for the state you want to reach
 *                                      (message will contain further details)
 *      EX_ID_GENERIC_INVALID_LOCALITY  in case inArg0 is not local to current computer
 */
#include "\x\x39\extensivemedicalsystem\scripting\defaultSQF.hpp"
#include "\x\x39\extensivemedicalsystem\scripting\header.hpp"
#include "\x\x39\extensivemedicalsystem\scripting\BlackOutSystem\infoArrayOffsets.hpp"
params [
	["_unit", objNull, [objNull]],
	["_state", 0, [0]],
	["_stageArg", nil, [0, [], nil]],
	["_text", "", [""]],
	["_override", false, [false]]
];
//REGION Argument Validation
if (isNull _unit) then
{
    throw [
        EX_ID_GENERIC_INVALID_ARG,
        format["inArg0 is null but should be a valid unit"],
        STACKTRACE,
        nil
    ];
};
if (_unit isKindOf "CAManBase") then
{
    throw [
        EX_ID_GENERIC_INVALID_ARG,
        format["inArg0 is no valid unit (vehicle instead of soldier?)"],
        STACKTRACE,
        nil
    ];
};
if (!local _unit) then
{
    throw [
        EX_ID_GENERIC_INVALID_LOCALITY,
        format["inArg0 is not local to current computer"],
        STACKTRACE,
        nil
    ];
};
switch (_state) do
{
    case -1; case 0; case 3; case 2: {
        if (!isNil "_stageArg") then
        {
            throw [
                EX_ID_GENERIC_INVALID_ARG,
                format["inArg2 expected nil"],
                STACKTRACE,
                nil
            ];
        };
    };
    case 1: {
        if (typeName _stageArg != "STRING") then
        {
            throw [
                EX_ID_GENERIC_INVALID_ARG,
                format["inArg2 expected STRING"],
                STACKTRACE,
                nil
            ];
        };
    };
};
//ENDREGION

_currentState = _unit getVariable "X39_XMed_var_BOS_STATE";

switch (_state) do
{
    case -1: {
        [_text] call X39_XMed_fnc_BOS_ChangeDisplayText;
        RETURN(true);
    };
    case 0: {
        if (_currentState > 1 && {!_override || ([_unit] call X39_XMed_fnc_BOS_CheckConditions)}) then
        {
            RETURN(false);
        }
        else
        {
            _unit setVariable ["X39_XMed_var_BOS_STATE", _state, true];
            [_unit] call X39_XMed_fnc_BOS_WakeUnit;
            RETURN(true);
        };
    };
    case 1: {
        if (_currentState > 1 && {!_override || ([_unit] call X39_XMed_fnc_BOS_CheckConditions)}) then
        {
            RETURN(false);
        }
        else
        {
            private ["_tmpArr"];
            _unit setVariable ["X39_XMed_var_BOS_STATE", _state, true];
            
            _tmpArr = [time, _stageArg];
            _tmpArr set [BOS_OFF_TIMEMAX, _stageArg];
            
            _unit setVariable ["X39_XMed_var_BOS_INFO", _tmpArr];
            
            [_unit] call X39_XMed_fnc_BOS_BlackOutUnit;
            [_text] call X39_XMed_fnc_BOS_ChangeDisplayText;
            
            RETURN(true);
        };
    };
    case 2: {
        if (_currentState > 2 && {!_override || ([_unit] call X39_XMed_fnc_BOS_CheckConditions)}) then
        {
            RETURN(false);
        }
        else
        {
            _unit setVariable ["X39_XMed_var_BOS_STATE", _state, true];
            [_unit] call X39_XMed_fnc_BOS_BlackOutUnit;
            [_text] call X39_XMed_fnc_BOS_ChangeDisplayText;
            
            RETURN(true);
        };
    };
    case 3: {
        //ToDo: Implement heart system & update this
        //      (depending on implementation this state might just needs to copy state 2)
        throw EXNOTIMPLEMENTED;
    };
};
#include "\x\x39\extensivemedicalsystem\scripting\footer.hpp"