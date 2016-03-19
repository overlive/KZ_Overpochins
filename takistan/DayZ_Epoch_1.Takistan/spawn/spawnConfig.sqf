/*  

Spawn Configuration:

1. These spawns are just examples to show what this mod can do. You can add or delete
any spawn in the _spawnPoints list. Don't forget to leave off the last comma for the last
element in the array.

2. Spawn format: 
	[Name, Pos, VIP Level, Humanity Level]
	Name - Each spawn must have a unique name. Can be anything. Do not use double quotes " inside.
	Pos - Coordinates in AboveTerrainLevel Format [x,y,z]
	VIP Level -
		0 - Anyone can pick this spawn
		1 - Only players with UIDs in _spawnLevel1 can pick this spawn
		2 - Only players with UIDs in _spawnLevel2 can pick this spawn
		3 - Only players with UIDs in _spawnLevel3 can pick this spawn​
	Humanity Level -
		0 - Anyone can pick this spawn
		Negative # - Only players with humanity less than this number can pick this spawn
		Positive # - Only players with humanity greater than this number can pick this spawn​

3. _customBase - List of UIDs that own custom bases.
   _customBases - List of custom bases in this format: ["Name",[Pos]]
   Name - Each base must have unique name. Can be anything. Do not use double quotes " inside.
   Pos - In AboveTerrainLevel [x,y,z] format
   These must match the order of the first list. The first UID in _customBase corresponds with the first base in _customBases and so on. 
   These will only show in the spawn list for the player who owns them. If multiple UIDs share the same base then add the same base multiple times to maintain order, 
   or consider making it a VIP spawn in _spawnPoints instead. Pos is exactly where you will spawn, does not run through findSafePos. These override body check.

*/

_bodyCheck = -1; // If a player has a body within this distance of a spawn that spawn will be blocked. Set to -1 to disable.
_mapRadius = 12000; // Distance from center to farthest edge of map. Only used when spawnNearPlot is enabled.
_spawnNearGroup = false; // Allow players to spawn near their group. Blocked if the player has a body within bodyCheck distance of the leader. Requires DZGM to work.
_spawnNearPlot = false; // Allow players to spawn near their plot. Blocked if the player has a body within bodyCheck distance of their plot. Requires Plot4Life to work. 
_spawnRadius = 800; // Distance around spawn to find a safe pos. Lower is closer to exact coordinates. Do not set too low or BIS_fnc_findSafePos may fail.
_customBase = [
	"0", 
	"0",
	"0"
];
_customBases = [ // Do not use a z (height) higher than _autoOpenHeight in haloConfig.sqf if using halo
	[],
	[],
	[]
];

_spawnLevel1 = ["0","0","0"];
_spawnLevel2 = ["0","0","0"];
_spawnLevel3 = ["0","0","0"];
// To give higher level VIPs access to lower level VIP spawns too use +. For example:
// _spawnLevel2 = ["0","0","0"] + _spawnLevel1;
// _spawnLevel3 = ["0","0","0"] + _spawnLevel2;

_spawnPoints = switch (toLower worldName) do {
	case "takistan":{
		[
			["Random",[[8604,7735,0],[3899,7279,0],[8615,5291,0],[5650,4254,0],[6212,8806,0],[4486,4622,0],[4802,8408,0],[7622,8554,0],[7424,4389,0],[8740,6432,0],[3731,5860,0]],0,0,1],
			["Nur",[1590.50,11839.6,0],0,0],
			["NEAF",[5935.50,11019.6,0],0,0],
			["Karachinar",[12491.5,10418.6,0],0,0],
			["Garmsar",[11018.5,6519.63,0],0,0],
			["SEAF",[8329.50,2296.63,0],0,0],
			["Ahmaday",[3415.50,1447.62,0],0,0],
			["Chaman",[735.500,2802.62,0],0,0],
			["Mulladost",[1902.50,7508.63,0],0,0],
			["Anar",[6677.00,5590.25,0],0,0],
			["Imarat",[8331.50,7606.63,0],0,0],
			["Nagara",[3441.50,9687.63,0],0,0],
			["Gospandi",[4218.50,8403.63,0],0,0],
			["Kushan",[1159.50,5529.63,0],0,0],
			["Shurkurkalay",[1565.00,3182.25,0],0,0],
			["Landay",[9263.50,5388.63,0],0,0],
			["Zavarak",[10146.5,11593.6,0],0,0],
			["Feruz Abad",[5266.50,5792.63],0,0],
			["Imarat",[8331.50,7606.63],0,0]
		]
	};
};