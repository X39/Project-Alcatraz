class Base                                  // Base class to inherit from
{
    scope = inherit;                        // 0 -> inherit only, 1 -> actual drug
    Displayname = "";                       // Displayed name of given drug
    MaxValue = -1;                          // Sets max value "the body of a patient can consume" (max value in system reachable) [-1 -> no limit]
    MaxConcentration = 1;                   // Sets max concentration considered "safe" for the body to consume. This is used to calculate the overdose effect.
    MinBreakdownValuePerSecond = 0;         // Sets the minimum value that will be removed from the body per second.              [0 -> never remove, 1 -> remove 1 per second, etc.]
    MidBreakdownValuePerSecond = 0;         // Sets the mid value that will be removed from the body per second.                  [0 -> no mid, 1 -> remove 1 per second, etc.]
    MaxBreakdownValuePerSecond = 0;         // Sets the maximum value that will be removed from the body per second.              [0 -> no maximum, 1 -> remove 1 per second, etc.]
    MinConsumptionValuePerSecond = 0;       // Sets the minimum value that will be added to the body per second.                  [0 -> no minimum, 1 -> add 1 per second, etc.]
    MidConsumptionValuePerSecond = 0;       // Sets the mid value that will be added to the body per second.                      [0 -> no mid, 1 -> add 1 per second, etc.]
    MaxConsumptionValuePerSecond = 0;       // Sets the maximum value that will be added to the body per second.                  [0 -> no maximum, 1 -> add 1 per second, etc.]

    VisualEffects[] = {};                   // Visual effects to apply to the patient when this drug is consumed.
                                            // Strength of the effect is based on the concentration of the drug in the body.

    class DrugInteraction
    {
        class Affects                       // How this drug interacts with other drugs
        {
            class Base                      // Base class to inherit from
            {
                name = "";                  // Classname of the drug to affect
                calculation = "";           // The calculation to use to affect the drug. Has _selfValue and _affectedValue variables available. Must return a number.
            };
        };
        
        class AffectedBy                    // Same as Affects, but in reverse (Note that variables stay the same, perspective wise so _selfValue contains THIS drugs value)
        {
            class Base                      // Base class to inherit from
            {
                name = "";                  // Classname of the drug to affect
                calculation = "";           // The calculation to use to affect the drug. Has _selfValue and _affectedValue variables available. Must return a number.
            };
        };
    };
    // ToDo: Find a way to make this work with ticks
    class Affection                         // Allows to configure how this drug affects the body.
    {                                       // Note that all effects are always depending on the concentration, present in the body.
        class Heartrate                     // Configuration for heartrate.
        {
            enabled = false;                // Whether or not this drug can affect the heartrate.
            modifier = 1;                   // How much this drug affects the heartrate. [0 -> no heartRate, 1 -> normal heartrate, 2 -> double heartrate, etc.]
        };
    };
    
    class Items                             // The items which can be used to consume this drug. Multiple items can be used to consume the same drug, allowing for different sizes of doses.
    {
        class Base                          // Base class to inherit from
        {
            displayName = "";               // Display name of this item in the UI
            image = "";                     // Display image of this item in the UI
            classname = "";                 // Item classname to consume
            value = 0;                      // The value to apply to the body when consumed. This must always be a number.
        };
    };
};