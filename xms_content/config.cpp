#include "default.hpp"
class CfgPatches
{
	class xms_XMed_Content
	{
         units[] = {};
         weapons[] = {};
         requiredVersion = 1.64;
         requiredAddons[] = {};
         author = "xms";
         mail = "xms@xms.io";
		 url = "https://xms.io/projects/eXtensiveMedicalSystem";
	};
};
class ExtensiveMedicalsystem
{
    class Drugs
    {
        #include "Drugs\include.hpp"
    };
    class UnitVariables
    {
        #include "UnitVariables\include.hpp"
    };
};