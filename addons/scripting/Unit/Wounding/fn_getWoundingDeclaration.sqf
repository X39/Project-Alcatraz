#include "\z\xms\scripting\default.hpp"
#include "\z\xms\scripting\header.hpp"
/*
 * Author:
 *      xms
 * 
 * Description:
 *      Method to receive all wounding declarations.
 * 
 * Arguments:
 *      <STRING> // _woundingName - The name of the wounding declaration to receive.
 * 
 * Throws:
 *      -/-
 * 
 * Return:
 *      HASHMAP // The wounding declaration.
 */

params [
    ["_woundingName", "", [""]]
];

private _wounding = XMS_Unit_Wounding_var_Cache get _woundingName;
if isNil "_wounding" exitWith {
    throw [
        XMS_UNIT_WOUNDING_EXCEPTION_FAILED_TO_FIND_WOUNDING,
        format ["No wounding with the name '%1' was found.", _woundingName],
        _this
    ];
};
_wounding

#include "\z\xms\scripting\footer.hpp"
 