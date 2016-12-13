/*
 * Author:
 *      X39
 * 
 * Description:
 *      Finalizes the UserVariables array and settles everything that is required for later usage.
 * 
 * Arguments:
 *      UserVariables array
 * 
 * Return:
 *      -/-
 * Throws:
 *      Will throw an exception in case of any error
 */
#include "x\x39\ExtensiveMedicalsystem\scripting\defaultSQF.hpp"
#include "x\x39\ExtensiveMedicalsystem\scripting\header.hpp"

params ["_inArray"];
private ["_ReturnArray"];
_ReturnArray = [];
{
    _x set [CT_OFF_UNITVARS_CLASSNAME, format["X39_XMed_var_%1", _x select CT_OFF_UNITVARS_CLASSNAME]];
    if (!((_x select CT_OFF_UNITVARS_ISLIVE) || (_x select CT_OFF_UNITVARS_LOCAL))) then
    {
        (_ReturnArray select 1) pushBack _x;
    };
    false
} count _inArray;

_ReturnArray = [_inArray, _ReturnArray];
RETURN(_ReturnArray);

#include "x\x39\ExtensiveMedicalsystem\scripting\footer.hpp"