//  **FORMAT** -- (note no comma after last array entry)
//
//  DZE_DEPLOYABLES_CONFIG = [
//      [_clickItem,_deployOffset,_packDistance,_damageLimit,_packAny,_cargo,_ammo,_hive,_plot,_simulation,_road,_deployables,_near,_parts,_condition],
//      [_clickItem,_deployOffset,_packDistance,_damageLimit,_packAny,_cargo,_ammo,_hive,_plot,_simulation,_road,_deployables,_near,_parts,_condition],
//      [...more stuff here...]
//  ];
//    
//  parameter    | description                                                         |  type  | example
// --------------|---------------------------------------------------------------------|--------|--------
// _clickItem    | class name of the item to click on                                  | string | "ItemToolbox"
// _deployOffset | [_side,_front,_up] array to offset the deployable when buiding      | array  | [0,2,1]
// _packDistance | how close does the packer need to be to pack the object?            | number | 5
// _damageLimit  | item can't be repacked if damage is > this. (-1 = no re-packing)    | number | 0.1
// _packAny      | can anyone repack the deployable?                                   | bool   | false
// _cargo        | clear the cargo of the deployable?                                  | bool   | false
// _ammo         | should vehicle ammo be cleared? (does not persist through restart)  | bool   | true
// _hive         | write deployable to database?                                       | bool   | false
// _plot         | require a plot from the owner to build the deployable?              | bool   | false
// _simulation   | enable simulation (movement/damage) for the object? (true for cars) | bool   | true
// _road         | enable road building for this object?                               | bool   | true
// _deployables  | array of class names that can be deployed with this method          | array  | ["MMT_Civ"]
// _near         | array of items required nearby to build (workshop/fire/fueltank)    | array  | []
// _parts        | array of parts required to build (will be taken from player)        | array  | ["ItemToolbox"]
// _condition    | string of code to evaluate to determine whether action is shown     | string | "!(isNull player) && {(getPlayerUID player) in DZE_DEPLOYABLE_ADMINS}"

