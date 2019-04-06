#ifndef _DEFAULT_HEADER_
	#define _DEFAULT_HEADER_
#else
	throw "_DEFAULT_HEADER_ defined more then once";
#endif

#ifdef DOTRACE
    #define STACKTRACE (str ___callTrace___)
	___callTrace___ = ___callTrace___;
	if(isNil "___callTrace___") then 
	{
		___callTrace___ = [];
	};
	if(isNil "_fnc_scriptName") then
	{
		___callTrace___ pushBack "NA";
	}
	else
	{
		___callTrace___ pushBack _fnc_scriptName;
	};
	#define DROPTRACE ___callTrace___ deleteAt (count ___callTrace___) - 1;
#else
    #define STACKTRACE ""
	#define DROPTRACE 
#endif
#ifdef DOCALLTRACE
	_str = "";
	{
		_str = format["%1>%2", _str, _x];
		false
	}count ___callTrace___;
	diag_log format["%1:%2>%3", diag_tickTime, _str, str _this];
#endif
#ifdef DOCARGS
	if(isNil "_fnc_scriptName") then
	{
        diag_log format["%1:%2 with %3", diag_tickTime, "NA", str _this];
	}
	else
	{
        diag_log format["%1:%2 with %3", diag_tickTime, _fnc_scriptName, str _this];
	};
#endif
#ifndef DISABLERETURN
    #define RETURN(VALUE) ___returnValue___ = VALUE; breakOut "___returnScope___";
	private ["___returnValue___", "___returnedValue___"];
	___returnedValue___ = _this call {
	scopeName "___returnScope___";
#else
    #define RETURN(VALUE) throw [-1, "RETURN(VALUE) define is not enabled", STACKTRACE, nil]
#endif
#ifdef VARIABLENAMESPACE
	with VARIABLENAMESPACE do
	{
#endif
