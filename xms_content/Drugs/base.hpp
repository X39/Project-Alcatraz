class Base                         // Base class to inherit from
{
    Displayname = "";              // Displayed name of given drug
    ApplyCoefPerSecond = 0;        // The coeficient of how fast this drug will be applied to the body                   [0 -> never happens, 1 -> instant]
    MaxValue = -1;                 // Sets max value "the body of a patient can consume" (max value in system reachable) [-1 -> no limit]

    BloodThikness = 1;             // Sets how much this drug will affect the hemostasis  [0 -> reduced blood thickness, 1 -> no effect, 2 -> increased blood thickness]
    Pain = 1;                      // Sets how this drug changes the patiens pain         [0 -> reduced pain, 1 -> no effect, 2 -> increased pain]

    class VisualEffects            // Sets how this drug affects the patients vision
    {
        Blackening = 1;            // Sets how this drug affects the blackening           [0 -> darker, 1 -> no effect, 2 -> improve darkening]
        Whiteness = 1;             // Sets how this drug affects the whiteness            [0 -> lighter, 1 -> no effect, 2 -> improve whiteness]
        Noise = 1;                 // Sets how this drug affects the noise                [0 -> less noise, 1 -> no effect, 2 -> more noise]
        Coloring = 1;              // Sets how this drug affects the coloring vision      [0 -> grey, 1 -> no effect, 2 -> "stronger" colors]
        ChromaticAberration = 1;   // Sets how this drug affects the chromatic aberration [0 -> less, 1 -> no effect, 2 -> more]
    };

    class Affects                  // How this drug interacts with other drugs
    {
        class Base                 // Base class to inherit from
        {
            Name = "";             // Classname of the drug to affect
            Calculation = "";      // The calculation to use to affect the drug. Has _selfValue and _affectedValue variables available. Must return a number.
        };
    };
    
    class AffectedBy               // Same as Affects, but in reverse (Note that variables stay the same, perspective wise so _selfValue contains THIS drugs value)
    {
        class Base                 // Base class to inherit from
        {
            Name = "";             // Classname of the drug to affect
            Calculation = "";      // The calculation to use to affect the drug. Has _selfValue and _affectedValue variables available. Must return a number.
        };
    };
    
    class BlackOut                 // Allows to set how, if and when this drug will cause a blackout
    {
        class Base                 // Base class to inherit from
        {
            Stage = 0;             // BlackOut Stage to fall into, allowed: 0, 2, 3. Note that 0 is the "no blackout" stage, effectively forcing the unit to wake up under any condition.
            Condition = "false";   // Condition on which you will fall into set stage, %1 contains current unit, %2 contains current drug value, %3 contains max drug value
        };
    };
    
    class Items                    // The items which can be used to consume this drug. Multiple items can be used to consume the same drug, allowing for different sizes of doses.
    {
        class Base                 // Base class to inherit from
        {
            DisplayName = "";      // Display name of this item in the UI
            Image = "";            // Display image of this item in the UI
            Classname = "";        // Item classname to consume
            Value = 0;            // The value to apply to the body when consumed. This must always be a number.
        };
    };
};