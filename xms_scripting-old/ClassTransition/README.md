Contains functions which move the static configuration of ExtensiveMedicalsystem into variables & functions

Start here if you want to eg. implement a new config arg for drugs


actual command flow is like following:
- MakeArray.sqf is callen
  function will make sure that everything is resolved correctly into sub-arrays which are used by XMS
  - ReadIntoArray.sqf is callen with configFile
    Reads the config values to arrays to progress them later on
  - ReadIntoArray.sqf is callen with missionConfigFile
    Reads any mission related values into the arrays to progress them later
  - missionconfig and normal config stuff gets merged in MakeArray.sqf
  - LinkDrugs.sqf gets callen
    Resolves the various linkage things eg. which drug affects which and how
    this function may cause the addon to fail if something is configured invalidly, check the log for issues if something failes
  - CompileDrugs.sqf gets callen
    Translates the config stuff into actual working SQF code to make it as fast as possible :)
    This is where the magic happens!!11 :3
  - CompileUserVariables.sqf gets callen
    Function will take care that the different user variable config codes get transitioned correctly into the uservariable array.
- MakeArray.sqf will exit without returning anything