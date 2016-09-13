/*
 * Author:
 *      X39
 * 
 * Description:
 *      blacks out unint (shows dialog if is player), disables various AI stuff on AI
 * 
 * Arguments:
 *      <OBJECT>            Object to blackout
 * Return:
 *      -/-
 */
#include "x\x39\ExtensiveMedicalsystem\scripting\defaultSQF.hpp"
#include "x\x39\ExtensiveMedicalsystem\scripting\header.hpp"
#include "x\x39\ExtensiveMedicalsystem\scripting\BlackOutSystem\infoArrayOffsets.hpp"

if (hasInterface) then
{
	private ["_dlgResult"];
	_dlgResult = createDialog "XMS_BlackOutScreen";
}
else
{
};

#include "x\x39\ExtensiveMedicalsystem\scripting\footer.hpp"