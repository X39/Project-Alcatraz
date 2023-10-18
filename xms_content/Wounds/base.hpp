class Base                                  // Base class for all wounds
{
    scope = inherit;                        // 0 -> inherit only, 1 -> actual wound
    maximum = 0;                            // The maximum amount of this wound that can be applied to a unit. [0 -> no limit]
    baseChance = 1;                         // Base chance of this wound being applied. [0 -> never applied, 1 -> always applied]
    alwaysDetected = false;                 // Whether or not this wound is always detected without a treatment applied.
    detectionRequiredForTreatment = false;  // Whether or not this wound requires detection before it can be treated.

    class Infliction                        // Configuration for how this wound can be inflicted
    {
        class HitDetection                  // Configuration for the hit-detection infliction source
        {
            enabled = false;                // Whether or not this source is enabled.
            sections[] = {};                // The sections to apply the wound from. If empty, the wound can be applied to any section.
            hitTypes[] = {};                // The hit types to apply the wound from. If empty, the wound can be applied to any hit type.
            chance = 1;                     // Chance of this source inflicting the wound. [0 -> never inflict the wound, 1 -> always inflict the wound]
            requirePenetration = 0;         // Whether or not the hit must penetrate the armor to inflict the wound. [0 -> no penetration required, 1 -> penetration required, 2 -> penetration and exit required]
            damageThreshold = 0;            // Minimum damage required to inflict the wound. [0 -> no minimum damage required]
            radiusThreshold = 0;            // Minimum radius required to inflict the wound. [0 -> no minimum radius required]
            velocityThreshold = 0;          // Minimum velocity required to inflict the wound. [0 -> no minimum velocity required]
        };

        class Heartrate                    // Configuration for the heartrate infliction source
        {
            enabled = false;                // Whether or not this source is enabled.
            min = 0;                        // Minimum heartrate to inflict the wound from. [0 -> no heartrate, 1 -> normal heartrate, 2 -> high heartrate]
            max = 0;                        // Maximum heartrate to inflict the wound from. [0 -> no heartrate, 1 -> normal heartrate, 2 -> high heartrate]
            chance = 1;                     // Chance of this source inflicting the wound. [0 -> never inflict the wound, 1 -> always inflict the wound]
        };

        class BloodPressure                // Configuration for the blood pressure infliction source
        {
            enabled = false;                // Whether or not this source is enabled.
            min = 0;                        // Minimum blood pressure to inflict the wound from. [0 -> no blood pressure, 1 -> normal blood pressure, 2 -> high blood pressure]
            max = 0;                        // Maximum blood pressure to inflict the wound from. [0 -> no blood pressure, 1 -> normal blood pressure, 2 -> high blood pressure]
            chance = 1;                     // Chance of this source inflicting the wound. [0 -> never inflict the wound, 1 -> always inflict the wound]
        };

        class BloodVolume                  // Configuration for the blood volume infliction source
        {
            enabled = false;                // Whether or not this source is enabled.
            min = 0;                        // Minimum blood volume to inflict the wound from. [0 -> no blood, 1 -> full blood]
            max = 0;                        // Maximum blood volume to inflict the wound from. [0 -> no blood, 1 -> full blood]
            chance = 1;                     // Chance of this source inflicting the wound. [0 -> never inflict the wound, 1 -> always inflict the wound]
        };

        class BloodThikness                // Configuration for the blood thikness infliction source
        {
            enabled = false;                // Whether or not this source is enabled.
            min = 0;                        // Minimum blood thikness to inflict the wound from. [0 -> like water, 1 -> normal blood thikness, 2 -> like honey]
            max = 0;                        // Maximum blood thikness to inflict the wound from. [0 -> like water, 1 -> normal blood thikness, 2 -> like honey]
            chance = 1;                     // Chance of this source inflicting the wound. [0 -> never inflict the wound, 1 -> always inflict the wound]
        };

        class Pain                         // Configuration for the pain infliction source
        {
            enabled = false;                // Whether or not this source is enabled.
            min = 0;                        // Minimum pain to inflict the wound from.
            max = 0;                        // Maximum pain to inflict the wound from.
            chance = 1;                     // Chance of this source inflicting the wound. [0 -> never inflict the wound, 1 -> always inflict the wound]
        };

        class Respiratory                  // Configuration for the respiratory infliction source
        {
            enabled = false;                // Whether or not this source is enabled.
            min = 0;                        // Minimum respiratory to inflict the wound from. (Breaths per minute)
            max = 0;                        // Maximum respiratory to inflict the wound from. (Breaths per minute)
            chance = 1;                     // Chance of this source inflicting the wound. [0 -> never inflict the wound, 1 -> always inflict the wound]
        };

        class Oxygen                       // Configuration for the oxygen infliction source
        {
            enabled = false;                // Whether or not this source is enabled.
            min = 0;                        // Minimum oxygen to inflict the wound from. [0 -> no oxygen, 1 -> full oxygen]
            max = 0;                        // Maximum oxygen to inflict the wound from. [0 -> no oxygen, 1 -> full oxygen]
            chance = 1;                     // Chance of this source inflicting the wound. [0 -> never inflict the wound, 1 -> always inflict the wound]
        };
    };

    class UserInterface                     // Configuration for the user interface.
    {
        groupAll = false;                   // Whether or not to group all wounds of this type together in the UI.

        class Detected                      // How the wound is presented in the UI when detected.
        {
            enabled = false;                // Whether or not to display this wound in the UI when detected.
            displayName = "";               // Name of the wound to be displayed in the UI.
            description = "";               // Description of the wound to be displayed in the UI.
            icon = "";                      // Icon of the wound to be displayed in the UI.
            color[] = {1, 1, 1, 1};         // Color of the wound to be displayed in the UI.
            textColor[] = {1, 1, 1, 1};     // Text color of the wound to be displayed in the UI.
        };

        class ConsciousUndetected           // How the wound is presented in the UI when undetected and the unit is conscious.
        {
            enabled = false;                // Whether or not to display this wound in the UI when undetected.
            displayName = "";               // Name of the wound to be displayed in the UI.
            description = "";               // Description of the wound to be displayed in the UI.
            icon = "";                      // Icon of the wound to be displayed in the UI.
            color[] = {1, 1, 1, 1};         // Color of the wound to be displayed in the UI.
            textColor[] = {1, 1, 1, 1};     // Text color of the wound to be displayed in the UI.
        };

        class UnconsciousUndetected         // How the wound is presented in the UI when undetected and the unit is unconscious.
        {
            enabled = false;                // Whether or not to display this wound in the UI when undetected.
            displayName = "";               // Name of the wound to be displayed in the UI.
            description = "";               // Description of the wound to be displayed in the UI.
            icon = "";                      // Icon of the wound to be displayed in the UI.
            color[] = {1, 1, 1, 1};         // Color of the wound to be displayed in the UI.
            textColor[] = {1, 1, 1, 1};     // Text color of the wound to be displayed in the UI.
        };
    };

    class Bleeding                          // Configuration for bleeding.
    {
        enabled = false;                    // Whether or not this wound can cause bleeding.
        chance = 0;                         // Chance of bleeding occuring. [0 -> never inflict bleeding, 1 -> always inflict bleeding]
        woundHealth = 0;                    // Health of wound the wound.
        healingRatePerSecond = 0;           // How much health to remove from the wound per second. [0 -> wound will never heal, woundHealth -> wound will heal instantly after a second]
    };

    class Pain                              // Configuration for pain.
    {
        enabled = false;                    // Whether or not this wound can cause pain.
        basePain = 0;                       // Base pain that is inflicted by this wound. This is affected by the movementMultiplier.
        painPerSecond = 0;                  // Additional pain inflicted per second. This is affected by the movementMultiplier.
        movementMultiplier = 1;             // Pain multiplier for movement speed. [0 -> no pain inflicted, 1 -> normal pain inflicted, 2 -> double pain inflicted, etc.]
    };
    
    class Respiratory                       // Configuration for respiratory.
    {
        enabled = false;                    // Whether or not this wound can affect the respiratory.
        modifier = 1;                       // How much this wound affects the breathing rate. [0 -> no breathing, 1 -> normal breathing rate, 2 -> double breathing rate, etc.]
    };

    class Heartrate                        // Configuration for heartrate.
    {
        enabled = false;                   // Whether or not this wound can affect the heartrate.
        modifier = 1;                      // How much this wound affects the heartrate. [0 -> no heartRate, 1 -> normal heartrate, 2 -> double heartrate, etc.]
    };

    class Consciousness                     // Configuration for consciousness.
    {
        enabled = false;                    // Whether or not this wound can affect the consciousness.
        state = 1;                          // The consciousness state to set the unit to. [0 -> conscious, 1 -> time based unconscious, 2 -> unconscious until treated]
        chance = 1;                         // Chance of this wound affecting the consciousness. [0 -> never affect the consciousness, 1 -> always affect the consciousness]
        minTimeInSec = 0;                   // If state = 2, minimum time in seconds the unit will be unconscious for. [0 -> no minimum time]
        midTimeInSec = 0;                   // If state = 2, mid time in seconds the unit will be unconscious for. [0 -> no mid time]
        maxTimeInSec = 0;                   // If state = 2, maximum time in seconds the unit will be unconscious for. [0 -> no maximum time]
        timoutTimeInSec = 0;                // If state = 2, time in seconds the unit will be consious for before the unconsciousness can be repeated. [0 -> no timeout]
        repeatable = false;                 // If state = 2, whether or not the unconsciousness can be repeated. The chance will be rolled again every tick.
    };
};