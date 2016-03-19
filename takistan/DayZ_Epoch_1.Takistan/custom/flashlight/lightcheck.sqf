/**
Schwedes Flashlight improvement
Light Check
**/
Private ["_light"];

	waitUntil {!isNull (findDisplay 46)}; //making sure player is spawned
		while {true} do {
			
			waitUntil {Schwede_flashlicht};
			if !((currentWeapon player) in Schwede_FlashlightWeapons) then {
			
					player action ["GunLightOff", player];
					_light = nearestObject [player, "#lightpoint"];
					deleteVehicle _light;
					Schwede_flashlicht = false;

			};
			sleep 0.1;
		};