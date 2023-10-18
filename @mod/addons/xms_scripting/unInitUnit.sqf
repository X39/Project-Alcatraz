/*
 * Author:
 *      xms
 * 
 * Description:
 *      removes an initialized unit from ExtensiveMedicalsystem and kills all its corresponding
 *      background threads
 * 
 * Arguments:
 *      [
 *          <object>
 *      ]
 * 
 * Return:
 *      -/-
 */
#define DISABLERETURN
#include "\x\xms\extensivemedicalsystem\scripting\defaultSQF.hpp"
#include "\x\xms\extensivemedicalsystem\scripting\header.hpp"


params [
    ["_unit", objNull, [objNull]]
];

[_unit] call xms_XMed_fnc_BOS_WakeUnit;
(findDisplay 46) displayRemoveEventHandler["keyDown", _unit getVariable["xms_XMed_var_CB_46_OnKeyDown"]];


#include "\x\xms\extensivemedicalsystem\scripting\footer.hpp"
