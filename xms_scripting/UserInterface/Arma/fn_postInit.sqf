/*
 * Author:
 *      xms
 * 
 * Description:
 *      Initialized a players user interface for ExtensiveMedicalsystem
 * 
 * Arguments:
 *      -/-
 * 
 * Throws:
 *      - XMS_USERINTERFACE_ARMA_EXCEPTION_FAILED_TO_ADD_KEYDOWN_EVENT_HANDLER
 *        Failed to add keyDown event handler to MainDisplay (displayAddEventHandler returned -1).
 * 
 * Return:
 *      -/-
 */
#include "\z\extensivemedicalsystem\scripting\default.hpp"
#include "\z\extensivemedicalsystem\scripting\header.hpp"

#define MainDisplay findDisplay 46

if !hasInterface exitWith {};
if !canSuspend exitWith { _this spawn _fnc_scriptName; };

waitUntil {!isNull MainDisplay};

// Add keyDown event handler to MainDisplay
XMS_UserInterface_Arma_var_EventHandlerId_OnKeyDown = MainDisplay displayAddEventHandler ["keyDown", XMS_UserInterface_Arma_fnc_onKeyDown];
if (XMS_UserInterface_Arma_var_EventHandlerId_OnKeyDown == -1) exitWith {
    throw [
        XMS_USERINTERFACE_ARMA_EXCEPTION_FAILED_TO_ADD_KEYDOWN_EVENT_HANDLER,
        "Failed to add keyDown event handler to MainDisplay (displayAddEventHandler returned -1).",
        _this
    ];
};


#include "\z\extensivemedicalsystem\scripting\footer.hpp"
