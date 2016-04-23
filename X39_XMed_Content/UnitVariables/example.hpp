//class name will be appended to the variable prefix
class Example
{
    Description = "";           //What does this variable do
    Default = "0";              //Default Value, gets call compiled
    Local = false;              //Sets if this variable is broadcasted or not
    Transition = "";            //Code which handles the transition of this variable
    isLive = false;             //Sets if this variable is a "live" variable that gets propagated
                                //instant on change or if it should only change
                                //when the propagate tick runs over it (delayed change)
    class Events
    {
        init = "";              //Callen whenever the variable gets initialized on a new unit.
                                //Receives: [<VARNAME:STRING>, <UNIT:OBJECT>]
                                //Returns: -/-
        
        uninit = "";            //Callen whenever the variable has to be removed from a unit.
                                //Also gets callen AFTER the localityChange event
                                //Receives: [<VARNAME:STRING>, <UNIT:OBJECT>]
                                //Returns: -/-
        
        localityChange = "";    //Callen when the locality of this variable is about to change.
                                //It will be executed local to the unit it was first
                                //Receives: [<VARNAME:STRING>, <OLDUNIT:OBJECT>, <NEWUNIT:OBJECT>]
                                //Returns: Any arg that localityChanged should receive
                                
        localityChanged = "";   //Callen when the locality of this variable has changed.
                                //It will be executed local to the unit it is now settled
                                //Receives: [<VARNAME:STRING>, <OLDUNIT:OBJECT>, <NEWUNIT:OBJECT>, <CUSTOMARGS:ANY>]
                                //Returns: -/-
    };
};