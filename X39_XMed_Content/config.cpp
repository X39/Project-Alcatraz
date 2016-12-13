#include "x\x39\ExtensiveMedicalsystem\content\default.hpp"
class CfgPatches
{
	class X39_XMed_Content
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
class ExtensiveMedicalsystem
{
    class Drugs
    {
        #include "x\x39\ExtensiveMedicalsystem\content\Drugs\include.hpp"
    };
    class UnitVariables
    {
        #include "x\x39\ExtensiveMedicalsystem\content\UnitVariables\include.hpp"
    };
};