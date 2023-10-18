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
#include "\z\extensivemedicalsystem\scripting\default.hpp"
#include "\z\extensivemedicalsystem\scripting\header.hpp"

#define ASSIGN_IF_NIL(var, val) if (isNil #var) then { var = val; };

// Internal
ASSIGN_IF_NIL(XMS_Unit_HitDetection_var_LastHitPartResult, false);

// Configurable
ASSIGN_IF_NIL(XMS_Unit_HitDetection_var_PenetrationDamageThreshold, 0.1);
ASSIGN_IF_NIL(XMS_Unit_HitDetection_var_DoublePenetrationSpeedThreshold, 200);


#include "\z\extensivemedicalsystem\scripting\footer.hpp"
