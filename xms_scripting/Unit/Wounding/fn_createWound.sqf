/*
 * Author:
 *      xms
 * 
 * Description:
 *      Using the config provided, this function will create a wound object (HASHMAP) for it.
 * 
 * Arguments:
 *      <Config>   // The config of the wound.
 * 
 * Throws:
 *      - XMS_UNIT_WOUNDING_EXCEPTION_ARGUMENT_CONFIG_NULL
 *        The '_config' argument is configNull.
 * 
 * Return:
 *      -/-
 */
#include "\z\extensivemedicalsystem\scripting\default.hpp"
#include "\z\extensivemedicalsystem\scripting\header.hpp"

params [
    ["_config", configNull, [configNull]]
];
if (isNull _config) exitWith {
    throw [
        XMS_UNIT_WOUNDING_EXCEPTION_ARGUMENT_CONFIG_NULL,
        "The '_config' argument is configNull.",
        _this
    ];
};


private _hashMap = createHashMapFromArray [
    ["scope", getNumber (_config >> "scope")],
    ["maximum", getNumber (_config >> "maximum")],
    ["baseChance", getNumber (_config >> "baseChance")],
    ["alwaysDetected", getNumber (_config >> "alwaysDetected")],
    ["detectionRequiredForTreatment", getNumber (_config >> "detectionRequiredForTreatment")],
    ["infliction", createHashMapFromArray [
        ["hitDetection", createHashMapFromArray [
            ["enabled", getNumber (_config >> "infliction" >> "hitDetection" >> "enabled")],
            ["sections", getArray (_config >> "infliction" >> "hitDetection" >> "sections")],
            ["hitTypes", getArray (_config >> "infliction" >> "hitDetection" >> "hitTypes")],
            ["chance", getNumber (_config >> "infliction" >> "hitDetection" >> "chance")],
            ["requirePenetration", getNumber (_config >> "infliction" >> "hitDetection" >> "requirePenetration")],
            ["damageThreshold", getNumber (_config >> "infliction" >> "hitDetection" >> "damageThreshold")],
            ["radiusThreshold", getNumber (_config >> "infliction" >> "hitDetection" >> "radiusThreshold")],
            ["velocityThreshold", getNumber (_config >> "infliction" >> "hitDetection" >> "velocityThreshold")]
        ]],
        ["heartrate", createHashMapFromArray [
            ["enabled", getNumber (_config >> "infliction" >> "heartrate" >> "enabled")],
            ["min", getNumber (_config >> "infliction" >> "heartrate" >> "min")],
            ["max", getNumber (_config >> "infliction" >> "heartrate" >> "max")],
            ["chance", getNumber (_config >> "infliction" >> "heartrate" >> "chance")]
        ]],
        ["bloodPressure", createHashMapFromArray [
            ["enabled", getNumber (_config >> "infliction" >> "bloodPressure" >> "enabled")],
            ["min", getNumber (_config >> "infliction" >> "bloodPressure" >> "min")],
            ["max", getNumber (_config >> "infliction" >> "bloodPressure" >> "max")],
            ["chance", getNumber (_config >> "infliction" >> "bloodPressure" >> "chance")]
        ]],
        ["bloodVolume", createHashMapFromArray [
            ["enabled", getNumber (_config >> "infliction" >> "bloodVolume" >> "enabled")],
            ["min", getNumber (_config >> "infliction" >> "bloodVolume" >> "min")],
            ["max", getNumber (_config >> "infliction" >> "bloodVolume" >> "max")],
            ["chance", getNumber (_config >> "infliction" >> "bloodVolume" >> "chance")]
        ]],
        ["bloodThikness", createHashMapFromArray [
            ["enabled", getNumber (_config >> "infliction" >> "bloodThikness" >> "enabled")],
            ["min", getNumber (_config >> "infliction" >> "bloodThikness" >> "min")],
            ["max", getNumber (_config >> "infliction" >> "bloodThikness" >> "max")],
            ["chance", getNumber (_config >> "infliction" >> "bloodThikness" >> "chance")]
        ]],
        ["pain", createHashMapFromArray [
            ["enabled", getNumber (_config >> "infliction" >> "pain" >> "enabled")],
            ["min", getNumber (_config >> "infliction" >> "pain" >> "min")],
            ["max", getNumber (_config >> "infliction" >> "pain" >> "max")],
            ["chance", getNumber (_config >> "infliction" >> "pain" >> "chance")]
        ]],
        ["respiratory", createHashMapFromArray [
            ["enabled", getNumber (_config >> "infliction" >> "respiratory" >> "enabled")],
            ["min", getNumber (_config >> "infliction" >> "respiratory" >> "min")],
            ["max", getNumber (_config >> "infliction" >> "respiratory" >> "max")],
            ["chance", getNumber (_config >> "infliction" >> "respiratory" >> "chance")]
        ]],
        ["oxygen", createHashMapFromArray [
            ["enabled", getNumber (_config >> "infliction" >> "oxygen" >> "enabled")],
            ["min", getNumber (_config >> "infliction" >> "oxygen" >> "min")],
            ["max", getNumber (_config >> "infliction" >> "oxygen" >> "max")],
            ["chance", getNumber (_config >> "infliction" >> "oxygen" >> "chance")]
        ]]
    ]],
    ["userInterface", createHashMapFromArray [
        ["groupAll", getNumber (_config >> "userInterface" >> "groupAll")],
        ["detected", createHashMapFromArray [
            ["enabled", getNumber (_config >> "userInterface" >> "detected" >> "enabled")],
            ["displayName", getText (_config >> "userInterface" >> "detected" >> "displayName")],
            ["description", getText (_config >> "userInterface" >> "detected" >> "description")],
            ["icon", getText (_config >> "userInterface" >> "detected" >> "icon")],
            ["color", getArray (_config >> "userInterface" >> "detected" >> "color")],
            ["textColor", getArray (_config >> "userInterface" >> "detected" >> "textColor")]
        ]],
        ["consciousUndetected", createHashMapFromArray [
            ["enabled", getNumber (_config >> "userInterface" >> "consciousUndetected" >> "enabled")],
            ["displayName", getText (_config >> "userInterface" >> "consciousUndetected" >> "displayName")],
            ["description", getText (_config >> "userInterface" >> "consciousUndetected" >> "description")],
            ["icon", getText (_config >> "userInterface" >> "consciousUndetected" >> "icon")],
            ["color", getArray (_config >> "userInterface" >> "consciousUndetected" >> "color")],
            ["textColor", getArray (_config >> "userInterface" >> "consciousUndetected" >> "textColor")]
        ]],
        ["unconsciousUndetected", createHashMapFromArray [
            ["enabled", getNumber (_config >> "userInterface" >> "unconsciousUndetected" >> "enabled")],
            ["displayName", getText (_config >> "userInterface" >> "unconsciousUndetected" >> "displayName")],
            ["description", getText (_config >> "userInterface" >> "unconsciousUndetected" >> "description")],
            ["icon", getText (_config >> "userInterface" >> "unconsciousUndetected" >> "icon")],
            ["color", getArray (_config >> "userInterface" >> "unconsciousUndetected" >> "color")],
            ["textColor", getArray (_config >> "userInterface" >> "unconsciousUndetected" >> "textColor")]
        ]]
    ]],
    ["bleeding", createHashMapFromArray [
        ["enabled", getNumber (_config >> "bleeding" >> "enabled")],
        ["chance", getNumber (_config >> "bleeding" >> "chance")],
        ["woundHealth", getNumber (_config >> "bleeding" >> "woundHealth")],
        ["healingRatePerSecond", getNumber (_config >> "bleeding" >> "healingRatePerSecond")]
    ]],
    ["pain", createHashMapFromArray [
        ["enabled", getNumber (_config >> "pain" >> "enabled")],
        ["basePain", getNumber (_config >> "pain" >> "basePain")],
        ["painPerSecond", getNumber (_config >> "pain" >> "painPerSecond")],
        ["movementMultiplier", getNumber (_config >> "pain" >> "movementMultiplier")]
    ]],
    ["respiratory", createHashMapFromArray [
        ["enabled", getNumber (_config >> "respiratory" >> "enabled")],
        ["modifier", getNumber (_config >> "respiratory" >> "modifier")]
    ]],
    ["heartrate", createHashMapFromArray [
        ["enabled", getNumber (_config >> "heartrate" >> "enabled")],
        ["modifier", getNumber (_config >> "heartrate" >> "modifier")]
    ]],
    ["consciousness", createHashMapFromArray [
        ["enabled", getNumber (_config >> "consciousness" >> "enabled")],
        ["state", getNumber (_config >> "consciousness" >> "state")],
        ["chance", getNumber (_config >> "consciousness" >> "chance")],
        ["minTimeInSec", getNumber (_config >> "consciousness" >> "minTimeInSec")],
        ["midTimeInSec", getNumber (_config >> "consciousness" >> "midTimeInSec")],
        ["maxTimeInSec", getNumber (_config >> "consciousness" >> "maxTimeInSec")],
        ["timoutTimeInSec", getNumber (_config >> "consciousness" >> "timoutTimeInSec")],
        ["repeatable", getNumber (_config >> "consciousness" >> "repeatable")]
    ]]
];

_hashMap

#include "\z\extensivemedicalsystem\scripting\footer.hpp"
     