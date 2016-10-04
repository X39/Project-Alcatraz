/*
 * Author:
 *      X39
 * 
 * Description:
 *      Checks if provided unit is awake or blacked out.
 *      Unit variables this function uses:
 *          - BOS_STATE
 * 
 * Arguments:
 *      <OBJECT>            Object to check
 * Return:
 *      <BOOL>  TRUE if unit is awake, FALSE if blacked out (BOS_STATE != 0).
 * Throws:
 *      EX_ID_GENERIC_INVALID_ARG       if inArg0 is NULL object
 *      EX_ID_GENERIC_INVALID_ARG       if inArg0 is not having CAManBase as parent (--> vehicle)
 */
#include "x\x39\ExtensiveMedicalsystem\scripting\defaultSQF.hpp"
#include "x\x39\ExtensiveMedicalsystem\scripting\header.hpp"
params [
	["_unit", objNull, [objNull]],
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
//ENDREGION
RETURN(UVAR(_unit, BOS_STATE) == 0)
#include "x\x39\ExtensiveMedicalsystem\scripting\footer.hpp"