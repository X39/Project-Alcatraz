class XMS_BlackOutScreen
{
	idd = -1;
	onLoad = "_this call X39_XMed_fnc_BlackOutScreen_onLoad;";
	onUnload = "_this call X39_XMed_fnc_BlackOutScreen_onUnload;";
	class controls
	{
		class PulseBack: IGUIBack
		{
			colorBackground = {0, 0, 0, 1};
			x = "SafeZoneX + (0 / 1920) * SafeZoneW";
			y = "SafeZoneY + (0 / 1080) * SafeZoneH";
			w = "(1920 / 1920) * SafeZoneW";
			h = "(1020 / 1080) * SafeZoneH";
		};
		class ImgBack: RscPicture
		{
			text = "x\x39\ExtensiveMedicalsystem\scripting\res\BlackOutScreen_TransparencyCircle.paa"
			colorBackground = {0, 0, 0, 1};
			x = "SafeZoneX + (0 / 1920) * SafeZoneW";
			y = "SafeZoneY + (0 / 1080) * SafeZoneH";
			w = "(1920 / 1920) * SafeZoneW";
			h = "(1020 / 1080) * SafeZoneH";
		};
		class LowerBack: IGUIBack
		{
			colorBackground = {0, 0, 0, 1};
			x = "SafeZoneX + (225 / 1920) * SafeZoneW";
			y = "SafeZoneY + (1020 / 1080) * SafeZoneH";
			w = "(1695 / 1920) * SafeZoneW";
			h = "(60 / 1080) * SafeZoneH";
		};
		class RespawnButton: RscButton
		{
			colorBackground = {0, 0, 0, 1};
			text = "Respawn";
			idc = 2;
			x = "SafeZoneX + (0 / 1920) * SafeZoneW";
			y = "SafeZoneY + (1020 / 1080) * SafeZoneH";
			w = "(225 / 1920) * SafeZoneW";
			h = "(60/ 1080) * SafeZoneH";
		};
		class BlackOutText: RscText
		{
			idc = 1;
			x = "SafeZoneX + (0 / 1920) * SafeZoneW";
			y = "SafeZoneY + (0 / 1080) * SafeZoneH";
			w = "(165 / 1920) * SafeZoneW";
			h = "(60 / 1080) * SafeZoneH";
		};
	};
};
