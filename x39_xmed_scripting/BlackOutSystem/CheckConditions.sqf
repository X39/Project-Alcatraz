/*
 * Author:
 *      X39
 * 
 * Description:
 *      Checks if given unit has blocking BOS conditions
 * 
 * Arguments:
 *      <OBJECT>            Object to blackout
 * Return:
 *      <SCALAR> BlackOutState the unit currently is in, see ChangeState.sqf for the states.
 */
#define DISABLERETURN
#include "\x\x39\extensivemedicalsystem\scripting\defaultSQF.hpp"
#include "\x\x39\extensivemedicalsystem\scripting\header.hpp"
#include "\x\x39\extensivemedicalsystem\scripting\BlackOutSystem\infoArrayOffsets.hpp"

	params ["_unit"];
	private ["_state", "_tmpState"];
	_state = 0;
	{
		_tmpState = [_unit] call _x;
		if(_state < _tmpState) then
		{
			_state = _tmpState;
		};
	} count X39_XMed_var_BlackoutConditions;
	
#include "\x\x39\extensivemedicalsystem\scripting\footer.hpp"

_state