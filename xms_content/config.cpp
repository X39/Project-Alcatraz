#include "default.hpp"
class CfgPatches
{
	class xms_content
	{
         units[] = {};
         weapons[] = {};
         requiredVersion = 1.64;
         requiredAddons[] = {};
         author = "xms";
		 url = "https://xms.io/projects/eXtensiveMedicalSystem";
	};
};
class ExtensiveMedicalsystem
{
    class Drugs
    {
        #include "Drugs\base.hpp"
        #include "Drugs\include.hpp"
    };
    class UnitVariables
    {
        #include "UnitVariables\base.hpp"
        #include "UnitVariables\include.hpp"
    };
    class Wounds
    {
        #include "Wounds\base.hpp"
        #include "Wounds\bullethole.hpp"
    };
};