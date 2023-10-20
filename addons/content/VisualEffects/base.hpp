class Base                          // Base class for all visual effects
{
    scope = inherit;                // 0 -> inherit only, 1 -> actual effect
    Blackening = 1;                 // Sets how this wound affects the blackening           [0 -> darker, 1 -> no effect, 2 -> improve darkening]
    Whiteness = 1;                  // Sets how this wound affects the whiteness            [0 -> lighter, 1 -> no effect, 2 -> improve whiteness]
    Noise = 1;                      // Sets how this wound affects the noise                [0 -> less noise, 1 -> no effect, 2 -> more noise]
    Coloring = 1;                   // Sets how this wound affects the coloring vision      [0 -> grey, 1 -> no effect, 2 -> "stronger" colors]
    ChromaticAberration = 1;        // Sets how this wound affects the chromatic aberration [0 -> less, 1 -> no effect, 2 -> more]
};