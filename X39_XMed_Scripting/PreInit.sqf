/*
 * Author:
 *      X39
 * 
 * Description:
 *      PreInit file of this mod.
 *      Called BEFORE the objects are initialized.
 *      For further details, check:
 *      https://community.bistudio.com/wiki/Initialization_Order
 * 
 * Arguments:
 *      [
 *          <string>
 *      ]
 * 
 * Return:
 *      -/-
 */
#define DISABLERETURN
#include "x\x39\ExtensiveMedicalsystem\scripting\defaultSQF.hpp"
#include "x\x39\ExtensiveMedicalsystem\scripting\header.hpp"
#include "x\x39\ExtensiveMedicalsystem\scripting\ClassTransition\CTArrayOffsets.hpp"

private["_tmp"];

_tmp = [] call X39_XMed_fnc_CT_MakeArray;
X39_XMed_var_Drug_Blackout = _tmp select CT_OFF_DRUG select OFF_DRUG_BLACKOUT_CONDITION;
X39_XMed_var_UnitVariables = _tmp select CT_OFF_UNITVARS;

//[<FUNCTIONNAME:STRING>, <TIMEOUT:SCALAR>]
X39_XMed_var_Ticks = [];
X39_XMed_var_Ticks pushBack ["X39_XMed_fnc_MT_PublishUserVariables", 4];

#include "x\x39\ExtensiveMedicalsystem\scripting\footer.hpp"
