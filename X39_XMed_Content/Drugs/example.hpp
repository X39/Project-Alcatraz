class Base
{
    Displayname = "";       //Displayed name of given drug
    TransitionPerTick = 0;  //Transition happening per calculation tick
    MaxValue = -1;          //Sets max value "the body of a patient can consume" (max value in system reachable) [-1 -> no limit]

    BloodThikness = 1;      //Sets how much this drug will affect the hemostasis [0 -> never happens, 1 -> no effect, 2 -> happens twice as fast]
    Pain = 1;               //Sets how this drug changes the patiens pain [0 -> no pain, 1 -> no effect, 2 -> happens twice as fast]
    Vision = 1;             //Sets how much this drug will affect the vision [0 -> confused vision (waves, partial black), 1 -> no effect, 2 -> "focused" vision (radial blur)]
    Coloring = 1;           //Sets how much this drug will affect the coloring of players vision [0 -> grey, 1 -> no effect, 2 -> "strong" colors]


    class Affects
    {
        class Base
        {
            Name = "";  //Name of external class
            Value = ""; //Calculation to use (%1 will contain ThisDrug current, %2 will contain AffectedDrug current)
            CalculationType = "+"; //type of "addition" to the current value, eg. _cur = _cur + <Value>
        };
    };
    class BlackOut
    {
        class Base
        {
            Stage = 0;              //BlackOut Stage to fall into
            Condition = "false";    //Condition on which you will fall into set stage, %1 contains current unit, %2 contains current drug value, %3 contains max drug value
        };
    };
    class Items
    {
        class Base
        {
            DisplayName = "";   //Display name of this item internally
            Image = "";         //Display image
            Classname = "";     //Item classname to consume
            Value = "";         //Value to change
        };
    };
};