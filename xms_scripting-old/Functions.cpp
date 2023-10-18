class Init
{
	class PreInit                   { file = "x\xms\extensivemedicalsystem\scripting\PreInit.sqf"; preInit = 1; };
	class PostInit                  { file = "x\xms\extensivemedicalsystem\scripting\PostInit.sqf"; postInit = 1; };
};
class Generic
{
	class initUnit                  { file = "x\xms\extensivemedicalsystem\scripting\initUnit.sqf"; };
	class unInitUnit                { file = "x\xms\extensivemedicalsystem\scripting\unInitUnit.sqf"; };
	class transferUnit              { file = "x\xms\extensivemedicalsystem\scripting\transferUnit.sqf"; };
};
class ModTick
{
	class MT_Init                   { file = "x\xms\extensivemedicalsystem\scripting\ModTick\Init.sqf"; };
	class MT_Uninit                 { file = "x\xms\extensivemedicalsystem\scripting\ModTick\Uninit.sqf"; };
	class MT_DoTick                 { file = "x\xms\extensivemedicalsystem\scripting\ModTick\DoTick.sqf"; };
    
	class MT_PublishUserVariables   { file = "x\xms\extensivemedicalsystem\scripting\ModTick\tick_PublishUserVariables.sqf"; };
	class MT_UpdateDrugs			{ file = "x\xms\extensivemedicalsystem\scripting\ModTick\tick_UpdateDrugs.sqf"; };
	class MT_Blackout				{ file = "x\xms\extensivemedicalsystem\scripting\ModTick\tick_Blackout.sqf"; };
};
class ClassTransition
{
	class CT_MakeArray              { file = "x\xms\extensivemedicalsystem\scripting\ClassTransition\MakeArray.sqf"; };
	class CT_ReadIntoArray          { file = "x\xms\extensivemedicalsystem\scripting\ClassTransition\ReadIntoArray.sqf"; };
	class CT_LinkDrugs              { file = "x\xms\extensivemedicalsystem\scripting\ClassTransition\LinkDrugs.sqf"; };
	class CT_CompileDrugs           { file = "x\xms\extensivemedicalsystem\scripting\ClassTransition\CompileDrugs.sqf"; };
	class CT_CompileUserVariables   { file = "x\xms\extensivemedicalsystem\scripting\ClassTransition\CompileUserVariables.sqf"; };
};
class BlackOutSystem
{
	class BOS_ChangeState           { file = "x\xms\extensivemedicalsystem\scripting\BlackOutSystem\ChangeState.sqf"; };
	class BOS_WakeUnit              { file = "x\xms\extensivemedicalsystem\scripting\BlackOutSystem\WakeUnit.sqf"; };
	class BOS_BlackOutUnit          { file = "x\xms\extensivemedicalsystem\scripting\BlackOutSystem\BlackOutUnit.sqf"; };
	class BOS_ChangeDisplayText     { file = "x\xms\extensivemedicalsystem\scripting\BlackOutSystem\ChangeDisplayText.sqf"; };
	class BOS_CheckConditions       { file = "x\xms\extensivemedicalsystem\scripting\BlackOutSystem\CheckConditions.sqf"; };
	class BOS_IsAwake		       	{ file = "x\xms\extensivemedicalsystem\scripting\BlackOutSystem\IsAwake.sqf"; };
};

class UI
{
	class BlackOutScreen_onLoad		{ file = "x\xms\extensivemedicalsystem\scripting\UI\BlackOutScreen_onLoad.sqf"; };
	class BlackOutScreen_onUnload	{ file = "x\xms\extensivemedicalsystem\scripting\UI\BlackOutScreen_onUnload.sqf"; };
};