#include "\z\xms\scripting\default.hpp"
#include "\z\xms\scripting\header.hpp"
/*
 * Author:
 *      xms
 * 
 * Description:
 *      Simulates the unit's blood loss over time.
 * 
 * Arguments:
 *      [
 *          <OBJECT>, // _unit - The unit to simulate blood loss for.
 *          <NUMBER>  // _deltaT - Time relative to second for the simulation to stay in sync with the game.
 *      ]
 * 
 * Throws:
 *      -/-
 * 
 * Return:
 *      -/-
 */



params [
    ["_unit", objNull, [objNull]],
    ["_deltaT", 0, [0]]
];

#include "\z\xms\scripting\footer.hpp"
