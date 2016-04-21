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

private ["_ResultArray", "_ReadElements"];
_ResultArray = [];
_ReadElements = [];
_ReadElements append ([configFile >> "ExtensiveMedicalsystem"] call FNC(CT_ReadIntoArray))
_ReadElements append ([missionConfigFile >> "ExtensiveMedicalsystem"] call FNC(CT_ReadIntoArray))
//ToDo: Link everything together & generate the functions needed

#include "x\x39\ExtensiveMedicalsystem\scripting\footer.hpp"
