/*
 * Author:
 *      xms
 * 
 * Description:
 *      Reads given configbase into an array
 * 
 * Arguments:
 *      [
 *          <CONFIG>    Config base to read from (eg. 'configFile >> "ExtensiveMedicalsystem")
 *      ]
 * 
 * Return:
 *      Compiled & linked content array
 *      See ClassTransition\CTArrayOffsets.hpp for further details about the array content
 *      [
 *          <DRUGS>
 *      ]
 */
#include "\x\xms\extensivemedicalsystem\scripting\defaultSQF.hpp"
#include "\x\xms\extensivemedicalsystem\scripting\ClassTransition\CTArrayOffsets.hpp"
#include "\x\xms\extensivemedicalsystem\scripting\header.hpp"

params ["_cfg"];
private ["_ResultArray", "_class", "_classCount", "_curProcessingArray"];
_ResultArray = [];

//REGION Read available drugs (in CTArrayOffsets.hpp CT_OFF_DRUG has to represent this position!)
_curProcessingArray = [];
_class = _cfg >> "Drugs";
_classCount = count _class;
for "_i" from 0 to (_cfgCount - 1) do
{
    private ["_subClass", "_tmpArray", "_subSubClass"];
    _subClass = _class select _i;
    _tmpArray = [];
    _tmpArray resize CT_OFF_DRUG_MINSIZE__;
    _tmpArray set [CT_OFF_DRUG_CLASSNAME,           className _subClass];
    _tmpArray set [CT_OFF_DRUG_DISPLAYNAME,
                    [_subClass, "DisplayName", ""] call BIS_fnc_returnConfigEntry];
    _tmpArray set [CT_OFF_DRUG_TRANSITIONPERTICK,
                    [_subClass, "TransitionPerTick", 0] call BIS_fnc_returnConfigEntry];
    _tmpArray set [CT_OFF_DRUG_MAXVALUE,
                    [_subClass, "MaxValue", -1] call BIS_fnc_returnConfigEntry];
    _tmpArray set [CT_OFF_DRUG_BLOODTHIKNESS,
                    [_subClass, "BloodThikness", 1] call BIS_fnc_returnConfigEntry];
    _tmpArray set [CT_OFF_DRUG_PAIN,
                    [_subClass, "Pain", 1] call BIS_fnc_returnConfigEntry];
    _tmpArray set [CT_OFF_DRUG_VISION,
                    [_subClass, "Vision", 1] call BIS_fnc_returnConfigEntry];
    _tmpArray set [CT_OFF_DRUG_COLOR,
                    [_subClass, "Color", 1] call BIS_fnc_returnConfigEntry];
    
    _subSubClass = _subClass >> "Affects";
    if (configName _subSubClass != "") then
    {
        private ["_limit", "_arr"];
        _limit = (count _subSubClass) - 1;
        _arr = [];
        for "_j" from 0 to _limit do
        {
            private ["_subClass", "_innerArray"];
            _subClass = _subSubClass select _j;
            _innerArray = [];
            _innerArray resize CT_OFF_DRUG_AFFECTS_SIZE__;
            _tmpArray set [CT_OFF_DRUG_AFFECTS_NAME,
                            [_subClass, "Name", ""] call BIS_fnc_returnConfigEntry];
            _tmpArray set [CT_OFF_DRUG_AFFECTS_VALUE,
                            [_subClass, "Value", ""] call BIS_fnc_returnConfigEntry];
            _tmpArray set [CT_OFF_DRUG_AFFECTS_CALCULATIONTYPE,
                            [_subClass, "CalculationType", "+"] call BIS_fnc_returnConfigEntry];
            _arr pushBack _innerArray;
        };
        _tmpArray set [CT_OFF_DRUG_AFFECTS, _arr];
    }
    else
    {
        _tmpArray set [CT_OFF_DRUG_AFFECTS, []];
    };
    
    
    _subSubClass = _subClass >> "BlackOut";
    if (configName _subSubClass != "") then
    {
        private ["_limit", "_arr"];
        _limit = (count _subSubClass) - 1;
        _arr = [];
        for "_j" from 0 to _limit do
        {
            private ["_subClass", "_innerArray"];
            _subClass = _subSubClass select _j;
            _innerArray = [];
            _innerArray resize CT_OFF_DRUG_BLACKOUT_SIZE__;
            _tmpArray set [CT_OFF_DRUG_BLACKOUT_STAGE,
                            [_subClass, "Stage", ""] call BIS_fnc_returnConfigEntry];
            _tmpArray set [CT_OFF_DRUG_BLACKOUT_CONDITION,
                            [_subClass, "Condition", ""] call BIS_fnc_returnConfigEntry];
            _tmpArray set [CT_OFF_DRUG_BLACKOUT_FOLLOWEDBY,
                            [_subClass, "FollowedBy", ""] call BIS_fnc_returnConfigEntry];
            _arr pushBack _innerArray;
        };
        _tmpArray set [CT_OFF_DRUG_BLACKOUT, _arr];
    }
    else
    {
        _tmpArray set [CT_OFF_DRUG_BLACKOUT, []];
    };
    
    
    _subSubClass = _subClass >> "Items";
    if (configName _subSubClass != "") then
    {
        private ["_limit", "_arr"];
        _limit = (count _subSubClass) - 1;
        _arr = [];
        for "_j" from 0 to _limit do
        {
            private ["_subClass", "_innerArray"];
            _subClass = _subSubClass select _j;
            _innerArray = [];
            _innerArray resize CT_OFF_DRUG_AFFECTS_SIZE__;
            _tmpArray set [CT_OFF_DRUG_ITEMS_DISPLAYNAME,
                            [_subClass, "DisplayName", ""] call BIS_fnc_returnConfigEntry];
            _tmpArray set [CT_OFF_DRUG_ITEMS_IMAGE,
                            [_subClass, "Image", ""] call BIS_fnc_returnConfigEntry];
            _tmpArray set [CT_OFF_DRUG_ITEMS_CLASSNAME,
                            [_subClass, "Classname", ""] call BIS_fnc_returnConfigEntry];
            _tmpArray set [CT_OFF_DRUG_ITEMS_VALUE,
                            [_subClass, "Value", ""] call BIS_fnc_returnConfigEntry];
            _arr pushBack _innerArray;
        };
        _tmpArray set [CT_OFF_DRUG_ITEMS, _arr];
    }
    else
    {
        _tmpArray set [CT_OFF_DRUG_ITEMS, []];
    };
    
    _curProcessingArray pushBack _tmpArray;
};
_ResultArray pushBack _curProcessingArray;
//ENDREGION
//REGION Read available Unit Variables (in CTArrayOffsets.hpp CT_OFF_UNITVARS has to represent this position!)
_curProcessingArray = [];
_class = _cfg >> "UnitVariables";
_classCount = count _class;
for "_i" from 0 to (_cfgCount - 1) do
{
    private ["_subClass", "_tmpArray", "_subSubClass"];
    _subClass = _class select _i;
    _tmpArray = [];
    _tmpArray resize CT_OFF_UNITVARS_MINSIZE__;
    _tmpArray set [CT_OFF_UNITVARS_CLASSNAME, className _subClass];
    _tmpArray set [CT_OFF_UNITVARS_DESCRIPTION,
                    [_subClass, "Description", ""] call BIS_fnc_returnConfigEntry];
    _tmpArray set [CT_OFF_UNITVARS_DEFAULTVALUE,
                    [_subClass, "Default", ""] call BIS_fnc_returnConfigEntry];
    _tmpArray set [CT_OFF_UNITVARS_LOCAL,
                    [_subClass, "Local", 0] call BIS_fnc_returnConfigEntry];
    _tmpArray set [CT_OFF_UNITVARS_ISLIVE,
                    [_subClass, "isLive", -1] call BIS_fnc_returnConfigEntry];
    
    _subSubClass = _subClass >> "Events";
    if (configName _subSubClass != "") then
    {
        private ["_limit", "_arr"];
        _limit = (count _subSubClass) - 1;
        _arr = [];
        for "_j" from 0 to _limit do
        {
            private ["_subClass", "_innerArray"];
            _subClass = _subSubClass select _j;
            _innerArray = [];
            _innerArray resize CT_OFF_UNITVARS_EVENTS_SIZE__;
            _tmpArray set [CT_OFF_UNITVARS_EVENTS_INIT,
                            [_subClass, "init", ""] call BIS_fnc_returnConfigEntry];
            _tmpArray set [CT_OFF_UNITVARS_EVENTS_UNINIT,
                            [_subClass, "uninit", ""] call BIS_fnc_returnConfigEntry];
            _tmpArray set [CT_OFF_UNITVARS_EVENTS_LOCALITYCHANGE,
                            [_subClass, "localityChange", ""] call BIS_fnc_returnConfigEntry];
            _tmpArray set [CT_OFF_UNITVARS_EVENTS_LOCALITYCHANGED,
                            [_subClass, "localityChanged", ""] call BIS_fnc_returnConfigEntry];
            _arr pushBack _innerArray;
        };
        _tmpArray set [CT_OFF_UNITVARS_EVENTS, _arr];
    }
    else
    {
        _tmpArray set [CT_OFF_UNITVARS_EVENTS, []];
    };
    _curProcessingArray pushBack _tmpArray;
};
_ResultArray pushBack _curProcessingArray;
//ENDREGION
RETURN(_ResultArray);


#include "\x\xms\extensivemedicalsystem\scripting\footer.hpp"
