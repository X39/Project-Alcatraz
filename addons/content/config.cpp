#include "default.hpp"
class CfgPatches
{
    class XMS_Content
    {
        name = "Extensive Medical System (Content)";
        units[] = {};
        weapons[] = {};
        requiredVersion = 2.14;
        requiredAddons[] = {};
        author = "X39";
        url = "https://github.com/X39/Project-Alcatraz";
    };
};
class CfgMods
{
    class XMS_Content
    {
        dir = "@xms";
        name = "Extensive Medical System (Content)";
        picture = "z\xms\resources\logo.paa";
        hidePicture = "true";
        hideName = "true";
        actionName = "Website";
        action = "https://github.com/X39/Project-Alcatraz/issues";
        description = "Issue Tracker: https://github.com/X39/Project-Alcatraz/issues";
    };
};
class ExtensiveMedicalsystem
{
    class Drugs
    {
        #include "Drugs\include.hpp"
    };
    class Simulation
    {
        #include "Simulation\include.hpp"
    };
    class UnitVariables
    {
        #include "UnitVariables\include.hpp"
    };
    class VisualEffects
    {
        #include "VisualEffects\include.hpp"
    };
    class Wounds
    {
        #include "Wounds\include.hpp"
    };
};