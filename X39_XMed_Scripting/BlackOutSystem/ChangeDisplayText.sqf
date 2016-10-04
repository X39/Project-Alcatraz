/*
 * Author:
 *      X39
 * 
 * Description:
 *      Changes displaytext of current player
 * 
 * Arguments:
 *      <STRING> New text to display
 * Return:
 *      -/-
 */
#define DISABLERETURN
#include "x\x39\ExtensiveMedicalsystem\scripting\defaultSQF.hpp"
#include "x\x39\ExtensiveMedicalsystem\scripting\header.hpp"

params ["_text"];

uiNamespace setVariable ["XMS_BlackOutScreen_displaytext", _text];

#include "x\x39\ExtensiveMedicalsystem\scripting\footer.hpp"