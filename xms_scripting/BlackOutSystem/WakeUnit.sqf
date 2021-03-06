/*
 * Author:
 *      xms
 * 
 * Description:
 *      wakes up unit (removes dialog if is player), enables various AI stuff on AI
 *		Helper function for BOS_ChangeState. Not intended to be callen manually.
 * 
 * Arguments:
 *      <OBJECT>            Object to wake up
 * Return:
 *      -/-
 */
#define VARIABLENAMESPACE uiNamespace
#define DISABLERETURN
#include "\x\xms\extensivemedicalsystem\scripting\defaultSQF.hpp"
#include "\x\xms\extensivemedicalsystem\scripting\header.hpp"

if(!isNil "XMS_BlackOutScreen_UI") then
{
    XMS_BlackOutScreen_UI closeDisplay XMS_BlackOutScreen_UI;
    terminate XMS_BlackOutScreen_LOOP;
};

#include "\x\xms\extensivemedicalsystem\scripting\footer.hpp"