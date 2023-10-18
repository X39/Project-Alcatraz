/*
 * Author:
 *      xms
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
#include "\x\xms\extensivemedicalsystem\scripting\defaultSQF.hpp"
#include "\x\xms\extensivemedicalsystem\scripting\header.hpp"
#include "\x\xms\extensivemedicalsystem\scripting\ClassTransition\CTArrayOffsets.hpp"

private["_tmp"];

_tmp = [] call xms_XMed_fnc_CT_MakeArray;
xms_XMed_var_Drug               = _tmp select CT_OFF_DRUG;
xms_XMed_var_UnitVariables      = _tmp select CT_OFF_UNITVARS;

xms_XMed_var_BlackoutConditions = [];
{
    xms_XMed_var_BlackoutConditions pushBack (_x select OFF_DRUG_BLACKOUT_CONDITION);
} count xms_XMed_var_Drug;

//[<FUNCTIONNAME:STRING>, <TIMEOUT:SCALAR>]
xms_XMed_var_Ticks = [];
xms_XMed_var_Ticks pushBack ["xms_XMed_fnc_MT_PublishUserVariables", 4];
xms_XMed_var_Ticks pushBack ["xms_XMed_fnc_MT_UpdateDrugs", 4];

#include "\x\xms\extensivemedicalsystem\scripting\footer.hpp"
