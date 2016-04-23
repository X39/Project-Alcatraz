class Init
{
	class PreInit           { file = "x\x39\ExtensiveMedicalsystem\scripting\PreInit.sqf"; preInit = 1; };
	class PostInit          { file = "x\x39\ExtensiveMedicalsystem\scripting\PostInit.sqf"; postInit = 1; };
};
class ClassTransition
{
	class CT_MakeArray      { file = "x\x39\ExtensiveMedicalsystem\scripting\ClassTransition\MakeArray.sqf"; };
	class CT_ReadIntoArray  { file = "x\x39\ExtensiveMedicalsystem\scripting\ClassTransition\ReadIntoArray.sqf"; };
	class CT_LinkDrugs      { file = "x\x39\ExtensiveMedicalsystem\scripting\ClassTransition\LinkDrugs.sqf"; };
};