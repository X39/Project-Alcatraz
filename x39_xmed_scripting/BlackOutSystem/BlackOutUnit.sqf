/*
 * Author:
 *      X39
 * 
 * Description:
 *      blacks out unit (shows dialog if is player), disables various AI stuff on AI.
 *		Helper function for BOS_ChangeState. Not intended to be callen manually.
 * 
 * Arguments:
 *      <OBJECT>            Object to blackout
 * Return:
 *      -/-
 * Throws:
 *      EX_ID_GENERIC_INVALID_ARG       if inArg0 is NULL object
 *      EX_ID_GENERIC_INVALID_ARG       if inArg0 is not having CAManBase as parent (--> vehicle)
 *      EX_ID_GENERIC_INVALID_LOCALITY  in case inArg0 is not local to current computer
 */
#include "x\x39\ExtensiveMedicalsystem\scripting\defaultSQF.hpp"
#include "x\x39\ExtensiveMedicalsystem\scripting\header.hpp"
#include "x\x39\ExtensiveMedicalsystem\scripting\BlackOutSystem\infoArrayOffsets.hpp"


params [
	["_unit", objNull, [objNull]]
];
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

if (hasInterface && {_unit == player}) then
{
	private ["_dlgResult"];
	_dlgResult = createDialog "XMS_BlackOutScreen";
}
else
{
};

#include "x\x39\ExtensiveMedicalsystem\scripting\footer.hpp"