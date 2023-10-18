/*
 * Author:
 *      xms
 * 
 * Description:
 *      Applies a single wound to a unit.
 * 
 * Arguments:
 *      [
 *          <STRING>,  // Section of the wound to apply
 *          <HASHMAP>, // Wound to apply as created by XMS_Unit_Wounding_fnc_CreateWound
 *      ]
 * 
 * Throws:
 *      -/-
 * 
 * Return:
 *      -/-
 */
#include "\z\xms\scripting\default.hpp"
#include "\z\xms\scripting\header.hpp"

params [
    ["_section", "", [""]],
    ["_wound", nil, [createHashMap]]
];

if (_section == "") exitWith {
    throw [
        XMS_UNIT_WOUNDING_EXCEPTION_SECTION_ARGUMENT_ERROR,
        "The '_section' argument is empty.",
        _this
    ];
};

if (isNil "_wound") exitWith {
    throw [
        XMS_UNIT_WOUNDING_EXCEPTION_WOUND_ARGUMENT_ERROR,
        "The '_wound' argument is nil or not a hashmap.",
        _this
    ];
};

/*
"head",
"rips",
"body",
"left-upper-arm",
"left-lower-arm",
"left-hand",
"right-upper-arm",
"right-lower-arm",
"right-hand",
"left-upper-leg",
"left-lower-leg",
"left-foot",
"right-upper-leg",
"right-lower-leg",
"right-foot",
*/

#include "\z\xms\scripting\footer.hpp"
