/**
Schwedes Flashlight improvement
**/

Private ["_num","_light","_type"];
_type = _this select 0;


switch (_type) do {
		case 0: {
			_light = "#lightpoint" createVehicleLocal (getPosATL player);
			_light setLightBrightness 0.01;
			systemChat format['currentWeapon player: %1',(currentWeapon player)];
			if ((currentWeapon player) == "MeleeFlashlightRed") then {
			_light setLightColor [0.5,0,0];
			_light setLightAmbient [0.2,0.01,0.01];
			} else {
			_light setLightAmbient[.9, .9, .6];
			_light setLightColor[.9, .9, .6];
			};
			_light lightAttachObject [player, [0.1,2,0.5]];
		};
		case 1: {
					player action ["GunLightOff", player];
					_light = nearestObject [player, "#lightpoint"];
					deleteVehicle _light;
					Schwede_flashlicht = false;
		};
	};