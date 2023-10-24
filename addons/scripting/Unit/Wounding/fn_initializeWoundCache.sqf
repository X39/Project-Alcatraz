#include "\z\xms\scripting\default.hpp"
#include "\z\xms\scripting\header.hpp"
/*
 * Author:
 *      xms
 * 
 * Description:
 *      Initializes the woundings defined in the config files of the mission and the mod
 *      and caches them in the variable cache.
 * 
 * Arguments:
 *      -/-
 * 
 * Throws:
 *      -/-
 * 
 * Return:
 *      -/-
 */

ASSIGN_IF_NIL(XMS_Unit_Wounding_var_Cache, createHashMap);
private _initializeVariable = {
    #pragma sls declare _x CONFIG
    private _variable = _x call XMS_Unit_Wounding_fnc_CreateWound;
    XMS_Unit_Wounding_var_Cache set [configName _x, _variable];
};

_initializeVariable forEach ("getNumber (_x >> 'scope') > 0" configClasses (configFile >> "ExtensiveMedicalSystem" >> "Wounding"));
_initializeVariable forEach ("getNumber (_x >> 'scope') > 0" configClasses (missionConfigFile >> "ExtensiveMedicalSystem" >> "Wounding"));

#include "\z\xms\scripting\footer.hpp"
 