/*
 * Author:
 *      X39
 * 
 * Description:
 *      Links together passed Drug array (content of passed array will be modified!)
 * 
 * Arguments:
 *      Drugs array created by FNC(CT_MakeArray)
 * 
 * Return:
 *      -/-
 * Throws:
 *      Will throw an exception in case of any error (eg. classes try to cross-affect each other)
 */
#include "x\x39\ExtensiveMedicalsystem\scripting\defaultSQF.hpp"
#include "x\x39\ExtensiveMedicalsystem\scripting\header.hpp"

params ["_DrugsArray"];
private ["_ClassesLinkageArray", "_ClassesClassnameArray"];
_ClassesLinkageArray = [];
_ClassesClassnameArray = [];
//PreSort temporary arrays
{
    _ClassesLinkageArray pushBack [_x, []];
    _ClassesClassnameArray pushBack (_x select CT_OFF_DRUG_CLASSNAME);
} count _DrugsArray;
{
    private ["_cur", "_AffectedBy"];
    _cur = _x select 0;
    _AffectedBy = _x select 1;
    {
        private ["_index"];
        //Do a basic Self Reference test and throw if true
        if ((_x select CT_OFF_DRUG_AFFECTS_NAME) == (_cur select CT_OFF_DRUG_CLASSNAME)) then
        {
            throw [
                EX_ID_DRUG_LINK_UNKNOWN,
                format["Self affection on drug '%1'", _cur select CT_OFF_DRUG_CLASSNAME],
                nil
            ];
        };
        //Receive index of desired drug and throw if drug is not existing
        _index = _ClassesClassnameArray find (_x select CT_OFF_DRUG_AFFECTS_NAME);
        if (_index == -1) then
        {
            throw [
                EX_ID_DRUG_LINK_SELF,
                format [
                        "Unknown drug '%1' affected by drug '%2'",
                        _x select CT_OFF_DRUG_AFFECTS_NAME,
                        _cur select CT_OFF_DRUG_CLASSNAME
                ],
                nil
            ];
        };
        //Add drug to AffectedBy array for later code generation
        _AffectedBy pushBack (_ClassesLinkageArray select _index select 0);
        false
    } count (_cur select CT_OFF_DRUG_AFFECTS);
    false
} count _ClassesLinkageArray;
//Replace original array contents with temporary ones
{
    _DrugsArray set [_forEachIndex, _x];
} foreach _ClassesLinkageArray;

#include "x\x39\ExtensiveMedicalsystem\scripting\footer.hpp"
