//class name will be appended to the variable prefix
class Tick_Content
{
    Description = "Contains critical informations about where this tick is set inside";
    Default = "-1";
    Local = true;
    isLive = true;
    class Events
    {
        init = "xms_XMed_fnc_MT_Init";
        uninit = "xms_XMed_fnc_MT_Uninit";
    };
};