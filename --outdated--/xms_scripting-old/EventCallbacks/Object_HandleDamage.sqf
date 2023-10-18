/*
 *
 *
 */

#define DISABLERETURN
#include "\x\xms\extensivemedicalsystem\scripting\defaultSQF.hpp"
#include "\x\xms\extensivemedicalsystem\scripting\header.hpp"

params ["_unit", "_selectionName", "_damage", "_source", "_projectile", "_hitPartIndex", "_instigator"];
private ["_projectileConfig", "_projectileCaliber"];

_projectileConfig = configFile >> "CfgAmmo" >> _projectile;
_projectileCaliber = getNumber (_projectileConfig >> "caliber");

//Magic number 0.9999999 is the last dmg that wont kill the player
([_damage, 0.9999999] select (_damage > 1))

#include "\x\xms\extensivemedicalsystem\scripting\footer.hpp"