#include "x\x39\ExtensiveMedicalsystem\scripting\default.hpp"
class CfgPatches
{
	class X39_XMed_Scripting
	{
         units[] = {};
         weapons[] = {};
         requiredVersion = 1.64;
         requiredAddons[] = {};
         author = "X39";
         mail = "x39@x39.io";
		 url = "https://x39.io/projects/eXtensiveMedicalSystem";
	};
};
class CfgFunctions
{
    class X39_XMed
    {
        #include "functions.cpp"
    }
};
class CfgVehicles
{
    class Man;
    class CAManBase: Man
    {
        class HitPoints
        {
            class LeftArm
            {
                armor = 1;
                material = -1;
                name = "hand_l";
                passThrough = 1;
                radius = 0.08;
                explosionShielding = 1;
                visual = "injury_hands";
                minimalHit = 0.01;
            };
            class RightArm: LeftArm
            {
                name = "hand_r";
            };
            class LeftLeg : LeftArm
            {
                name = "leg_l";
                radius = 0.1;
                visual = "injury_legs";
            };
            class RightLeg: LeftLeg
            {
                name = "leg_r";
            };
        };
    };
};