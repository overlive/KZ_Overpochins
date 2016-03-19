waitUntil {!isNil "dayz_animalCheck"}; //remove this line completely to make it work in ArmA 3. Yes you read that correctly.
// godmode on
fnc_usec_damageHandler = {};
fnc_usec_unconscious  = {};
player allowDamage false;

playsound "introSong";
//intro movie
showCinemaBorder true;
camUseNVG false;
 
_camera = "camera" camCreate [(position player select 0)-100*sin (round(random 359)), (position player select 1)-100*cos (round(random 359)),(position player select 2)+60];
_camera cameraEffect ["internal","back"];
 
_camera camSetFOV 2.000;
_camera camCommit 0;
waitUntil {camCommitted _camera};
 
_camera camSetTarget vehicle player;
_camera camSetRelPos [0,0,0];
_camera camCommit 25;
waitUntil {camCommitted _camera};
 
_camera cameraEffect ["terminate","back"];
camDestroy _camera;
//end intro movie

//godmode off
uiSleep 5;
fnc_usec_damageHandler = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_damageHandler.sqf";
fnc_usec_unconscious = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_unconscious.sqf";
player allowDamage true;