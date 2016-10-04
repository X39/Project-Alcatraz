class Init
{
	class PreInit                   { file = "x\x39\ExtensiveMedicalsystem\scripting\PreInit.sqf"; preInit = 1; };
	class PostInit                  { file = "x\x39\ExtensiveMedicalsystem\scripting\PostInit.sqf"; postInit = 1; };
};
class Generic
{
	class initUnit                  { file = "x\x39\ExtensiveMedicalsystem\scripting\initUnit.sqf"; };
	class unInitUnit                { file = "x\x39\ExtensiveMedicalsystem\scripting\unInitUnit.sqf"; };
	class transferUnit              { file = "x\x39\ExtensiveMedicalsystem\scripting\transferUnit.sqf"; };
};
class ModTick
{
	class MT_Init                   { file = "x\x39\ExtensiveMedicalsystem\scripting\ModTick\Init.sqf"; };
	class MT_Uninit                 { file = "x\x39\ExtensiveMedicalsystem\scripting\ModTick\Uninit.sqf"; };
	class MT_DoTick                 { file = "x\x39\ExtensiveMedicalsystem\scripting\ModTick\DoTick.sqf"; };
    
	class MT_PublishUserVariables   { file = "x\x39\ExtensiveMedicalsystem\scripting\ModTick\tick_PublishUserVariables.sqf"; };
};
class ClassTransition
{
	class CT_MakeArray              { file = "x\x39\ExtensiveMedicalsystem\scripting\ClassTransition\MakeArray.sqf"; };
	class CT_ReadIntoArray          { file = "x\x39\ExtensiveMedicalsystem\scripting\ClassTransition\ReadIntoArray.sqf"; };
	class CT_LinkDrugs              { file = "x\x39\ExtensiveMedicalsystem\scripting\ClassTransition\LinkDrugs.sqf"; };
	class CT_CompileDrugs           { file = "x\x39\ExtensiveMedicalsystem\scripting\ClassTransition\CompileDrugs.sqf"; };
	class CT_CompileUserVariables   { file = "x\x39\ExtensiveMedicalsystem\scripting\ClassTransition\CompileUserVariables.sqf"; };
};
class BlackOutSystem
{
	class BOS_ChangeState           { file = "x\x39\ExtensiveMedicalsystem\scripting\BlackOutSystem\ChangeState.sqf"; };
	class BOS_WakeUnit              { file = "x\x39\ExtensiveMedicalsystem\scripting\BlackOutSystem\WakeUnit.sqf"; };
	class BOS_BlackOutUnit          { file = "x\x39\ExtensiveMedicalsystem\scripting\BlackOutSystem\BlackOutUnit.sqf"; };
	class BOS_ChangeDisplayText     { file = "x\x39\ExtensiveMedicalsystem\scripting\BlackOutSystem\ChangeDisplayText.sqf"; };
	class BOS_CheckConditions       { file = "x\x39\ExtensiveMedicalsystem\scripting\BlackOutSystem\CheckConditions.sqf"; };
	class BOS_IsAwake		       	{ file = "x\x39\ExtensiveMedicalsystem\scripting\BlackOutSystem\IsAwake.sqf"; };
};

class UI
{
	class BlackOutScreen_onLoad		{ file = "x\x39\ExtensiveMedicalsystem\scripting\UI\BlackOutScreen_onLoad.sqf"; };
	class BlackOutScreen_onUnload	{ file = "x\x39\ExtensiveMedicalsystem\scripting\UI\BlackOutScreen_onUnload.sqf"; };
};