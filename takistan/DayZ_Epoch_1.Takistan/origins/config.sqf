//****************************************************************************
//************** DayZ Origins Buildings Config made by Rotzloch **************
//****************************************************************************
DZE_Origins_Building_System = true;
DZE_Use_PlotPole4Life = false;
DZE_Origins_LockUnlock_Distance = 20;
DZE_Origins_Build_Distance = 10;
//In which Box/Container the Player must place their stuff for building the house
DZE_Origins_Container = "USOrdnanceBox";		
DZE_Origins_Build_Tools_Require = ["ItemToolbox","ItemEtool","ItemSledge"];
// Humanity Need for House Levels. Hero/Bandit1 == Small Garage AND Hero/Bandit3 == Large Garage && Stronghold
DZE_Origins_Humanity = 
[
	["Hero1",5000],
	["Hero2",12000],
	["Hero3",25000],
	["Bandit1",5000],
	["Bandit2",12000],
	["Bandit3",25000]
];

//What needed for Building Houses
DZE_Origins_House1 = [
	["ItemWoodFloor", 1],
	["ItemCorrugated", 2],
	["ItemCombolock", 1],
	["cinder_wall_kit", 4],
	["ItemWoodWall", 2],
	["ItemWoodWallWindow", 1],
	["ItemWoodWallWithDoor", 1],
	["stick_fence_kit", 4]
];
DZE_Origins_House2 = [
	["ItemWoodFloor", 2],
	["ItemCorrugated", 4],
	["ItemCombolock", 1],
	["cinder_wall_kit", 8],
	["ItemWoodWall", 4],
	["ItemWoodWallWindow", 2],
	["ItemWoodWallWithDoor", 2],
	["stick_fence_kit", 8]
];
DZE_Origins_House3 = [
	["ItemWoodFloor", 4],
	["ItemCorrugated", 8],
	["ItemCombolock", 2],
	["cinder_wall_kit", 12],
	["ItemWoodWall", 8],
	["ItemWoodWallWindow", 3],
	["ItemWoodWallWithDoor", 2],
	["stick_fence_kit", 12]
];
DZE_Origins_SG = [
	["ItemWoodFloor", 2],
	["ItemCorrugated", 2],
	["ItemCombolock", 1],
	["cinder_wall_kit", 4],
	["ItemWoodWall", 3],
	["ItemWoodWallGarageDoor", 1],
	["stick_fence_kit", 4]
];
DZE_Origins_LG = [
	["ItemWoodFloor", 4],
	["ItemCorrugated", 8],
	["ItemCombolock", 2],
	["cinder_wall_kit", 12],
	["ItemWoodWall", 8],
	["ItemWoodWallWithDoor", 1],
	["ItemWoodWallGarageDoor", 1],
	["stick_fence_kit", 12]
];
DZE_Origins_King = [
	["ItemCombolock", 1],
	["ItemWoodFloor", 12],
	["ItemWoodWall", 12],
	["cinder_wall_kit", 30],
	["cinder_garage_kit", 2],
	["stick_fence_kit", 15]
];
DZE_Origins_Stronghold = [
	["ItemCombolock", 5],
	["ItemWoodFloor", 20],
	["ItemWoodWall", 20],
	["ItemWoodWallWithDoor", 4],
	["ItemCorrugated", 10],
	["cinder_wall_kit", 30],
	["cinder_garage_kit", 2],
	["outhouse_kit", 1],
	["ItemWoodStairsSupport", 12],
	["metal_panel_kit", 20],
	["light_pole_kit", 12],
	["storage_shed_kit", 2],
	["stick_fence_kit", 20]
];

DZE_Origins_NameLookup = [
	["Uroven1DrevenaBudka","Bandits - Wooden Shed (Level 1)"],
	["Uroven2KladaDomek","Bandits - Log House (Level 2)"],
	["Uroven3DrevenyDomek" ,"Bandits - Wooden House (Level 3)"],
	["Uroven1VelkaBudka","Hero Level 1"],
	["Uroven2MalyDomek","Hero Level 2"],
	["Uroven3VelkyDomek" ,"Hero Level 3"],
	["kingramida","Pyramid"],
	["velkaGaraz","Large Garage"],
	["malaGaraz" ,"Small Garage"],
	["krepost", "Stronghold"]
];

DZE_Origins_Build_HousesGarages = [
	["H1", ((DZE_Origins_Humanity select 0) select 1), "Hero Level 1","Uroven1VelkaBudka",DZE_Origins_House1],
	["H2", ((DZE_Origins_Humanity select 1) select 1), "Hero Level 2","Uroven2MalyDomek",DZE_Origins_House2],
	["H3", ((DZE_Origins_Humanity select 2) select 1), "Hero Level 3","Uroven3VelkyDomek",DZE_Origins_House3],
	["B1", ((DZE_Origins_Humanity select 3) select 1), "Bandits - Wooden Shed (Level 1)","Uroven1DrevenaBudka",DZE_Origins_House1],
	["B2", ((DZE_Origins_Humanity select 4) select 1), "Bandits - Log House (Level 2)","Uroven2KladaDomek",DZE_Origins_House2],
	["B3", ((DZE_Origins_Humanity select 5) select 1), "Bandits - Wooden House (Level 3)","Uroven3DrevenyDomek",DZE_Origins_House3],
	["SGH", ((DZE_Origins_Humanity select 0) select 1), "Small Garage","malaGaraz",DZE_Origins_SG],
	["SGB", ((DZE_Origins_Humanity select 3) select 1), "Small Garage","malaGaraz",DZE_Origins_SG],
	["LGH", ((DZE_Origins_Humanity select 2) select 1), "Large Garage","velkaGaraz",DZE_Origins_LG],
	["LGB", ((DZE_Origins_Humanity select 5) select 1), "Large Garage","velkaGaraz",DZE_Origins_LG],
	["KINGH", ((DZE_Origins_Humanity select 2) select 1), "Pyramid","kingramida",DZE_Origins_King],
	["KINGB", ((DZE_Origins_Humanity select 5) select 1), "Pyramid","kingramida",DZE_Origins_King],
	["SHH", ((DZE_Origins_Humanity select 2) select 1), "Stronghold","krepost",DZE_Origins_Stronghold],
	["SHB", ((DZE_Origins_Humanity select 5) select 1), "Stronghold","krepost",DZE_Origins_Stronghold]
];

DZE_Origins_Houses = ["Uroven1DrevenaBudka","Uroven2KladaDomek","Uroven3DrevenyDomek","Uroven1VelkaBudka","Uroven2MalyDomek","Uroven3VelkyDomek"];
DZE_Origins_Garages= ["malaGaraz","velkaGaraz","kingramida","Uroven3DrevenyDomek","Uroven3VelkyDomek"];
DZE_Origins_Stronghold = ["krepost"];
DZE_Origins_Buildings = DZE_Origins_Houses + DZE_Origins_Garages + DZE_Origins_Stronghold;

dayz_updateObjects = dayz_updateObjects + DZE_Origins_Buildings;
diag_log("Origins Base Building Config initialized!");