#ifndef _DEFAULT_HEADER_
	#define _DEFAULT_HEADER_
#else
	throw "_DEFAULT_HEADER_ defined more then once";
#endif
#define RETURN(VALUE) ___returnValue___ = VALUE; breakOut "___returnScope___";

#ifdef DOCALLTRACE
    #define STACKTRACE (str ___callTrace___)
	___callTrace___ = ___callTrace___;
	if(isNil "___callTrace___") then 
	{
		___callTrace___ = [];
	};
	if(isNil "_fnc_scriptName") then
	{
		___callTrace___ pushBack "NotSet";
	}
	else
	{
		___callTrace___ pushBack _fnc_scriptName;
	};
	_str = "";
	{
		_str = format["%1>%2", _str, _x];
		false
	}count ___callTrace___;
	diag_log format["%1:%2>%3", diag_tickTime, _str, str _this];
#else
    #define STACKTRACE ""
#endif
#ifndef DISABLERETURN
	private ["___returnValue___", "___returnedValue___"];
	___returnedValue___ = _this call {
	scopeName "___returnScope___";
#endif
#ifdef VARIABLENAMESPACE
	with VARIABLENAMESPACE do
	{
#endif
