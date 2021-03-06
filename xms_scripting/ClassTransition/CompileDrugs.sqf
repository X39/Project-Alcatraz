/*
 * Author:
 *      xms
 * 
 * Description:
 *      Compiles Drugs into real code
 *      Generates required functions automatically
 * 
 * Arguments:
 *      Linked Drug array modified by xms_XMed_fnc_CT_LinkDrugs
 * 
 * Return:
 *      -/-
 * Throws:
 *      Will throw an exception in case of any error
 */
#include "\x\xms\extensivemedicalsystem\scripting\defaultSQF.hpp"
#include "\x\xms\extensivemedicalsystem\scripting\header.hpp"

#include "\x\xms\extensivemedicalsystem\scripting\ClassTransition\DrugsOffset.hpp"

#define VARPREFIX "xms_XMed_var_"

params ["_InArray"];
private ["_OutArray", "_updateDrugTemplate", "_checkBlackoutConditionTemplate"];
_updateDrugTemplate = preProcessFileLineNumbers "x\xms\extensivemedicalsystem\scripting\ClassTransition\template_updateDrug.sqf";
_checkBlackoutConditionTemplate = preProcessFileLineNumbers "x\xms\extensivemedicalsystem\scripting\ClassTransition\template_drugConditionCheck.sqf";

