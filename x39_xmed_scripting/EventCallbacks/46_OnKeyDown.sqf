/*
 * Author:
 *      X39
 * 
 * Description:
 *      Handles onKeyDown events of display 46
 * 
 * Arguments:
 *      <CONTROL>       the control that triggered this event 
 *      <SCALAR>        DIG-Code of the key pressed
 *      <BOOL>          Flag telling if shift is pressed
 *      <BOOL>          Flag telling if ctrl is pressed
 *      <BOOL>          Flag telling if alt is pressed
 * Return:
 *      <BOOL>          Flag determining if key got already handled by this or not.
 */
#include "\x\x39\extensivemedicalsystem\scripting\defaultSQF.hpp"
#include "\x\x39\extensivemedicalsystem\scripting\header.hpp"

params["_control", "_digcode", "_shiftFlag", "_ctrlFlag", "_altFlag"];

with uiNamespace do
{
    //Prevent ESC when black out screen is present
    if(!isNil "XMS_BlackOutScreen_UI" && {_digcode == 0}) then
    {
        RETURN(true);
    };
};

RETURN(false);

#include "\x\x39\extensivemedicalsystem\scripting\footer.hpp"