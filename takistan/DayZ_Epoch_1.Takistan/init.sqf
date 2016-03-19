startLoadingScreen ["","RscDisplayLoadCustom"];
cutText ["","BLACK OUT"];
enableSaving [false, false];

//REALLY IMPORTANT VALUES
dayZ_instance =	1;				//The instance
dayzHiveRequest = [];
initialized = false;
dayz_previousID = 0;
server_name = "KillinZedz.net";

//disable greeting menu 
player setVariable ["BIS_noCoreConversations", true];
//disable radio messages to be heard and shown in the left lower corner of the screen
enableRadio false;
// May prevent "how are you civillian?" messages from NPC
enableSentences false;

// DayZ Epochconfig
spawnShoremode = 1; // Default = 1 (on shore)
spawnArea= 1500; // Default = 1500
// 
MaxVehicleLimit = 274; // Default = 50
MaxDynamicDebris = 100; // Default = 100
dayz_MapArea = 10000; // Default = 10000

dayz_minpos = -26000; 
dayz_maxpos = 26000;

dayz_paraSpawn = false;
OldHeliCrash = true;
MaxHeliCrashes= 7;
//DZE Variables
MaxMineVeins = 30;
DZE_DeathMsgGlobal = true;
DZE_DeathMsgSide = true;
DZE_DeathMsgTitleText = false;
DZE_ForceNameTagsOff = false;
DZE_ForceNameTags = true;
DZE_ForceNameTagsInTrader = true;
DZE_AllowForceSave = true;
dayz_maxLocalZombies = 30;
dayz_maxGlobalZombiesInit = 60;
dayz_maxZeds = 800;
dayz_fullMoonNights = true;

DZE_R3F_WEIGHT = false;
DZE_SelfTransfuse = true; 									
DZE_selfTransfuse_Values = [12000, 15, 300];
DZE_FS_UseStaticVehicleSpawn = false;
DZE_PlayerZed = false;
DZE_GodModeBase = true;
DZE_BuildingLimit = 450;
DZE_PlotPole = [35,70];
DZE_requireplot = 1;
DZE_StaticConstructionCount = 1;

DZE_LootSpawnTimer = 10;
DZE_vehicleAmmo = 0;

dayz_poleSafeArea = 50;
dayz_sellDistance_vehicle = 20;
dayz_sellDistance_boat = 30;
dayz_sellDistance_air = 50;
dayz_maxAnimals = 5; // Default: 8
dayz_tameDogs = true;
DynamicVehicleDamageLow = 0; // Default: 0
DynamicVehicleDamageHigh = 100; // Default: 100

DZE_BuildOnRoads = false; // Default: False
DZE_noRotate = []; //Objects that cannot be rotated. Ex: DZE_noRotate = ["ItemVault"] (NOTE: The objects magazine classname)
DZE_vectorDegrees = [0.01, 0.1, 1, 5, 15, 45, 90];
DZE_curDegree = 45; //Starting rotation angle. //Prefered any value in array above
DZE_dirWithDegrees = true; //When rotating objects with Q&E, use the custom degrees

DZE_ConfigTrader = true;

execVM "custom\loadout\loadout.sqf";

EpochEvents = [
["any","any","any","any",30,"animated_crash_spawner"],["any","any","any","any",15,"supply_drop"],["any","any","any","any",15,"animated_crash_spawner"],["any","any","any","any",45,"flyby"]];

//Edit for custom loot
DZE_MissionLootTable = true;


