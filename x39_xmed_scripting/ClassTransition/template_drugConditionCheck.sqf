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
 *          <UNIT:OBJECT>
 *      ]
 * 
 * Return:
 *      -/-
 */
private "_fnc_scriptName";
_fnc_scriptName = "GenFunc_DrugConditionCheck_%1";

#include "\x\x39\extensivemedicalsystem\scripting\defaultSQF.hpp"
#include "\x\x39\extensivemedicalsystem\scripting\header.hpp"
#include "\x\x39\extensivemedicalsystem\scripting\ClassTransition\CTArrayOffsets.hpp"

params ["_unit"];
_currentValue = _unit getVariable "%2";
if (%3) then
{
    RETURN (%4);
}
else
{
    RETURN(0);
};

#include "\x\x39\extensivemedicalsystem\scripting\footer.hpp"
