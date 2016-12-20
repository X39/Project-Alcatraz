/*
 * Author:
 *      X39
 * 
 * Description:
 *      Updates stuff on the body
 * 
 * Arguments:
 *      [<UNIT:OBJECT>, <FPSCOMPENSATION:SCALAR>]
 * 
 * Return:
 *      -/-
 */
#define DISABLERETURN
#include "\x\x39\extensivemedicalsystem\scripting\defaultSQF.hpp"
#include "\x\x39\extensivemedicalsystem\scripting\header.hpp"

#include "\x\x39\extensivemedicalsystem\scripting\Body\ArrayIndexies.hpp"

params ["_unit", "_compensation"];
private ["_bleedingHits", "_tmp" ,"_x", "_bloodValue"];



//Process bleeding hits
_bleedingHits = _unit getVariable [BODY_VAR_BLEEDINGHITS, []];
for "_i" from 0 to ((count _bleedingHits) - 1) do
{
    _x = _bleedingHits select _i;
    if (_x select BODY_OFF_BLEEDINGHITS_SIZE < BODY_BLEEDINGHITS_AUTO_HEAL_MAX_SIZE) then
    {
        _tmp = _x select BODY_OFF_BLEEDINGHITS_HEAL_STATE;
        _tmp = _tmp - (_compensation * BODY_BLEEDINGHITS_HEAL_PER_TICK);
         _x set [BODY_OFF_BLEEDINGHITS_HEAL_STATE, _tmp];
    };

    if ((_x select BODY_OFF_BLEEDINGHITS_HEAL_STATE) <= 0) then
    {
        _bleedingHits deleteAt _i;
        _i = _i - 1;
    };
};
_unit setVariable [BODY_VAR_BLEEDINGHITS, _bleedingHits];

#include "\x\x39\extensivemedicalsystem\scripting\footer.hpp"