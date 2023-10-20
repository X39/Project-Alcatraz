class Base // Base class for simulation ticks
{
    scope = inherit;                        // 0 -> inherit only, 1 -> actual wound
    functionName = "";                      // Function to call
                                            // Function will be called with following arguments:
                                            // [
                                            //     <SCALAR: _deltaT>, // Simulation delta, relative to 1 second. Allows to scale values to per-second basis
                                            //     <OBJECT: _unit>    // Unit to apply simulation to
                                            // ]
    conditionFunction = "";                 // Condition to execute simulation tick. Will be called with following arguments:
                                            // [
                                            //     <OBJECT: _unit>    // Unit to apply simulation to
                                            // ]
                                            // Leave empty to execute simulation tick without any condition
    name = "";                              // Name of simulation tick (for debugging purposes)
    description = "";                       // Description of simulation tick (for debugging purposes)
    interval = 1;                           // Interval of simulation tick (in seconds). The simulation tick may be called more often, having _deltaT argument scaled accordingly
};