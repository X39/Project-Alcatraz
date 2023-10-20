class CfgPatches
{
    class XMS_Main
    {
        name = "Extensive Medical System";
        units[] = {};
        weapons[] = {};
        requiredVersion = 2.14;
        requiredAddons[] = {"XMS_Resources", "XMS_Content"};
        author = "X39";
        url = "https://github.com/X39/Project-Alcatraz";
    };
};
class CfgMods
{
    class XMS_Main
    {
        dir = "@xms";
        name = "Extensive Medical System";
        picture = "z\xms\resources\logo_64px.paa";
        hidePicture = "true";
        hideName = "true";
        actionName = "Website";
        action = "https://github.com/X39/Project-Alcatraz/issues";
        description = "Issue Tracker: https://github.com/X39/Project-Alcatraz/issues";
    };
};
class CfgFunctions
{
    #include "Initialization\functions.hpp"
    #include "Tick\functions.hpp"
    #include "Unit\functions.hpp"
    #include "UserInterface\functions.hpp"
    #include "Util\functions.hpp"
};