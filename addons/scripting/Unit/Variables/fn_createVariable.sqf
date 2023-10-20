#include "\z\xms\scripting\default.hpp"
#include "\z\xms\scripting\header.hpp"
/*
 * Author:
 *      xms
 * 
 * Description:
 *      Creates a unit variable <HASHMAP> from a corresponding unit variable config <CONFIG>.
 * 
 * Arguments:
 *      <CONFIG> // The config to create a unit variable <HASHMAP> from.
 * 
 * Throws:
 *      - XMS_UNIT_VARIABLES_EXCEPTION_CONFIG_IS_NULL
 *        The '_config' argument is configNull.
 * 
 * Return:
 *      <HASHMAP> // The unit variable <HASHMAP> created from the config <CONFIG>.
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

private _synchronization = getNumber (_config >> "synchronization");
private _hashMap = createHashMapFromArray [
    ["name", format["XMS_UnitVariable_var_%1", configName _config]],
    ["declaredName", configName _config],

    ["description", getText (_config >> "description")],
    ["default", call compile getText (_config >> "default")],
    ["synchronization", _synchronization],
    ["isLocal", _synchronization == -1],
    ["isLive", _synchronization == 0],
    ["events", createHashMapFromArray [
        ["init", compileFinal getText (_config >> "events" >> "init")],
        ["uninit", compileFinal getText (_config >> "events" >> "uninit")],
        ["localityChange", compileFinal getText (_config >> "events" >> "localityChange")],
        ["localityChanged", compileFinal getText (_config >> "events" >> "localityChanged")],
        ["valueChange", compileFinal getText (_config >> "events" >> "valueChange")]
    ]]
];

_hashMap

#include "\z\xms\scripting\footer.hpp"
 