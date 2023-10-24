#include "\z\xms\scripting\default.hpp"
#include "\z\xms\scripting\header.hpp"
/*
 * Author:
 *      xms
 * 
 * Description:
 *      Creates a drug <HASHMAP> from a corresponding drug config <CONFIG>.
 * 
 * Arguments:
 *      <CONFIG> // The config to create a drug <HASHMAP> from.
 * 
 * Throws:
 *      - XMS_UNIT_DRUGS_EXCEPTION_CONFIG_IS_NULL
 *        The '_config' argument is configNull.
 * 
 * Return:
 *      <HASHMAP> // The drug <HASHMAP> created from the config <CONFIG>.
 */

params [
    ["_config", configNull, [configNull]]
];

if (isNull _config) exitWith {
    throw [
        XMS_UNIT_VARIABLES_EXCEPTION_CONFIG_IS_NULL,
        "The '_config' argument is configNull.",
        _this
    ];
};

private _hashMap = createHashMapFromArray [
    ["declaredName", configName _config],

];

_hashMap

#include "\z\xms\scripting\footer.hpp"
 