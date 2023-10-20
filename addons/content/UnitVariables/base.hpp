//class name will be appended to the variable prefix
class Base
{
    description = "";           // What does this variable do (used for debuging).
    default = "0";              // Default Value, gets call compiled
    synchronization = 0;        // Sets how fast this variable should be synchronized, where -1 is never (local)
                                // and 0 is on change (live) and any value above is the time in seconds for debouncing.
    class Events                // Function names in missionNamespace are supposed to be placed in theese
    {
        init = "";              // Callen whenever the variable gets initialized on a new unit.
                                // Receives: [<VARIABLE:HASHMAP>, <UNIT:OBJECT>]
                                // Returns: -/-
        
        uninit = "";            // Callen whenever the variable has to be removed from a unit.
                                // Also gets callen AFTER the localityChange event
                                // Receives: [<VARIABLE:HASHMAP>, <UNIT:OBJECT>]
                                // Returns: -/-
        
        localityChange = "";    // Callen when the locality of this variable is about to change.
                                // It will be executed local to the unit it was first
                                // Receives: [<VARIABLE:HASHMAP>, <OLDUNIT:OBJECT>, <NEWUNIT:OBJECT>]
                                // Returns: Any arg that localityChanged should receive
        
        localityChanged = "";   // Callen when the locality of this variable has changed.
                                // It will be executed local to the unit it is now settled
                                // Receives: [<VARIABLE:HASHMAP>, <OLDUNIT:OBJECT>, <NEWUNIT:OBJECT>, <CUSTOMARGS:ANY>]
                                // Returns: -/-
        
        valueChange = "";       // Callen when the variable has changed.
                                // Receives: [<VARIABLE:HASHMAP>, <UNIT:OBJECT>, <OLDVALUE:ANY>, <NEWVALUE:ANY>]
                                // Returns: -/-
    };
};