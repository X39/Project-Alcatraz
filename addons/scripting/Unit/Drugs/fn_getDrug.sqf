#include "\z\xms\scripting\default.hpp"
#include "\z\xms\scripting\header.hpp"
/*
 * Author:
 *      xms
 * 
 * Description:
 *      Method to receive a drug declaration
 * 
 * Arguments:
 *      <STRING> // _drugName - The name of the unit drug declaration to receive.
 * 
 * Throws:
 *      - XMS_UNIT_DRUGS_EXCEPTION_FAILED_TO_FIND_DRUG
 *        Thrown if the drug could not be found.
 * 
 * Return:
 *      HASHMAP // The drug declaration.
 */

params [
    ["_drugName", "", [""]]
];

private _drug = XMS_Unit_Drugs_var_Cache get _drugName;
if isNil "_drug" exitWith {
    throw [
        XMS_UNIT_DRUGS_EXCEPTION_FAILED_TO_FIND_DRUG,
        format ["No drug with the name '%1' was found.", _drugName],
        _this
    ];
};
_drug

#include "\z\xms\scripting\footer.hpp"
 