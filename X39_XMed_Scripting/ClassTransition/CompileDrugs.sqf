/*
 * Author:
 *      X39
 * 
 * Description:
 *      Compiles Drugs into real code
 *      Generates required functions automatically
 * 
 * Arguments:
 *      Linked Drug array modified by FNC(CT_LinkDrugs)
 * 
 * Return:
 *      -/-
 * Throws:
 *      Will throw an exception in case of any error
 */
#include "x\x39\ExtensiveMedicalsystem\scripting\defaultSQF.hpp"
#include "x\x39\ExtensiveMedicalsystem\scripting\header.hpp"

params ["_InArray"];
private ["_OutArray"];
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
            "(%1 select %2 select %3) set [%4, _tmp];",
            STR(GVAR_CONTENT),
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
            "(%1 select %2 select %3) set [%4, _tmp];",
            STR(GVAR_CONTENT),
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
            "_tmp = %1 select %2 select %3 select %4;",
            STR(GVAR_CONTENT),
            _forEachIndex,
            OFF_DRUG_LOCAL,
            OFF_DRUG_LOCAL_VISIONEFFECT
        ];
        _tmpFnc = _tmpFnc + "{_x ppEffectEnable false; ppEffectDestroy _x; false} count _tmp;";
    };
    if (_DrugArray select CT_OFF_DRUG_COLOR != 1) then
    {
        _tmpFnc = _tmpFnc + format[
            "_tmp = %1 select %2 select %3 select %4;",
            STR(GVAR_CONTENT),
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
            '_currentValue = _currentValue %1 (%2);',
            _x select 1 select CT_OFF_DRUG_AFFECTS_CALCULATIONTYPE,
            format [
                _x select 1 select CT_OFF_DRUG_AFFECTS_VALUE,
                "_currentValue",
                "_tmpValue"
            ]
        ];
        false
    } count _LinkArray;
    
    //Effect Updates
    //ToDo: Update effects
    
    _tmpFnc = str formatText [
        preProcessFileLineNumbers "x\x39\ExtensiveMedicalsystem\scripting\ClassTransition\template_updateDrug.sqf",
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
        ];
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
    
} forEach _InArray;

#include "x\x39\ExtensiveMedicalsystem\scripting\footer.hpp"
