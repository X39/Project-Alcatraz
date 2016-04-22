#Coding Guidelines
##File Extensions & Formats
* Config files have to use the extension `.cpp`
* Files which contain defines have to use the extension `.hpp`
* SQF files have to use the extension `.sqf`
* All Textures have to be in the `.paa` format

##Max Characters per line in SQF files
The character limit per line is 100.

**Reason:**
To make reading through code one just one monitor half easier (eg. because you need to have offsets on the other half) it is needed that code lines do not exceed a specific limit.
100 was chosen as it is usually not exceeded and still fits to 1980x1080 monitors with ease.

##Local variables
All local variables have to be *reserved* in a `private [...]` command of the respective scope
**Reason:** To quickly see which variable belongs to which scope, it is needed to have a single overview of all variables used in that specific scope.
This is provided by the `private <ARRAY>` command. ((also it is slightly faster then other solutions))

##Passed Arguments
Arguments ALWAYS have to be passed inside an array (no args -> empty array)
**Reason:** To not be in need to check how each function wants its argument to have, all arguments have to be passed inside of arrays
this also affects functions which only use a single in-argument

##File Header
The file header should contain the basic information about what this file is used for (only exception for this: .hpp files)
**SQF File-Template**
```
/*
 * Author:
 *      YourNick, OtherChaps
 * 
 * Description:
 *      Some description about what this does.
 *      Do not be too shy with new lines (keep in mind the 100 char limit)
 * 
 * Arguments:
 *      <Type> Description about this parameter
 * 
 * Return:
 *      Either -/-; a description about what is return (complex arrays eg.)
 *      or the actual returned content abstracted (also allowed: example in and outputs)
 *
 * Throws:
 *      Only needed if function actually does throw something
 */
#include "x\x39\ExtensiveMedicalsystem\scripting\defaultSQF.hpp"
#include "x\x39\ExtensiveMedicalsystem\scripting\header.hpp"

//CodeGoesHere
//Return stuff using the RETURN(<yourVariable>) macro from anywhere

#include "x\x39\ExtensiveMedicalsystem\scripting\footer.hpp"

```
##Exceptions (Throw arguments)
Functions which throw always need to throw following kind of array:
`[<ID>, <Message>, <Content>]`

further details:
* `<ID>` ID which is registered in `\X39_XMed_Scripting\exceptionIds.hpp`
* `<Message>` Message this exception contains
* `<Content>` either nil or further content (everything is allowed in here)