#include "\z\xms\scripting\default.hpp"
#include "\z\xms\scripting\header.hpp"
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
    ["declaredName", configName _config],

    ["alwaysDetected", getNumber (_config >> "scope") > 0],
    ["maximum", getNumber (_config >> "maximum")],
    ["baseChance", getNumber (_config >> "baseChance")],
    ["detectionRequiredForTreatment", getNumber (_config >> "detectionRequiredForTreatment") > 0],
    ["minHealth", getNumber (_config >> "minHealth")],
    ["medHealth", getNumber (_config >> "medHealth")],
    ["maxHealth", getNumber (_config >> "maxHealth")],
    ["infliction", createHashMapFromArray [
        ["hitDetection", createHashMapFromArray [
            ["enabled", getNumber (_config >> "infliction" >> "hitDetection" >> "enabled") > 0],
            ["sections", getArray (_config >> "infliction" >> "hitDetection" >> "sections")],
            ["hitTypes", getArray (_config >> "infliction" >> "hitDetection" >> "hitTypes")],
            ["chance", getNumber (_config >> "infliction" >> "hitDetection" >> "chance")],
            ["requirePenetration", getNumber (_config >> "infliction" >> "hitDetection" >> "requirePenetration")],
            ["damageThreshold", getNumber (_config >> "infliction" >> "hitDetection" >> "damageThreshold")],
            ["radiusThreshold", getNumber (_config >> "infliction" >> "hitDetection" >> "radiusThreshold")],
            ["velocityThreshold", getNumber (_config >> "infliction" >> "hitDetection" >> "velocityThreshold")]
        ]],
        ["heartRate", createHashMapFromArray [
            ["enabled", getNumber (_config >> "infliction" >> "heartRate" >> "enabled") > 0],
            ["min", getNumber (_config >> "infliction" >> "heartRate" >> "min")],
            ["max", getNumber (_config >> "infliction" >> "heartRate" >> "max")],
            ["chance", getNumber (_config >> "infliction" >> "heartRate" >> "chance")]
        ]],
        ["bloodPressure", createHashMapFromArray [
            ["enabled", getNumber (_config >> "infliction" >> "bloodPressure" >> "enabled") > 0],
            ["min", getNumber (_config >> "infliction" >> "bloodPressure" >> "min")],
            ["max", getNumber (_config >> "infliction" >> "bloodPressure" >> "max")],
            ["chance", getNumber (_config >> "infliction" >> "bloodPressure" >> "chance")]
        ]],
        ["bloodVolume", createHashMapFromArray [
            ["enabled", getNumber (_config >> "infliction" >> "bloodVolume" >> "enabled") > 0],
            ["min", getNumber (_config >> "infliction" >> "bloodVolume" >> "min")],
            ["max", getNumber (_config >> "infliction" >> "bloodVolume" >> "max")],
            ["chance", getNumber (_config >> "infliction" >> "bloodVolume" >> "chance")]
        ]],
        ["bloodThikness", createHashMapFromArray [
            ["enabled", getNumber (_config >> "infliction" >> "bloodThikness" >> "enabled") > 0],
            ["min", getNumber (_config >> "infliction" >> "bloodThikness" >> "min")],
            ["max", getNumber (_config >> "infliction" >> "bloodThikness" >> "max")],
            ["chance", getNumber (_config >> "infliction" >> "bloodThikness" >> "chance")]
        ]],
        ["pain", createHashMapFromArray [
            ["enabled", getNumber (_config >> "infliction" >> "pain" >> "enabled") > 0],
            ["min", getNumber (_config >> "infliction" >> "pain" >> "min")],
            ["max", getNumber (_config >> "infliction" >> "pain" >> "max")],
            ["chance", getNumber (_config >> "infliction" >> "pain" >> "chance")]
        ]],
        ["respiratory", createHashMapFromArray [
            ["enabled", getNumber (_config >> "infliction" >> "respiratory" >> "enabled") > 0],
            ["min", getNumber (_config >> "infliction" >> "respiratory" >> "min")],
            ["max", getNumber (_config >> "infliction" >> "respiratory" >> "max")],
            ["chance", getNumber (_config >> "infliction" >> "respiratory" >> "chance")]
        ]],
        ["oxygen", createHashMapFromArray [
            ["enabled", getNumber (_config >> "infliction" >> "oxygen" >> "enabled") > 0],
            ["min", getNumber (_config >> "infliction" >> "oxygen" >> "min")],
            ["max", getNumber (_config >> "infliction" >> "oxygen" >> "max")],
            ["chance", getNumber (_config >> "infliction" >> "oxygen" >> "chance")]
        ]]
    ]],
    ["healing", createHashMapFromArray [
        ["healthPoints", createHashMapFromArray [
            ["enabled", getNumber (_config >> "healing" >> "healthPoints" >> "enabled") > 0],
            ["minHealPerSecond", getNumber (_config >> "healing" >> "healthPoints" >> "minHealPerSecond")],
            ["medHealPerSecond", getNumber (_config >> "healing" >> "healthPoints" >> "medHealPerSecond")],
            ["maxHealPerSecond", getNumber (_config >> "healing" >> "healthPoints" >> "maxHealPerSecond")],
            ["chance", getNumber (_config >> "healing" >> "healthPoints" >> "chance")]
        ]],
        ["heartRate", createHashMapFromArray [
            ["enabled", getNumber (_config >> "healing" >> "heartRate" >> "enabled") > 0],
            ["min", getNumber (_config >> "healing" >> "heartRate" >> "min")],
            ["max", getNumber (_config >> "healing" >> "heartRate" >> "max")],
            ["timeInSec", getNumber (_config >> "healing" >> "heartRate" >> "timeInSec")],
            ["chance", getNumber (_config >> "healing" >> "heartRate" >> "chance")]
        ]],
        ["bloodPressure", createHashMapFromArray [
            ["enabled", getNumber (_config >> "healing" >> "bloodPressure" >> "enabled") > 0],
            ["min", getNumber (_config >> "healing" >> "bloodPressure" >> "min")],
            ["max", getNumber (_config >> "healing" >> "bloodPressure" >> "max")],
            ["timeInSec", getNumber (_config >> "healing" >> "bloodPressure" >> "timeInSec")],
            ["chance", getNumber (_config >> "healing" >> "bloodPressure" >> "chance")]
        ]],
        ["bloodVolume", createHashMapFromArray [
            ["enabled", getNumber (_config >> "healing" >> "bloodVolume" >> "enabled") > 0],
            ["min", getNumber (_config >> "healing" >> "bloodVolume" >> "min")],
            ["max", getNumber (_config >> "healing" >> "bloodVolume" >> "max")],
            ["timeInSec", getNumber (_config >> "healing" >> "bloodVolume" >> "timeInSec")],
            ["chance", getNumber (_config >> "healing" >> "bloodVolume" >> "chance")]
        ]],
        ["bloodThikness", createHashMapFromArray [
            ["enabled", getNumber (_config >> "healing" >> "bloodThikness" >> "enabled") > 0],
            ["min", getNumber (_config >> "healing" >> "bloodThikness" >> "min")],
            ["max", getNumber (_config >> "healing" >> "bloodThikness" >> "max")],
            ["timeInSec", getNumber (_config >> "healing" >> "bloodThikness" >> "timeInSec")],
            ["chance", getNumber (_config >> "healing" >> "bloodThikness" >> "chance")]
        ]],
        ["pain", createHashMapFromArray [
            ["enabled", getNumber (_config >> "healing" >> "pain" >> "enabled") > 0],
            ["min", getNumber (_config >> "healing" >> "pain" >> "min")],
            ["max", getNumber (_config >> "healing" >> "pain" >> "max")],
            ["timeInSec", getNumber (_config >> "healing" >> "pain" >> "timeInSec")],
            ["chance", getNumber (_config >> "healing" >> "pain" >> "chance")]
        ]],
        ["respiratory", createHashMapFromArray [
            ["enabled", getNumber (_config >> "healing" >> "respiratory" >> "enabled") > 0],
            ["min", getNumber (_config >> "healing" >> "respiratory" >> "min")],
            ["max", getNumber (_config >> "healing" >> "respiratory" >> "max")],
            ["timeInSec", getNumber (_config >> "healing" >> "respiratory" >> "timeInSec")],
            ["chance", getNumber (_config >> "healing" >> "respiratory" >> "chance")]
        ]],
        ["oxygen", createHashMapFromArray [
            ["enabled", getNumber (_config >> "healing" >> "oxygen" >> "enabled") > 0],
            ["min", getNumber (_config >> "healing" >> "oxygen" >> "min")],
            ["max", getNumber (_config >> "healing" >> "oxygen" >> "max")],
            ["timeInSec", getNumber (_config >> "healing" >> "oxygen" >> "timeInSec")],
            ["chance", getNumber (_config >> "healing" >> "oxygen" >> "chance")]
        ]]
    ]],
    ["affection", createHashMapFromArray [
        ["bleeding", createHashMapFromArray [
            ["enabled", getNumber (_config >> "affection" >> "bleeding" >> "enabled") > 0],
            ["chance", getNumber (_config >> "affection" >> "bleeding" >> "chance")],
            ["useBloodPressure", getNumber (_config >> "affection" >> "bleeding" >> "useBloodPressure") > 0],
            ["mode", getText (_config >> "affection" >> "bleeding" >> "mode")],
            ["movementMultiplier", getNumber (_config >> "affection" >> "bleeding" >> "movementMultiplier")],
            ["random", createHashMapFromArray [
                ["minBloodLoss", getNumber (_config >> "affection" >> "bleeding" >> "random" >> "minBloodLoss")],
                ["medBloodLoss", getNumber (_config >> "affection" >> "bleeding" >> "random" >> "medBloodLoss")],
                ["maxBloodLoss", getNumber (_config >> "affection" >> "bleeding" >> "random" >> "maxBloodLoss")]
            ]],
            ["healthBased", createHashMapFromArray [
                ["multiplier", getNumber (_config >> "affection" >> "bleeding" >> "healthBased" >> "multiplier")]
            ]]
        ]],
        ["pain", createHashMapFromArray [
            ["enabled", getNumber (_config >> "affection" >> "pain" >> "enabled") > 0],
            ["basePain", getNumber (_config >> "affection" >> "pain" >> "basePain")],
            ["painPerSecond", getNumber (_config >> "affection" >> "pain" >> "painPerSecond")],
            ["movementMultiplier", getNumber (_config >> "affection" >> "pain" >> "movementMultiplier")]
        ]],
        ["respiratory", createHashMapFromArray [
            ["enabled", getNumber (_config >> "affection" >> "respiratory" >> "enabled") > 0],
            ["modifier", getNumber (_config >> "affection" >> "respiratory" >> "modifier")]
        ]],
        ["heartrate", createHashMapFromArray [
            ["enabled", getNumber (_config >> "affection" >> "heartrate" >> "enabled") > 0],
            ["modifier", getNumber (_config >> "affection" >> "heartrate" >> "modifier")]
        ]],
        ["consciousness", createHashMapFromArray [
            ["enabled", getNumber (_config >> "affection" >> "consciousness" >> "enabled") > 0],
            ["state", getNumber (_config >> "affection" >> "consciousness" >> "state")],
            ["chance", getNumber (_config >> "affection" >> "consciousness" >> "chance")],
            ["minTimeInSec", getNumber (_config >> "affection" >> "consciousness" >> "minTimeInSec")],
            ["midTimeInSec", getNumber (_config >> "affection" >> "consciousness" >> "midTimeInSec")],
            ["maxTimeInSec", getNumber (_config >> "affection" >> "consciousness" >> "maxTimeInSec")],
            ["timoutTimeInSec", getNumber (_config >> "affection" >> "consciousness" >> "timoutTimeInSec")],
            ["repeatable", getNumber (_config >> "affection" >> "consciousness" >> "repeatable") > 0]
        ]]
    ]],
    ["userInterface", createHashMapFromArray [
        ["groupAll", getNumber (_config >> "userInterface" >> "groupAll") > 0],
        ["detected", createHashMapFromArray [
            ["enabled", getNumber (_config >> "userInterface" >> "detected" >> "enabled") > 0],
            ["displayName", getText (_config >> "userInterface" >> "detected" >> "displayName")],
            ["description", getText (_config >> "userInterface" >> "detected" >> "description")],
            ["icon", getText (_config >> "userInterface" >> "detected" >> "icon")],
            ["color", getArray (_config >> "userInterface" >> "detected" >> "color")],
            ["textColor", getArray (_config >> "userInterface" >> "detected" >> "textColor")],
            ["showOnHUD", getNumber (_config >> "userInterface" >> "detected" >> "showOnHUD") > 0],
            ["visualEffects", getArray (_config >> "userInterface" >> "detected" >> "visualEffects")]
        ]],
        ["consciousUndetected", createHashMapFromArray [
            ["enabled", getNumber (_config >> "userInterface" >> "consciousUndetected" >> "enabled") > 0],
            ["displayName", getText (_config >> "userInterface" >> "consciousUndetected" >> "displayName")],
            ["description", getText (_config >> "userInterface" >> "consciousUndetected" >> "description")],
            ["icon", getText (_config >> "userInterface" >> "consciousUndetected" >> "icon")],
            ["color", getArray (_config >> "userInterface" >> "consciousUndetected" >> "color")],
            ["textColor", getArray (_config >> "userInterface" >> "consciousUndetected" >> "textColor")],
            ["showOnHUD", getNumber (_config >> "userInterface" >> "consciousUndetected" >> "showOnHUD") > 0],
            ["visualEffects", getArray (_config >> "userInterface" >> "consciousUndetected" >> "visualEffects")]
        ]],
        ["unconsciousUndetected", createHashMapFromArray [
            ["enabled", getNumber (_config >> "userInterface" >> "unconsciousUndetected" >> "enabled") > 0],
            ["displayName", getText (_config >> "userInterface" >> "unconsciousUndetected" >> "displayName")],
            ["description", getText (_config >> "userInterface" >> "unconsciousUndetected" >> "description")],
            ["icon", getText (_config >> "userInterface" >> "unconsciousUndetected" >> "icon")],
            ["color", getArray (_config >> "userInterface" >> "unconsciousUndetected" >> "color")],
            ["textColor", getArray (_config >> "userInterface" >> "unconsciousUndetected" >> "textColor")],
            ["showOnHUD", getNumber (_config >> "userInterface" >> "unconsciousUndetected" >> "showOnHUD") > 0],
            ["visualEffects", getArray (_config >> "userInterface" >> "unconsciousUndetected" >> "visualEffects")]
        ]]
    ]]
];

_hashMap

#include "\z\xms\scripting\footer.hpp"
     