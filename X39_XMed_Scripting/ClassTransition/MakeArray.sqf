/*
 * Author:
 *      X39
 * 
 * Description:
 *      Generates a new Content array out of the classtrees in configFile & missionConfig
 * 
 * Arguments:
 *      -/-
 * 
 * Return:
 *      Compiled & linked content array
 */
#include "x\x39\ExtensiveMedicalsystem\scripting\defaultSQF.hpp"
#include "x\x39\ExtensiveMedicalsystem\scripting\header.hpp"

private ["_ResultArray", "_ReadElements", "_tmp", "_functions"];
_ResultArray = [];
_functions = [];
_ReadElements = [];
_ReadElements = ([configFile >> "ExtensiveMedicalsystem"] call FNC(CT_ReadIntoArray));
_tmp = ([missionConfigFile >> "ExtensiveMedicalsystem"] call FNC(CT_ReadIntoArray));
for "_i" from 0 to ((count _tmp) - 1) do 
{
    (_ReadElements select _i) append (_tmp select _i);
};
//REGION LINK DRUGS
try
{
    try
    {
        (_ReadElements select 0) call FNC(CT_LinkDrugs);
    }
    catch
    {
        EXIT(format["Exception thrown while linking drugs: %1" COMMA _exception]);
    }
    _functions append (_ReadElements select CT_OFF_DRUG) call FNC(CT_CompileDrugs);
    (_ReadElements select CT_OFF_UNITVARS) call FNC(CT_CompileUserVariables);
}
catch
{
    
};
//ENDREGION

#include "x\x39\ExtensiveMedicalsystem\scripting\footer.hpp"
