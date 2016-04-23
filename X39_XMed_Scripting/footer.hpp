#ifndef _DEFAULT_HEADER_
	throw "defaultHeader.sqf not included";
#endif
#ifndef _DEFAULT_FOOTER_
	#define _DEFAULT_FOOTER_
#else
	throw "_DEFAULT_FOOTER_ already defined";
#endif
#ifdef VARIABLENAMESPACE
};
#endif
#ifdef DOCALLTRACE
	___callTrace___ deleteAt (count ___callTrace___) - 1;
#endif
#ifndef DISABLERETURN
    if(!isNil "___returnedValue___") exitWith {___returnedValue___};
    ___returnValue___
#endif