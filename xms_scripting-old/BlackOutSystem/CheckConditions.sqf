/*
 * Author:
 *      xms
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
#include "\x\xms\extensivemedicalsystem\scripting\defaultSQF.hpp"
#include "\x\xms\extensivemedicalsystem\scripting\header.hpp"
#include "\x\xms\extensivemedicalsystem\scripting\BlackOutSystem\infoArrayOffsets.hpp"

	params ["_unit"];
	private ["_state", "_tmpState"];
	_state = 0;
	{
		_tmpState = [_unit] call _x;
		if(_state < _tmpState) then
		{
			_state = _tmpState;
		};
	} count xms_XMed_var_BlackoutConditions;
	
#include "\x\xms\extensivemedicalsystem\scripting\footer.hpp"

_state