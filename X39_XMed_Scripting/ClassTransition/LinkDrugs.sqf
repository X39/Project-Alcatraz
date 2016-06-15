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
 *      EX_ID_DRUG_LINK_SELF        thrown if drug trys to affect itself
 *      EX_ID_DRUG_LINK_UNKNOWN     thrown if the drug trys to affect an unknown drug
 *      EX_ID_DRUG_LINK_MAXATTEMPT  thrown when drug affect linking reached max retries (10)
 */
#include "x\x39\ExtensiveMedicalsystem\scripting\defaultSQF.hpp"
#include "x\x39\ExtensiveMedicalsystem\scripting\header.hpp"

params ["_DrugsArray"];
private [
    "_ClassesLinkageArray",
    "_ClassesLinkageArray2",
    "_ClassesClassnameArray",
    "_whileIndex"
];
_ClassesLinkageArray = [];
_ClassesClassnameArray = [];
//PreSort temporary arrays
{
    _ClassesLinkageArray pushBack [_x, []];
    _ClassesClassnameArray pushBack (_x select CT_OFF_DRUG_CLASSNAME);
} count _DrugsArray;

//STEP 1

{
    private ["_cur", "_Affects"];
    _cur = _x select 0;
    _Affects = _x select 1;
    {
        private ["_index"];
        //Do a basic Self Reference test and throw if true
        if ((_x select CT_OFF_DRUG_AFFECTS_NAME) == (_cur select CT_OFF_DRUG_CLASSNAME)) then
        {
            throw [
                EX_ID_DRUG_LINK_UNKNOWN,
                format["Self affection on drug '%1'", _cur select CT_OFF_DRUG_CLASSNAME],
                STACKTRACE,
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
                STACKTRACE,
                nil
            ];
        };
        //Add drug + info to Affects array
        //In second step this will get the actual AffectedBy array
        _Affects pushBack [_index, _x];
        false
    } count (_cur select CT_OFF_DRUG_AFFECTS);
    false
} count _ClassesLinkageArray;

//STEP 2

_ClassesLinkageArray2 = [[], []];
_whileIndex = 0;
while {_whileIndex < count _ClassesLinkageArray} do
{
    scopeName "whileLoop";
    private ["_pushBackFlag", "_index", "_tmpAffectsArray"];
    (_ClassesLinkageArray select _whileIndex) params ["_cur", "_Affects", ["_attempt", 0]];
    if (_attempt >= 10) then
    {
        throw [
            EX_ID_DRUG_LINK_MAXATTEMPT,
            format [
                    "Drug '%1' reached max affects link attempts (10)",
                    _cur select CT_OFF_DRUG_CLASSNAME
            ],
            STACKTRACE,
            nil
        ];
    };
    _pushBackFlag = false;
    _tmpAffectsArray = [];
    //Search the affected drug and place its ref in _tmpAffectsArray
    {
        _index = _ClassesLinkageArray2 select 0 find (_x select 0);
        if (_index != -1)
        {
            _tmpAffectsArray pushBack [_ClassesLinkageArray select _index, _x select 1];
        }
        else
        {
            _pushBackFlag = true;
            breakTo "whileLoop";
        };
        false
    } count _Affects;
    if (_pushBackFlag) then
    {
        (_ClassesLinkageArray select _whileIndex) set [2, _attempt + 1];
        _ClassesLinkageArray pushBack (_ClassesLinkageArray select _whileIndex);
    }
    else
    {
        private ["_thisIndex"];
        _thisIndex = (_ClassesClassnameArray find _cur select CT_OFF_DRUG_CLASSNAME);
        _x set [1, []];
        _index = _ClassesLinkageArray2 select 0 pushBack _thisIndex;
        _index = _ClassesLinkageArray2 select 1 pushBack _x;
        //Enter this drugs index inside of the affects array
        {
            _x select 0 select 1 pushBack [_index, _x select 1];
            false
        } count _tmpAffectsArray;
    };
};
//Replace original array contents with temporary ones
{
    _DrugsArray set [_forEachIndex, _x];
} foreach _ClassesLinkageArray2 select 1;

#include "x\x39\ExtensiveMedicalsystem\scripting\footer.hpp"
