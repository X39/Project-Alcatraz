#include "\z\xms\scripting\default.hpp"
#include "\z\xms\scripting\header.hpp"
/*
 * Author:
 *      xms
 * 
 * Description:
 *      Method to receive a variable declaration
 * 
 * Arguments:
 *      <STRING> // _variableName - The name of the unit variable declaration to receive.
 * 
 * Throws:
 *      - XMS_UNIT_VARIABLES_EXCEPTION_FAILED_TO_FIND_USER_VARIABLE
 *        Thrown if the unit variable could not be found.
 * 
 * Return:
 *      HASHMAP // The unit variable declaration.
 */

params [
    ["_variableName", "", [""]]
];

private _variable = XMS_Unit_Variables_var_Cache get _variableName;
if isNull _variable exitWith {
    throw [
        XMS_UNIT_VARIABLES_EXCEPTION_FAILED_TO_FIND_USER_VARIABLE,
        format ["No user variable with the name '%1' was found.", _variableName],
        _this
    ];
};
_variable

#include "\z\xms\scripting\footer.hpp"
 