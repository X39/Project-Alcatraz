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
#include "x\x39\ExtensiveMedicalsystem\scripting\defaultSQF.hpp"
#include "x\x39\ExtensiveMedicalsystem\scripting\header.hpp"
#include "x\x39\ExtensiveMedicalsystem\scripting\BlackOutSystem\infoArrayOffsets.hpp"

params ["_text"];

if (isNil {(uiNamespace getVariable ["XMS_BlackOutScreen"]) displayCtrl 1)}) then
{
	throw ;M
};

((uiNamespace getVariable ["XMS_BlackOutScreen"]) displayCtrl 1) ctrlSetText _text;

#include "x\x39\ExtensiveMedicalsystem\scripting\footer.hpp"