DZE_DEPLOYABLES_CONFIG = [
    // deploy a non-permanent bike from a toolbox right in front of the player that can be re-packed by the owner as long as it's under 10% damage
    ["ItemToolbox",[0,5,1],5,0.9,false,false,false,false,false,true,true,["Old_bike_TK_CIV_EP1"],[],["PartGeneric","PartWheel","PartWheel","ItemPole","ItemPole","ItemPole"],"true"],

    // deploy mounted guns 2 meters in front of players that persist through server restart
    ["M2StaticMG_US_Bag_EP1",[0,2,0],1,0,false,false,false,true,true,true,false,["M2StaticMG_US_EP1"],[],["M2StaticMG_US_Bag_EP1"],"true"],
	["DSHKM_TK_GUE_Bag_EP1",[0,2,0],1,0,false,false,false,true,true,true,false,["DSHKM_Gue"],[],["DSHKM_TK_GUE_Bag_EP1"],"true"],
	["sandbag_nest_kit",[0,7,0],1,0,false,false,false,true,true,true,false,["Fort_Nest_M240"],[],["M240_DZ","sandbag_nest_kit","ItemSandbag","ItemSandbag","ItemSandbag","ItemSandbag"],"true"],

	//Benches
    ["PartWoodPile",[0,2,0],5,1,false,true,false,true,true,false,false,["Park_bench1"],[],["PartWoodPile","PartWoodLumber"],"true"],
	["PartWoodPile",[0,2,0],5,1,false,true,false,true,true,false,false,["Park_bench2"],[],["PartWoodPile","PartWoodLumber","PartGeneric"],"true"],

	//Tables/Shelves
    ["ItemCrowbar",[0,2,0],5,1,false,true,false,true,true,false,false,["Land_Rack_EP1","Land_Table_EP1","Land_Shelf_EP1","WoodChair"],[],["PartWoodLumber","PartWoodLumber","PartWoodLumber","PartWoodLumber","PartWoodPlywood"],"true"],

	//Barricades
    ["CinderBlocks",[0,2,0],5,1,false,true,false,true,true,false,false,["Land_CncBlock","Land_CncBlock_Stripes"],[],["CinderBlocks"],"true"],
	//["CinderBlocks",[0,2,0],5,1,false,true,false,true,true,false,false,["hedgehog_concreteBig"],[],["CinderBlocks","CinderBlocks","CinderBlocks"],"true"],
	
	//h barrier
	["ItemSandbagExLarge5x",[0,2,0],5,1,false,true,false,true,true,false,false,["Land_HBarrier_large"],[],["ItemSandbagExLarge5x","ItemSandbag","ItemSandbag","ItemSandbag"],"true"],
	
	//Large sandbag nest
	["sandbag_nest_kit",[0,10,0],5,1,false,true,false,true,true,false,false,["Land_fortified_nest_big"],[],["sandbag_nest_kit","ItemSandbag","ItemSandbag","ItemSandbag","ItemSandbag","PartWoodLumber","PartWoodLumber","PartWoodLumber","PartWoodLumber","PartWoodPlywood","PartWoodPlywood","PartWoodPlywood"],"true"],

	//Watchtower
	["sandbag_nest_kit",[0,10,0],5,1,false,true,false,true,true,false,false,["Land_Fort_Watchtower_EP1"],[],["sandbag_nest_kit","ItemSandbagExLarge5x","ItemSandbagExLarge5x","ItemSandbagExLarge5x","PartWoodLumber","PartWoodLumber","PartWoodLumber","PartWoodLumber","PartWoodPlywood","PartWoodPlywood"],"true"],	
	
	//Rampart
	["ItemSandbag",[0,2,0],5,1,false,true,false,true,true,false,false,["Land_fort_rampart_EP1"],[],["ItemSandbag","ItemSandbag","ItemSandbag","ItemSandbag","ItemSandbag","ItemSandbag","PartWoodPlywood","PartWoodPlywood","PartWoodPlywood"],"true"],
	
	//Cargo containers
    ["ItemCrowbar",[0,6,0],5,1,false,true,false,true,true,false,false,["Land_Misc_Cargo1Ao","Land_Misc_Cargo1Bo"],[],["metal_panel_kit","metal_panel_kit","metal_panel_kit","metal_panel_kit"],"true"],

	//Gyrocopters/mozzie
	["ItemToolbox",[0,5,1],5,0.9,false,false,true,false,false,true,true,["CSJ_GyroCover"],[],["PartGeneric","PartEngine","PartVRotor","ItemPole","ItemPole","ItemPole","ItemJerrycan","PartWheel","PartWheel","PartWheel"],"true"],
	["ItemToolbox",[0,5,1],5,0.9,false,false,true,false,false,true,true,["CSJ_GyroC"],[],["PartGeneric","PartEngine","PartVRotor","ItemPole","ItemPole","ItemPole","ItemJerrycan"],"true"],
	["ItemToolbox",[0,5,1],5,0.9,false,false,true,false,false,true,true,["CSJ_GyroP"],[],["PartGeneric","PartEngine","PartVRotor","ItemPole","ItemPole","ItemPole","ItemJerrycan","PartWheel","PartWheel","PartWheel"],"true"]
    ];

// **DZE_DEPLOYABLE_NAME_MAP format
//  
//  DZE_DEPLOYABLE_NAME_MAP = [
//      [_class,_name],
//      [_class,_name],
//      [... more ...]
//  ];
//
//  parameter    | description                                                         |  type  | example
// --------------|---------------------------------------------------------------------|--------|--------
// _class        | class name of the item you want to replace the name of              | string | "Notebook"
// _name         | new name to display when right clicking                             | string | "Macbook Pro"
//
DZE_DEPLOYABLE_NAME_MAP = [
    ["Notebook","Macbook Pro"]
];

DZE_DEPLOYABLE_ADMINS = [];
