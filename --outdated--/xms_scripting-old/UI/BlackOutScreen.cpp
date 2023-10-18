#include "BlackOutScreen_IDs.hpp"
class XMS_BlackOutScreen
{
	idd = -1;
	onLoad = "_this call xms_XMed_fnc_BlackOutScreen_onLoad;";
	onUnload = "_this call xms_XMed_fnc_BlackOutScreen_onUnload;";
	class controls
	{
		class LowerBack: IGUIBack
		{
			colorBackground[] = {0, 0, 0, 1};
			x = "SafeZoneX + (225 / 1920) * SafeZoneW";
			y = "SafeZoneY + (1020 / 1080) * SafeZoneH";
			w = "(1475 / 1920) * SafeZoneW";
			h = "(60.0000000000001 / 1080) * SafeZoneH";
		};
		class UpperBack: IGUIBack
		{
			colorBackground[] = {0, 0, 0, 1};
			x = "SafeZoneX + (0 / 1920) * SafeZoneW";
			y = "SafeZoneY + (-1.00008890058234E-12 / 1080) * SafeZoneH";
			w = "(1925.00000000001 / 1920) * SafeZoneW";
			h = "(60.0000000000001 / 1080) * SafeZoneH";
		};
		class PulseBack: IGUIBack
		{
			idc = BlackOutScreen_IDC_PulseBack;
			colorBackground[] = {0, 0, 0, 1};
			x = "SafeZoneX + (0 / 1920) * SafeZoneW";
			y = "SafeZoneY + (60.0000000000001 / 1080) * SafeZoneH";
			w = "(1920 / 1920) * SafeZoneW";
			h = "(960 / 1080) * SafeZoneH";
		};
		class ImgBack: RscPicture
		{
			text = "x\xms\extensivemedicalsystem\scripting\res\BlackOutScreen_TransparencyCircle.paa";
			colorBackground[] = {0, 0, 0, 1};
			x = "SafeZoneX + (0 / 1920) * SafeZoneW";
			y = "SafeZoneY + (165 / 1080) * SafeZoneH";
			w = "(1920 / 1920) * SafeZoneW";
			h = "(855 / 1080) * SafeZoneH";
		};
		class RespawnButton: RscButton
		{
			colorBackground[] = {0, 0, 0, 1};
			text = "Respawn";
			idc = BlackOutScreen_IDC_RespawnButton;
			x = "SafeZoneX + (0 / 1920) * SafeZoneW";
			y = "SafeZoneY + (1020 / 1080) * SafeZoneH";
			w = "(225 / 1920) * SafeZoneW";
			h = "(60/ 1080) * SafeZoneH";
		};
		class AbortButton: RscButton
		{
			colorBackground[] = {0, 0, 0, 1};
			text = "Abort";
			idc = BlackOutScreen_IDC_AbortButton;
			x = "SafeZoneX + (1695 / 1920) * SafeZoneW";
			y = "SafeZoneY + (1020 / 1080) * SafeZoneH";
			w = "(225 / 1920) * SafeZoneW";
			h = "(60/ 1080) * SafeZoneH";
		};
		class BlackOutText: RscText
		{
			idc = BlackOutScreen_IDC_BlackOutText;
			x = "SafeZoneX + (0 / 1920) * SafeZoneW";
			y = "SafeZoneY + (0 / 1080) * SafeZoneH";
			w = "(165 / 1920) * SafeZoneW";
			h = "(60 / 1080) * SafeZoneH";
		};
	};
};
