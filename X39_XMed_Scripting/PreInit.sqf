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

_tmp = [] call FNC(CT_MakeArray);
GVAR(Drug_Blackout) = _tmp select CT_OFF_DRUG select OFF_DRUG_BLACKOUT_CONDITION;
GVAR(UnitVariables) = _tmp select CT_OFF_UNITVARS;

//[<FUNCTIONNAME:STRING>, <TIMEOUT:SCALAR>]
GVAR(Ticks) = [];
GVAR(Ticks) pushBack [FNCS(MT_PublishUserVariables), 4];

#include "x\x39\ExtensiveMedicalsystem\scripting\footer.hpp"
