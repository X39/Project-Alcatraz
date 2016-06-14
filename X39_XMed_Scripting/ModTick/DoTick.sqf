/*
 * Author:
 *      X39
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
#include "x\x39\ExtensiveMedicalsystem\scripting\defaultSQF.hpp"
#include "x\x39\ExtensiveMedicalsystem\scripting\header.hpp"

params ["_unit"];
private ["_tickCount", "_index", "_tickTimeout", "_properties"];

_tickTimeout = UVAR(_unit, Tick_TimeoutCount);
if (_tickTimeout <= 0) then
{
    _tickCount = count GVAR(Ticks);
    if (-_tickCount <= _tickTimeout) then
    {
        _tickTimeout = diag_fps * 0.25 + -(_tickTimeout mod 1);
        SETUVAR3(_unit, Tick_TimeoutCount, _tickTimeout + 1);
    }
    else
    {
        _index = floor -_tickTimeout;
        _properties = UVAR(_unit, Tick_Properties);
        if (_properties select _index > 0) then
        {
            _properties set [_index, (_properties select _index) - 1];
        }
        else
        {
            //ToDo: Replace 1 with a compensation factor for FPS (to prevent FPS "hacking")
            [_unit, 1] call (missionNamespace getVariable (GVAR(Ticks) select _index select 0));
            _properties set [_index, GVAR(Ticks) select _index select 1];
        };
        SETUVAR3(_unit, Tick_Properties, _properties);
    };
};
SETUVAR3(_unit, Tick_TimeoutCount, _tickTimeout - 1);

#include "x\x39\ExtensiveMedicalsystem\scripting\footer.hpp"
