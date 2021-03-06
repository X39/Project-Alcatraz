/*
 * Author:
 *      xms
 * 
 * Description:
 *      removes the mod tick from this unit
 * 
 * Arguments:
 *      [<UNIT:OBJECT>]
 * 
 * Return:
 *      -/-
 */
#define DISABLERETURN
#include "\x\xms\extensivemedicalsystem\scripting\defaultSQF.hpp"
#include "\x\xms\extensivemedicalsystem\scripting\header.hpp"

params ["_unit"];
private ["_tickCount", "_index", "_tickTimeout", "_properties"];

_tickTimeout = _unit getVariable "xms_XMed_var_Tick_TimeoutCount";
if (_tickTimeout <= 0) then
{
    _tickCount = count xms_XMed_var_Ticks;
    if (-_tickCount <= _tickTimeout) then
    {
        _tickTimeout = diag_fps * 0.25 + -(_tickTimeout mod 1);
        _unit setVariable ["xms_XMed_var_Tick_TimeoutCount", _tickTimeout + 1];
    }
    else
    {
        _index = floor -_tickTimeout;
        _properties = _unit getVariable "xms_XMed_var_Tick_Properties";
        if (_properties select _index > 0) then
        {
            _properties set [_index, (_properties select _index) - 1];
        }
        else
        {
            //ToDo: Replace 1 with a compensation factor for FPS (to prevent FPS "hacking")
            [_unit, 1] call (missionNamespace getVariable (xms_XMed_var_Ticks select _index select 0));
            _properties set [_index, xms_XMed_var_Ticks select _index select 1];
        };
        _unit setVariable ["xms_XMed_var_Tick_Properties", _properties];
    };
};
_unit setVariable ["xms_XMed_var_Tick_TimeoutCount", _tickTimeout - 1];

#include "\x\xms\extensivemedicalsystem\scripting\footer.hpp"
