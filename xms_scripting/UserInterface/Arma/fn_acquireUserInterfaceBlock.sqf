/*
 * Author:
 *      xms
 * 
 * Description:
 *      Acquires a user interface block, preventing the user from interacting with the game.
 * 
 * Arguments:
 *      -/-
 * 
 * Throws:
 *      -/-
 * 
 * Return:
 *      [
 *          <HashMapObject> // Object to automatically release the block when it is no longer used.
 *      ]
 */
#include "\z\extensivemedicalsystem\scripting\default.hpp"
#include "\z\extensivemedicalsystem\scripting\header.hpp"

isNil {
    XMS_UserInterface_Arma_var_UiBlockCounter = XMS_UserInterface_Arma_var_UiBlockCounter + 1;
    false
};
private _disposeCode = { XMS_UserInterface_Arma_var_UiBlockCounter = XMS_UserInterface_Arma_var_UiBlockCounter - 1; };
private _disposable = [_disposeCode] call XMS_Util_fnc_CreateDisposable;
_disposable

#include "\z\extensivemedicalsystem\scripting\footer.hpp"
