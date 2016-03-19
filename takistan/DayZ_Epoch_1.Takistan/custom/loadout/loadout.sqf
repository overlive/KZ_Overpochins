find_suitable_ammunition = {

	private["_weapon","_result","_ammoArray"];

	_result 	= false;
	_weapon 	= _this;
	_ammoArray 	= getArray (configFile >> "cfgWeapons" >> _weapon >> "magazines");

	if (count _ammoArray > 0) then {
		_result = _ammoArray select 0;
	};

	_result

};

loadout_fnc_selectRandom = {
    _this select (floor random (count _this))
};

_primary = ["M16A2","M16A4","M4A1","Sa58P_EP1","Sa58V_EP1","AKS_74_U","AK_47_M","AK_74","FN_FAL","Winchester1866","MR43","M1014","LeeEnfield","Saiga12K","vil_SKS","gms_k98","vil_ak12","vil_AKM","vil_AKMS","vil_AKS_47","vil_AKS_74","vil_AKs_74_u","vil_AK_101","vil_AK_103","vil_AK_103","vil_AK_47","vil_AK_47_49","vil_AK_74","vil_AK_74m","vil_AK_74P","vil_AK_nato_m1","vil_AK_nato_m80","vil_AEK1","vil_AEK2","vil_AeK_23","vil_AeK_3","vil_AMD","vil_AMD63","vil_ASH82","vil_M64","vil_M70","vil_M70B","vil_type88_1","vil_9a91","vil_Abakan","FHQ_ACR_BLK_IRN","FHQ_ACR_BLK_IRN_F","vil_Vikhr","vil_G36KA4","vil_G36VA4","vil_G3a2","vil_G3a3","vil_G3a4","vil_G3a4b","vil_G3an","vil_G3anb","vil_MPi","vil_PMI","vil_PMI74S","vil_PMIS","RH_mas"] call loadout_fnc_selectRandom;
_secondary = ["glock17_EP1","Colt1911","M9","Makarov","revolver_EP1","RH_deagle","RH_Deagleg","RH_Deaglem","RH_Deaglemz","RH_Deaglemzb","RH_Deagles","RH_g17","RH_g18","RH_g19","RH_g19t","RH_browninghp","RH_bull","RH_anac","RH_anacg","RH_m1911","RH_m1911old","RH_m9","RH_m93r","RH_m9c","RH_usp","RH_uspm","RH_mk2","RH_mk22","RH_mk22v","RH_p226","RH_p226s","RH_p38","RH_ppk","RH_python","RH_tec9","RH_tt33","RH_vz61","vil_B_HP","vil_USP","vil_USP45","vil_Glock","vil_Glock_o"] call loadout_fnc_selectRandom;
_ammo = _primary call find_suitable_ammunition;
_ammos = _secondary call find_suitable_ammunition;
_food = ["FoodCanBadguy", "FoodCanBoneboy", "FoodCanCorn", "FoodCanCurgon", "FoodCanDemon", "FoodCanFraggleos", "FoodCanGriff", "FoodCanHerpy", "FoodCanOrlok", "FoodCanPowell", "FoodCanTylers", "FoodCanSardines", "FoodCanBakedBeans", "FoodCanFrankBeans", "FoodCanPasta", "ItemWaterbottleUnfilled","ItemWaterbottleBoiled","FoodmuttonCooked","FoodchickenCooked","FoodBaconCooked","FoodRabbitCooked","FoodCanUnlabeled","FoodPistachio","FoodNutmix","FoodMRE"] call loadout_fnc_selectRandom;
_drink = ["ItemSodaClays", "ItemSodaDrwaste", "ItemSodaLemonade", "ItemSodaLvg","ItemSodaMzly", "ItemSodaRabbit", "ItemSodaSmasht", "ItemSodaOrangeSherbet", "ItemSodaMdew", "ItemSodaRbull", "ItemSodaMtngreen", "ItemSodaCoke", "ItemSodaPepsi", "ItemWaterbottle"] call loadout_fnc_selectRandom;
_backpack = ["DZ_Patrol_Pack_EP1","DZ_Assault_Pack_EP1","DZ_Czech_Vest_Puch"] call loadout_fnc_selectRandom;
_light = ["HandChemRed","HandRoadFlare","HandRoadFlare"] call loadout_fnc_selectRandom;

DefaultMagazines = ["ItemBandage","ItemMorphine","ItemPainkiller",_light,_ammo,_ammo,_ammos,_ammos,_ammos,_food,_drink]; 
DefaultWeapons = ["ItemMap","ItemRadio",_primary,_secondary]; 
DefaultBackpack = _backpack; 
DefaultBackpackWeapon = "";
DZE_defaultSkin = [["Skin_Camo1_DZ","Skin_Rocket_DZ","Skin_Soldier1_DZ","Skin_GUE_Commander_DZ","Skin_FR_OHara_DZ","Skin_FR_Rodriguez_DZ","Skin_Graves_Light_DZ","Skin_CZ_Special_Forces_GL_DES_EP1_DZ","Skin_Soldier_Bodyguard_AA12_PMC_DZ","Skin_Soldier_Sniper_PMC_DZ","Skin_Haris_Press_EP1_DZ"],["Skin_SurvivorW2_DZ","Skin_SurvivorW3_DZ","Skin_SurvivorWcombat_DZ","Skin_SurvivorWdesert_DZ","Skin_SurvivorWurban_DZ","Skin_SurvivorWpink_DZ"]];