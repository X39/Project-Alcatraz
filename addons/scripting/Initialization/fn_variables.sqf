#include "\z\xms\scripting\default.hpp"
#include "\z\xms\scripting\header.hpp"
/*
 * Author:
 *      xms
 * 
 * Description:
 *      Initializes the variables with default values for Extensive Medical System.
 * 
 * Arguments:
 *      -/-
 * 
 * Throws:
 *      -/-
 * 
 * Return:
 *      Always 0
 */


// Internal
ASSIGN_IF_NIL(XMS_Unit_HitDetection_var_LastHitPartResult, false);
ASSIGN_IF_NIL(XMS_Unit_Variables_var_DelayedChanges, createHashMap);
ASSIGN_IF_NIL(XMS_Unit_Variables_var_Cache, createHashMap);
ASSIGN_IF_NIL(XMS_Unit_Wounding_var_Cache, createHashMap);
ASSIGN_IF_NIL(XMS_Unit_Drugs_var_Cache, createHashMap);

// Configurable
ASSIGN_IF_NIL(XMS_Unit_HitDetection_var_PenetrationDamageThreshold, 0.1);
ASSIGN_IF_NIL(XMS_Unit_HitDetection_var_DoublePenetrationSpeedThreshold, 200);


#include "\z\xms\scripting\footer.hpp"
