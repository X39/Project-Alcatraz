/*
 * Author:
 *      xms
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
#include "\x\xms\extensivemedicalsystem\scripting\defaultSQF.hpp"
#include "\x\xms\extensivemedicalsystem\scripting\header.hpp"

params ["_text"];

uiNamespace setVariable ["XMS_BlackOutScreen_displaytext", _text];

#include "\x\xms\extensivemedicalsystem\scripting\footer.hpp"