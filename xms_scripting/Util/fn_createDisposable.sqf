/*
 * Author:
 *      xms
 * 
 * Description:
 *      Creates a disposable that will automatically call the given code when it is no longer used.
 * 
 * Arguments:
 *      [
 *         <CODE>, // Code to execute when the disposable is no longer used.
 *         <ANY>   // Data to pass to the disposable action in _this.
 *      ]
 * 
 * Throws:
 *      -/-
 * 
 * Return:
 *      <HashMapObject> // The disposable.
 */
#include "\z\extensivemedicalsystem\scripting\default.hpp"
#include "\z\extensivemedicalsystem\scripting\header.hpp"

params [
    ["_code", {}, [{}]],
    ["_data", {}, [{}]]
];

private _disposable = createHashMapObject [
    [
        ["#delete", { (_self get "data") call (_self get "code") }],
        ["#flags", ["noCopy", "sealed", "unscheduled"]],
        ["#str", {"Disposable"}]
        ["data", _data],
        ["code", _code]
    ]
];
_disposable

#include "\z\extensivemedicalsystem\scripting\footer.hpp"