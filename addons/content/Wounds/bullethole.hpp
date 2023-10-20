class BulletHole : Base // Test wound
{
    scope = public;
    minHealth = 40;                          // The minimum initial health of the wound. A minimum of 0 means that the wound has a chance of instantly healing itself.
    medHealth = 50;                          // The medium initial health of the wound. Must be higher or equal to minHealth.
    maxHealth = 60;                          // The maximum initial health of the wound. Must be higher or equal to medHealth.
    class Infliction : Infliction
    {
        class HitDetection : HitDetection
        {
            enabled = true;
        };
    };

    class Healing : Healing                 // Allows to configure self healing (no treatment) of wounds.
    {
        class HealthPoints : HealthPoints   // Automatically heals the wound over time.
        {
            enabled = true;                 // Whether or not this wound can heal itself from this healing source.
            minHealPerSecond = 1;           // How many health points to heal per second. If the value is negative, there is a chance of the wound getting worse instead.
            medHealPerSecond = 2;           // How many health points to heal per second. Must be positive if minHealPerSecond is positive.
            maxHealPerSecond = 3;           // How many health points to heal per second. Must be positive if medHealPerSecond is positive.
            chance = 1;                     // Chance of this source healing the wound. [0 -> never heal the wound, 1 -> always heal the wound]
        };
    };
    
    class Affection : Affection             // Allows to configure how this wound affects the body.
    {
        
        class Bleeding : Bleeding           // Configuration for bleeding.
        {
            enabled = true;                 // Whether or not this wound can cause bleeding.
            chance = 1;                     // Chance of bleeding occuring. [0 -> never inflict bleeding, 1 -> always inflict bleeding]
            useBloodPressure = true ;       // Whether or not to take the blood pressure into account when calculating the blood loss.
                                            // If false, the values of the chosen mode will be used.
                                            // If true, the values of the chosen mode will be multiplied by the blood pressure.
                                            // This allows for a more realistic blood loss calculation, making a high blood pressure lead to more blood loss and vice versa.
            mode = "Random";                // Mode of bleeding. Must be one of the following: ["Random", "HealthBased"]
            class Random : Random           // Mode Random configuration. Will remove a random amount of blood per second.
            {
                minBloodLoss = 10;          // Minimum blood loss per second in milli liters. [0 -> no minimum blood loss]
                medBloodLoss = 30;          // Medium blood loss per second in milli liters. Must be higher or equal to minBloodLoss.
                maxBloodLoss = 100;         // Maximum blood loss per second in milli liters. Must be higher or equal to medBloodLoss.
            };
        };

        class Pain : Pain                   // Configuration for pain.
        {
            enabled = false;                // Whether or not this wound can cause pain.
            basePain = 100;                 // Base pain that is inflicted by this wound. This is affected by the movementMultiplier.
            painPerSecond = 0;              // Additional pain inflicted per second. This is affected by the movementMultiplier.
            movementMultiplier = 1;         // Pain multiplier for movement speed. [0 -> no pain inflicted, 1 -> normal pain inflicted, 2 -> double pain inflicted, etc.]
        };
        
    };
};