//Load in compiled functions
call compile preprocessFileLineNumbers "custom\fixes\variables.sqf";							//Initilize the Variables (IMPORTANT: Must happen very early)
call compile preprocessFileLineNumbers "origins\config.sqf";							//Initilize the Variables (IMPORTANT: Must happen very early)
call compile preprocessFileLineNumbers "custom\chameleon\chameleon_init.sqf";					//Chameleon Skin Changer
progressLoadingScreen 0.1;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\publicEH.sqf";					//Initilize the publicVariable event handlers
progressLoadingScreen 0.2;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\medical\setup_functions_med.sqf";	//Functions used by CLIENT for medical
progressLoadingScreen 0.4;
call compile preprocessFileLineNumbers "custom\fixes\compiles.sqf";	
call compile preprocessFileLineNumbers "origins\compiles.sqf";							//Compile regular functions
call compile preprocessFileLineNumbers "ZSC\gold\ZSCinit.sqf";									//Zupa Single Currency
call compile preprocessFileLineNumbers "addons\bike\init.sqf";									//Personal Bike
call compile preprocessFileLineNumbers "addons\suicide\init.sqf";								//Dramatic Suicide
progressLoadingScreen 0.5;
call compile preprocessFileLineNumbers "server_traders.sqf";							//Compile trader configs
progressLoadingScreen 1.0;

"filmic" setToneMappingParams [0.153, 0.357, 0.231, 0.1573, 0.011, 3.750, 6, 4]; setToneMapping "Filmic";

if (isServer) then {
	//Compile vehicle configs
	call compile preprocessFileLineNumbers "\z\addons\dayz_server\missions\DayZ_Epoch_1.Takistan\dynamic_vehicle.sqf";

	//Spawn static vehicle
	/*
	if (true) then {
        private "_handle";
        _handle = [] execVM "\z\addons\dayz_server\FS_SpawnVehicles\FS_StaticVehicleSpawnCompiles.sqf";
        waitUntil{scriptDone _handle};
    };
	*/
	
	// Add trader citys
	_nil = [] execVM "\z\addons\dayz_server\missions\DayZ_Epoch_1.Takistan\mission.sqf";

	_serverMonitor = 	[] execVM "\z\addons\dayz_server\system\server_monitor.sqf";
};

if (!isDedicated) then {
	//Conduct map operations
	0 fadeSound 0;
	waitUntil {!isNil "dayz_loadScreenMsg"};
	dayz_loadScreenMsg = (localize "STR_AUTHENTICATING");
	
	//Run the player monitor
	_id = player addEventHandler ["Respawn", {_id = [] spawn player_death;}];
	_playerMonitor = 	[] execVM "\z\addons\dayz_code\system\player_monitor.sqf";
	//Key maker
	_nil = [] execVM "custom\VehicleKeyChanger\VehicleKeyChanger_init.sqf";	
	//ESS Spawn Selection v2
	execVM "spawn\start.sqf";
	//Zupa Single Currency
	execVM "ZSC\compiles\playerHud.sqf";
	//Welcome Credits
	execVM "custom\fixes\WelcomeCredits.sqf";
	//DZAI Client
	_nul = [] execVM "DZAI_Client\dzai_initclient.sqf";	
	//Service Point
	execVM "service_point\service_point.sqf",
	//Kill Messages
	execVM "custom\fixes\kill_msg.sqf";
	//Dynamic Traders
	execVM "custom\DynamicTraders\player_tradermarkers.sqf";
	//Flashlight
	[] execVM "custom\flashlight\lightcheck.sqf";

	//Lights
	//[false,12] execVM "\z\addons\dayz_code\compile\local_lights_init.sqf";
	
	//DayZ Watermark
	if (!isNil "server_name") then {
		[] spawn {
			waitUntil {(!isNull Player) and (alive Player) and (player == player)};
			waituntil {!(isNull (findDisplay 46))};
			5 cutRsc ["wm_disp","PLAIN"];
			((uiNamespace getVariable "wm_disp") displayCtrl 1) ctrlSetText server_name;
		};
	};	
	
};
	//Start Dynamic Weather
	//execVM "\z\addons\dayz_code\external\DynamicWeatherEffects.sqf";
	//Clear weather
	execVM "custom\weather\DynamicWeatherEffects.sqf";	
	#include "\z\addons\dayz_code\system\BIS_Effects\init.sqf"
	//R3F ARTY AND LOG Towing/Lifting
	execVM "R3F_ARTY_AND_LOG\init.sqf";
	//Trader Safezones
	[]execVM "custom\fixes\TraderSafeZones.sqf";
	//Anti Zombie Bases
	execVM "custom\fixes\SafeArea.sqf";	
	
call compile preprocessFileLineNumbers "custom\timecontrol\time_control.sqf";	