_OutArray = [];
{
    private ["_tmp"];
    _tmp = [];
    _tmp resize OFF_DRUG_SIZE__;
    _OutArray pushBack _tmp;
    false
} count _InArray;
{
    private ["_DrugArray", "_LinkArray", "_ThisArray", "_tmpFnc"];
    _DrugArray = _InArray select CT_OFF_DRUG_LNK_DRUG;
    _LinkArray = _InArray select CT_OFF_DRUG_LNK_AFFECTARRAY;
    _ThisArray = _OutArray select _forEachIndex;
    
    _ThisArray set [
        FNL_OFF_DRUG_INFO, 
        [
            _DrugArray select CT_OFF_DRUG_CLASSNAME,
            _DrugArray select CT_OFF_DRUG_DISPLAYNAME,
            _DrugArray select CT_OFF_DRUG_TRANSITIONPERTICK,
            _DrugArray select CT_OFF_DRUG_MAXVALUE
        ]
    ];
    //REGION init function
    _tmpFnc = 'params ["_unit"]; private ["_tmp"];';
    if (_DrugArray select CT_OFF_DRUG_VISION != 1) then
    {
        _tmpFnc = _tmpFnc + "_tmp = [];";
        _tmpFnc = _tmpFnc + format[
            "_tmp = pushBack ppEffectCreate ['WetDistortion', 300 + %1];",
            PPEffectOffset + _forEachIndex
        ];
        _tmpFnc = _tmpFnc + format[
            "_tmp = pushBack ppEffectCreate ['FilmGrain', 2000 + %1];",
            PPEffectOffset + _forEachIndex
        ];
        _tmpFnc = _tmpFnc + "{_x ppEffectEnable true; false} count _tmp;";
        _tmpFnc = _tmpFnc + format[
            "(xms_XMed_var_Drug select %1 select %2) set [%3, _tmp];",
            _forEachIndex,
            OFF_DRUG_LOCAL,
            OFF_DRUG_LOCAL_VISIONEFFECT
        ];
    };
    if (_DrugArray select CT_OFF_DRUG_COLOR != 1) then
    {
        _tmpFnc = _tmpFnc + "_tmp = [];";
        _tmpFnc = _tmpFnc + format[
            "_tmp = pushBack ppEffectCreate ['ColorInversion', 2500 + %1];",
            PPEffectOffset + _forEachIndex
        ];
        _tmpFnc = _tmpFnc + "{_x ppEffectEnable true; false} count _tmp;";
        _tmpFnc = _tmpFnc + format[
            "(xms_XMed_var_Drug select %1 select %2) set [%3, _tmp];",
            _forEachIndex,
            OFF_DRUG_LOCAL,
            OFF_DRUG_LOCAL_COLOREFFECT
        ];
    };
    _tmpFnc = _tmpFnc + format [
        "_unit setVariable [%1Drug_%2, 0, true];",
        VARPREFIX,
        (_DrugArray select CT_OFF_DRUG_CLASSNAME)
    ];
    _ThisArray set [OFF_DRUG_INITFNC, compile _tmpFnc];
    //ENDREGION
    //REGION uninit function
    _tmpFnc = 'params ["_unit"]; private ["_tmp"];';
    if (_DrugArray select CT_OFF_DRUG_VISION != 1) then
    {
        _tmpFnc = _tmpFnc + format[
            "_tmp = xms_XMed_var_Drug select %1 select %2 select %3;",
            _forEachIndex,
            OFF_DRUG_LOCAL,
            OFF_DRUG_LOCAL_VISIONEFFECT
        ];
        _tmpFnc = _tmpFnc + "{_x ppEffectEnable false; ppEffectDestroy _x; false} count _tmp;";
    };
    if (_DrugArray select CT_OFF_DRUG_COLOR != 1) then
    {
        _tmpFnc = _tmpFnc + format[
            "_tmp = xms_XMed_var_Drug select %1 select %2 select %3;",
            _forEachIndex,
            OFF_DRUG_LOCAL,
            OFF_DRUG_LOCAL_COLOREFFECT
        ];
        _tmpFnc = _tmpFnc + "{_x ppEffectEnable false; ppEffectDestroy _x; false} count _tmp;";
    };
    _tmpFnc = _tmpFnc + format [
        "_unit setVariable [%1Drug_%2, nil, true];",
        VARPREFIX,
        (_DrugArray select CT_OFF_DRUG_CLASSNAME)
    ];
    _ThisArray set [OFF_DRUG_UNINITFNC, compile _tmpFnc];
    //ENDREGION
    //REGION tick function
    _tmpFnc = '';
    
    //Value updates
    {
        _tmpFnc = _tmpFnc + format [
            "_tmpValue = _unit getVariable [%1, 0];",
            format [
                "%1Drug_%2",
                VARPREFIX,
                _InArray select _x select 0 
                select CT_OFF_DRUG_LNK_DRUG select CT_OFF_DRUG_CLASSNAME
            ]
        ];
        _tmpFnc = _tmpFnc + format [
            '_currentValue = _currentValue %1 ((%2) * _compensation);',
            _x select 1 select CT_OFF_DRUG_AFFECTS_CALCULATIONTYPE,
            format [
                _x select 1 select CT_OFF_DRUG_AFFECTS_VALUE,
                "_unit",
                "_currentValue",
                "_tmpValue"
            ]
        ];
        false
    } count _LinkArray;
    
    //Effect Updates
    //ToDo: Update effects
    
    _tmpFnc = str formatText [
        _updateDrugTemplate,
        _DrugArray select CT_OFF_DRUG_CLASSNAME,
        format ["%1Drug_%2", VARPREFIX, (_DrugArray select CT_OFF_DRUG_CLASSNAME)],
        _DrugArray select CT_OFF_DRUG_TRANSITIONPERTICK,
        _tmpFnc
    ];
    _ThisArray set [OFF_DRUG_TICKFNC, compile _tmpFnc];
    //ENDREGION
    //REGION add value function
    _tmpFnc = 'params ["_unit", "_value"];';
    _tmpFnc = _tmpFnc + format [
        "_unit setVariable [%1Drug_%2, %3, true];",
        VARPREFIX,
        (_DrugArray select CT_OFF_DRUG_CLASSNAME),
        format [
            "_unit getVariable [%1Drug_%2, _value, true]",
            VARPREFIX,
            (_DrugArray select CT_OFF_DRUG_CLASSNAME)
        ]
    ];
    _ThisArray set [OFF_DRUG_ADDVAL, compile _tmpFnc];
    //ENDREGION
    //REGION set value function
    _tmpFnc = 'params ["_unit", "_value"];';
    _tmpFnc = _tmpFnc + format [
        "_unit setVariable [%1Drug_%2, _value, true];",
        VARPREFIX,
        (_DrugArray select CT_OFF_DRUG_CLASSNAME)
    ];
    _ThisArray set [OFF_DRUG_SETVAL, compile _tmpFnc];
    //ENDREGION
    //REGION get value function
    _tmpFnc = 'params ["_unit"];';
    _tmpFnc = _tmpFnc + format [
        "_unit getVariable [%1Drug_%2, _value, true]",
        VARPREFIX,
        (_DrugArray select CT_OFF_DRUG_CLASSNAME)
    ];
    _ThisArray set [OFF_DRUG_GETVAL, compile _tmpFnc];
    //ENDREGION
    //REGION Check drug blackout conditions
    _tmpFnc = str formatText [
        _checkBlackoutConditionTemplate,
        _DrugArray select CT_OFF_DRUG_CLASSNAME,
        format ["%1Drug_%2", VARPREFIX, (_DrugArray select CT_OFF_DRUG_CLASSNAME)],
        format[
            _DrugArray select CT_OFF_DRUG_BLACKOUT select CT_OFF_DRUG_BLACKOUT_CONDITION,
            "_unit",
            "_currentValue",
            _DrugArray select CT_OFF_DRUG_MAXVALUE
        ],
        _DrugArray select CT_OFF_DRUG_BLACKOUT select CT_OFF_DRUG_BLACKOUT_STAGE
    ];
     _ThisArray set [OFF_DRUG_BLACKOUT_CONDITION, compile _tmpFnc];
   //ENDREGION
	//ToDo: Implement item consume function
} forEach _InArray;

RETURN(_OutArray)

#include "\x\xms\extensivemedicalsystem\scripting\footer.hpp"
