/***********************************/ 	
/* Vehicle Key Changer v1.5.4      */
/* Written by OtterNas3            */
/* January, 11, 2014               */
/* Last update: 26/10/2014         */
/* Advanced by hellraver           */
/***********************************/


/////////////////////////////////////////////////
/////////////////////////////////////////////////
// Edit these settings to fit your needs/likes //
/////////////////////////////////////////////////
/////////////////////////////////////////////////
///// Claim Vehicles that do not have a Key /////
///////// 0 = Not allowed | 1 = Allowed /////////
vkc_claimKey = 0;
/////////////////////////////////////////////////
/////// Change Key to create a Masterkey ////////
///////// 0 = Not allowed | 1 = Allowed /////////
vkc_changeKey = 1;
/////////////////////////////////////////////////
//////// Set to "0" to disable the costs ////////
vkc_claimKeyPrice = "ItemTinBar";
/////////////////////////////////////////////////
//////// Set to "0" to disable the costs ////////
vkc_changeKeyPrice = "ItemTinBar";
/////////////////////////////////////////////////
////// Need KeyKit to use Claim Vehicle Key /////
////////// 0 = Not needed | 1 = Needed //////////
vkc_claimNeedKeykit = 1;
/////////////////////////////////////////////////
///// Need KeyKit to use Change Vehicle Key /////
////////// 0 = Not needed | 1 = Needed //////////
vkc_changeNeedKeykit = 1;
/////////////////////////////////////////////////
// Change Key & Claim Vehicles costs this Item //
/// Any Item can be used here, some examples: ///
//// ItemTinBar, ItemSilverBar, ItemGoldBar, ////
////// ItemSilverBar10oz, ItemGoldBar10oz, //////
///// ItemBriefcase20oz, ItemBriefcase100oz /////
/////////////////////////////////////////////////
/////////////////////////////////////////////////
/////////////// DONT EDIT BELOW ! ///////////////
/////////////////////////////////////////////////

/* Wait for player full ingame so we can access the action-menu */
waitUntil {!isNil "dayz_animalCheck"};

