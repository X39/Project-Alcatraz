/*
 * Author:
 *      X39
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
#include "x\x39\ExtensiveMedicalsystem\scripting\defaultSQF.hpp"
#include "x\x39\ExtensiveMedicalsystem\scripting\header.hpp"


params [
    ["_unit", objNull, [objNull]]
];

[_unit] call X39_XMed_fnc_BOS_WakeUnit;
(findDisplay 46) displayRemoveEventHandler["keyDown", _unit getVariable["X39_XMed_var_CB_46_OnKeyDown"]];


#include "x\x39\ExtensiveMedicalsystem\scripting\footer.hpp"