diag_log(format["KEYCHANGER: KEYCHANGER STARTED"]);
/* Start the loop check */
while{true} do {
	if (!isNull cursorTarget && (cursorTarget isKindOf "AllVehicles") && (player distance cursorTarget <= 10) && (!isEngineOn cursorTarget)) then {
		vkc_cursorTarget = cursorTarget;
		//Start restrict vehicle keys
		_typeOfCursorTarget = typeOf vkc_cursorTarget;
		_something = _typeOfCursorTarget in NOCLAIM;
		if (!_something) then {
		//End restrict vehicle keys
		vkc_ownerID = vkc_cursorTarget getVariable ["CharacterID","0"];

		if (vkc_claimKey == 1 && vkc_ownerID == "0" && vkc_cursorTarget getVariable ["VKC_claiming_disabled", 0] == 0) then {
			vkc_magazinesPlayer = magazines player;
			vkc_itemsPlayer = items player;
		
			if (("ItemKeyKit" in vkc_itemsPlayer || vkc_claimNeedKeykit == 0) && (vkc_claimKeyPrice == "0" || vkc_claimKeyPrice in vkc_magazinesPlayer)) then {
				vkc_objectID = vkc_cursorTarget getVariable ["ObjectID","0"];
				vkc_objectUID = vkc_cursorTarget getVariable ["ObjectUID","0"];

				if (!(vkc_objectID == "0" && vkc_objectUID == "0")) then {

					if (s_player_claimKey < 0) then {
						s_player_claimKey = player addAction [("<t color='#00FFFF'>" + ("Claim Vehicle Key") + "</t>"),"custom\VehicleKeyChanger\VehicleKeyChanger.sqf",[vkc_cursorTarget, vkc_temp_keys, vkc_ownerID, vkc_temp_keysDisplayName, "0", "0", "0", vkc_claimKeyPrice],-1002,false,false,"",""];
					};

				} else {

					player removeAction s_player_claimKey;
					s_player_claimKey = -1;
				};

			} else {

				player removeAction s_player_claimKey;
				s_player_claimKey = -1;
			};

		} else {

			player removeAction s_player_claimKey;
			s_player_claimKey = -1;
		};
		} else {
		//[] call ON_fnc_vkcReset;
		vkc_ownerID = 0;
		};

		if (vkc_changeKey == 1 && vkc_ownerID != "0" && vkc_cursorTarget getVariable ["VKC_disabled",0] == 0) then {
			vkc_magazinesPlayer = magazines player;
			vkc_itemsPlayer = items player;

			if (("ItemKeyKit" in vkc_itemsPlayer || vkc_changeNeedKeykit == 0) && (vkc_changeKeyPrice == "0" || vkc_changeKeyPrice in vkc_magazinesPlayer)) then {
				vkc_objectID = vkc_cursorTarget getVariable ["ObjectID","0"];
				vkc_objectUID = vkc_cursorTarget getVariable ["ObjectUID","0"];

				if (!(vkc_objectID == "0" && vkc_objectUID == "0")) then {
		
					vkc_key_colors = ["ItemKeyYellow","ItemKeyBlue","ItemKeyRed","ItemKeyGreen","ItemKeyBlack"];
					vkc_temp_keys = [];
					vkc_temp_keysDisplayName = [];
					vkc_temp_keysDisplayNameParse = [];
					vkc_temp_keysParse = [];

					{

						if (configName(inheritsFrom(configFile >> "CfgWeapons" >> _x)) in vkc_key_colors) then {
							vkc_ownerKeyId = getNumber(configFile >> "CfgWeapons" >> _x >> "keyid");
							vkc_keyName = getText(configFile >> "CfgWeapons" >> _x >> "displayName");
							vkc_temp_keysDisplayName set [count vkc_temp_keysDisplayName,vkc_keyName];
							vkc_temp_keysDisplayNameParse set [vkc_ownerKeyId,vkc_keyName];
							vkc_temp_keys set [count vkc_temp_keys,str(vkc_ownerKeyId)];
							vkc_temp_keysParse set [vkc_ownerKeyId, _x];
						};
					} forEach vkc_itemsPlayer;

					vkc_hasKey = vkc_ownerID in vkc_temp_keys;

					if (vkc_hasKey && (count vkc_temp_keys) > 1) then {
						vkc_carKeyName = (vkc_temp_keysDisplayNameParse select (parseNumber vkc_ownerID));
						vkc_targetVehicleKey = (vkc_temp_keysParse select (parseNumber vkc_ownerID));
						vkc_temp_keys = vkc_temp_keys - [vkc_ownerID];
						vkc_temp_keysDisplayName = vkc_temp_keysDisplayName - [vkc_carKeyName];

						if (s_player_changeKey < 0) then {
							s_player_changeKey = player addAction [("<t color=""#00FFFF"">" + ("Change Vehicle Key") + "</t>"),"custom\VehicleKeyChanger\VehicleKeyChanger.sqf",[vkc_cursorTarget, vkc_temp_keys, vkc_ownerID, vkc_temp_keysDisplayName, vkc_carKeyName, vkc_targetVehicleKey, vkc_changeKeyPrice, "0"],-1002,false,false,"",""];
						};

					} else {
				
						player removeAction s_player_changeKey;
						s_player_changeKey = -1;
					};

				} else {
				
					player removeAction s_player_changeKey;
					s_player_changeKey = -1;
				};

			} else {
			
				player removeAction s_player_changeKey;
				s_player_changeKey = -1;
			};

		} else {
				
			player removeAction s_player_changeKey;
			s_player_changeKey = -1;
		};

	} else {

		player removeAction s_player_claimKey;
		s_player_claimKey = -1;
		player removeAction s_player_changeKey;
		s_player_changeKey = -1;
	};

};