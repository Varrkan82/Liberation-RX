// All Object classname used in RX must be declared here

if ( isNil "FOB_typename" ) then { FOB_typename = "Land_Cargo_HQ_V1_F" };
if ( isNil "FOB_box_typename" ) then { FOB_box_typename = "B_Slingload_01_Cargo_F" };
if ( isNil "FOB_truck_typename" ) then { FOB_truck_typename = "B_Truck_01_box_F" };
if ( isNil "Arsenal_typename" ) then { Arsenal_typename = "B_supplyCrate_F" };
if ( isNil "Respawn_truck_typename" ) then { Respawn_truck_typename = "B_Truck_01_medical_F" };
if ( isNil "mobile_respawn" ) then { mobile_respawn = "Land_TentDome_F" };		// "Land_SatelliteAntenna_01_F"
if ( isNil "mobile_respawn_bag" ) then { mobile_respawn_bag = "B_Kitbag_Base" };
if ( isNil "huron_typename" ) then { huron_typename = "B_Heli_Transport_03_unarmed_F" };
if ( isNil "ammobox_b_typename" ) then { ammobox_b_typename = "Box_NATO_AmmoVeh_F" };
if ( isNil "ammobox_o_typename" ) then { ammobox_o_typename = "Box_East_AmmoVeh_F" };
if ( isNil "ammobox_i_typename" ) then { ammobox_i_typename = "Box_IND_AmmoVeh_F" };
if ( isNil "waterbarrel_typename" ) then { waterbarrel_typename = "Land_BarrelWater_F" };
if ( isNil "fuelbarrel_typename" ) then { fuelbarrel_typename = "Land_MetalBarrel_F" };
if ( isNil "foodbarrel_typename" ) then { foodbarrel_typename = "Land_FoodSacks_01_large_brown_idap_F" };
if ( isNil "opfor_ammobox_transport" ) then { opfor_ammobox_transport = "O_Truck_03_transport_F" };
if ( isNil "commander_classname" ) then { commander_classname = "B_officer_F" };
if ( isNil "crewman_classname" ) then { crewman_classname = "B_crew_F" };
if ( isNil "pilot_classname" ) then { pilot_classname = "B_Helipilot_F" };
if ( isNil "PAR_Medikit" ) then { PAR_Medikit = "Medikit" };
if ( isNil "PAR_AidKit" ) then { PAR_AidKit = "FirstAidKit" };
if ( isNil "A3W_BoxWps" ) then { A3W_BoxWps = "Box_East_Wps_F" };
if ( isNil "canisterFuel" ) then { canisterFuel = "Land_CanisterFuel_Red_F" };

// *** FRIENDLIES ***
infantry_units = [
	["Alsatian_Random_F",0,0,0,GRLIB_perm_max],
	["Fin_random_F",0,0,0,0],
	["B_soldier_F",1,0,0,0],
	["B_medic_F",1,0,0,0],
	["B_engineer_F",1,0,0,0],
	["B_soldier_GL_F",1,0,0,GRLIB_perm_inf],
	["B_soldier_M_F",1,0,0,GRLIB_perm_inf],
	["B_soldier_LAT_F",1,0,0,0],
	["B_Sharpshooter_F",1,0,0,GRLIB_perm_inf],
	["B_HeavyGunner_F",1,0,0,GRLIB_perm_inf],
	["B_recon_F",1,0,0,GRLIB_perm_log],
	["B_recon_M_F",1,0,0,GRLIB_perm_log],
	["B_Recon_Sharpshooter_F",1,0,0,GRLIB_perm_log],
	["B_soldier_AA_F",1,0,0,GRLIB_perm_log],
	["B_soldier_AT_F",1,0,0,GRLIB_perm_log],
	["B_sniper_F",1,0,0,GRLIB_perm_log],
	["B_soldier_PG_F",1,0,0,GRLIB_perm_log],
	[crewman_classname,1,0,0,GRLIB_perm_inf],
	[pilot_classname,1,0,0,GRLIB_perm_log]
];

// calc units price
_grp = createGroup [GRLIB_side_friendly, true];
{
	_unit_class = _x select 0;
	_unit_mp = _x select 1;
	_unit_rank = _x select 4;
	_unit = _grp createUnit [_unit_class, [0,0,0], [], 0, "NONE"];
	_price = [_unit] call F_loadoutPrice;
	infantry_units set [_forEachIndex, [_unit_class, _unit_mp, _price, 0,_unit_rank] ];
	deleteVehicle _unit;
} foreach infantry_units ;

light_vehicles = [
	["B_Quadbike_01_F",1,5,1,0],
	["B_Boat_Transport_01_F",1,25,1,GRLIB_perm_inf],
	["C_Boat_Transport_02_F",2,25,2,GRLIB_perm_log],
	["B_Boat_Armed_01_minigun_F",5,30,5,GRLIB_perm_log],
	["B_SDV_01_F",5,30,5,GRLIB_perm_log],
	["C_Scooter_Transport_01_F",1,5,1,0],
	["SUV_01_base_black_F",1,10,1,0],
	["B_G_Offroad_01_F",1,10,1,0],
	["B_G_Offroad_01_armed_F",1,50,1,GRLIB_perm_inf],
	["C_SUV_01_F",1,10,1,GRLIB_perm_inf],
	["C_Van_01_transport_F",1,15,1,0],
	["B_MRAP_01_F",2,25,2,0],
	["B_MRAP_01_hmg_F",5,100,2,GRLIB_perm_inf],
	["B_MRAP_01_gmg_F",5,125,2,GRLIB_perm_log],
	["I_MRAP_03_F",2,25,2,0],
	["I_MRAP_03_hmg_F",5,100,2,GRLIB_perm_inf],
	["I_MRAP_03_gmg_F",5,125,2,GRLIB_perm_log],
	["B_Truck_01_transport_F",5,30,5,GRLIB_perm_log],
	["B_Truck_01_covered_F",5,30,5,GRLIB_perm_log],
	["I_LT_01_cannon_F",2,200,2,GRLIB_perm_log],
	["B_LSV_01_unarmed_F",2,25,2,GRLIB_perm_inf],
	["B_LSV_01_armed_F",5,100,2,GRLIB_perm_log],
	["B_UGV_01_F",5,10,5,GRLIB_perm_inf],
	["B_UGV_01_rcws_F",5,250,5,GRLIB_perm_log]
];

heavy_vehicles = [
	["B_APC_Tracked_01_rcws_F",10,500,10,GRLIB_perm_log],
	["B_APC_Wheeled_01_cannon_F",10,500,10,GRLIB_perm_log],
	["B_APC_Tracked_01_AA_F",10,500,10,GRLIB_perm_tank],
	["I_APC_Wheeled_03_cannon_F",10,500,10,GRLIB_perm_tank],
	["I_APC_tracked_03_cannon_F",10,500,10,GRLIB_perm_tank],
	["B_MBT_01_cannon_F",15,1000,15,GRLIB_perm_tank],
	["B_MBT_01_TUSK_F",15,1500,15,GRLIB_perm_air],
	["I_MBT_03_cannon_F",15,4500,15,GRLIB_perm_max],
	["B_AFV_Wheeled_01_cannon_F",15,3000,15,GRLIB_perm_max],
	["B_AFV_Wheeled_01_up_cannon_F",15,3500,15,GRLIB_perm_max],
	["B_MBT_01_arty_F",15,3500,15,GRLIB_perm_max],
	["I_E_Truck_02_MRL_F",15,3500,15,GRLIB_perm_max]
];

air_vehicles = [
	["B_UAV_01_F",1,10,5,GRLIB_perm_log],
	["B_UAV_06_F",1,30,5,GRLIB_perm_tank],
	["B_UAV_02_F",5,1000,5,GRLIB_perm_air],
	["B_T_UAV_03_F",5,1500,10,GRLIB_perm_max],
	["B_UAV_05_F",5,2000,15,GRLIB_perm_max],
	["C_Plane_Civil_01_F",1,50,5,GRLIB_perm_air],
	["B_Heli_Light_01_F",1,50,5,GRLIB_perm_tank],
	["I_Heli_light_03_unarmed_F",1,50,5,GRLIB_perm_tank],
	["I_Heli_light_03_F",10,2500,20,GRLIB_perm_air],
	["B_Heli_Light_01_armed_F",5,200,10,GRLIB_perm_air],
	["B_Heli_Transport_03_F",10,1000,15,GRLIB_perm_air],
	["B_Heli_Transport_01_camo_F",10,2000,15,GRLIB_perm_air],
	["B_T_VTOL_01_infantry_F",10,1000,15,GRLIB_perm_air],
	["B_T_VTOL_01_vehicle_F",10,1000,15,GRLIB_perm_air],
	["B_T_VTOL_01_armed_F",20,4000,40,GRLIB_perm_max],
	["B_Heli_Attack_01_F",10,3000,20,GRLIB_perm_air],
	["I_Plane_Fighter_04_F", 10,2500,20,GRLIB_perm_max],
	["B_Plane_CAS_01_dynamicLoadout_F",20,4000,40,GRLIB_perm_max],
	["B_Plane_Fighter_01_F",20,4500,40,GRLIB_perm_max],
	["B_Plane_Fighter_01_Stealth_F",20,4500,40,GRLIB_perm_max]
];

blufor_air = [
	"I_Heli_light_03_F",
	"B_Heli_Attack_01_F",
	"B_Plane_CAS_01_F",
	"B_Plane_Fighter_01_F",
	"B_Plane_Fighter_01_Stealth_F",
	"B_Plane_CAS_01_Cluster_F",
	"B_Plane_Fighter_01_Cluster_F",
	"B_Plane_Fighter_01_F",
	"I_Plane_Fighter_04_F"
];

static_vehicles = [
	["B_UGV_02_Demining_F",0,5,0,GRLIB_perm_inf],
	["B_Static_Designator_01_F",0,5,0,GRLIB_perm_inf],
	["B_HMG_01_F",0,10,0,GRLIB_perm_log],
	["B_HMG_01_high_F",0,10,0,GRLIB_perm_tank],
	["B_GMG_01_F",0,20,0,GRLIB_perm_log],
	["B_GMG_01_high_F",0,20,0,GRLIB_perm_tank],
	["B_static_AA_F",0,50,0,GRLIB_perm_air],
	["B_static_AT_F",0,50,0,GRLIB_perm_air],
	["B_Mortar_01_F",0,500,0,GRLIB_perm_max],
	["B_AAA_System_01_F",10,500,0,GRLIB_perm_max],
	["B_Ship_Gun_01_F",10,1500,0,GRLIB_perm_max]
];

buildings = [
	["Land_PierLadder_F",0,0,0,GRLIB_perm_inf],
	["Land_CncBarrierMedium4_F",0,0,0,0],
	["Land_CncWall4_F",0,0,0,0],
	["Land_BagFence_Round_F",0,0,0,GRLIB_perm_log],
	["Land_BagFence_Long_F",0,0,0,0],
	["Land_BagFence_Short_F",0,0,0,GRLIB_perm_inf],
	["Land_BagFence_Corner_F",0,0,0,GRLIB_perm_log],
	["Land_HBarrier_5_F",0,0,0,0],
	["Land_HBarrierWall4_F",0,0,0,GRLIB_perm_tank],
	["Land_HBarrierWall6_F",0,0,0,GRLIB_perm_tank],
	["Land_HBarrierWall_corner_F",0,0,0,GRLIB_perm_tank],
	["Land_HBarrierTower_F",0,0,0,GRLIB_perm_tank],
	["Land_HBarrierBig_F",0,0,0,GRLIB_perm_tank],
	["Land_CncShelter_F",0,0,0,GRLIB_perm_log],
	["Land_Cargo_Tower_V1_F",0,0,0,GRLIB_perm_tank],
	["Land_Cargo_House_V1_F",0,0,0,GRLIB_perm_inf],
	["Land_Cargo_Patrol_V1_F",0,0,0,GRLIB_perm_log],
	["Land_BagBunker_Small_F",0,0,0,0],
	["Land_BagBunker_Large_F",0,0,0,GRLIB_perm_tank],
	["Land_BagBunker_Tower_F",0,0,0,GRLIB_perm_tank],
	["Land_SM_01_shed_F",0,0,0,GRLIB_perm_max],
	["Land_Hangar_F",0,0,0,GRLIB_perm_max],
	["Flag_NATO_F",0,0,0,0],
	["Land_PortableLight_double_F",0,0,0,GRLIB_perm_log],
	["Land_LampHalogen_F",0,0,0,GRLIB_perm_tank],
	["Land_HelipadSquare_F",0,0,0,GRLIB_perm_log],
	["Land_Razorwire_F",0,0,0,GRLIB_perm_tank],
	["Land_ToolTrolley_02_F",0,0,0,GRLIB_perm_tank],
	["Land_WeldingTrolley_01_F",0,0,0,GRLIB_perm_tank],
	["Land_GasTank_02_F",0,0,0,GRLIB_perm_tank],
	["Land_Workbench_01_F",0,0,0,GRLIB_perm_tank],
	["Land_WaterTank_F",0,0,0,GRLIB_perm_tank],
	["Land_WaterBarrel_F",0,0,0,GRLIB_perm_tank],
	["Land_BarGate_F",0,0,0,GRLIB_perm_log],
	["Land_MetalCase_01_large_F",0,0,0,GRLIB_perm_tank],
	["CargoNet_01_box_F",0,0,0,GRLIB_perm_tank],
	["CamoNet_BLUFOR_open_F",0,0,GRLIB_perm_tank],
	["CamoNet_BLUFOR_big_F",0,0,0,GRLIB_perm_tank],
	["Land_CampingChair_V1_F",0,0,0,GRLIB_perm_tank],
	["Land_CampingChair_V2_F",0,0,0,GRLIB_perm_tank],
	["Land_CampingTable_F",0,0,0,GRLIB_perm_tank],
	["MapBoard_altis_F",0,0,0,GRLIB_perm_tank],
	["Land_Metal_rack_Tall_F",0,0,0,GRLIB_perm_tank],
	["PortableHelipadLight_01_blue_F",0,0,0,GRLIB_perm_tank],
	["Land_DieselGroundPowerUnit_01_F",0,0,0,GRLIB_perm_tank],
	["Land_Pallet_MilBoxes_F",0,0,0,GRLIB_perm_tank],
	["Land_PaperBox_open_full_F",0,0,0,GRLIB_perm_tank],
	["Land_ClutterCutter_large_F",0,0,0,GRLIB_perm_tank],
	["Land_CzechHedgehog_01_new_F",0,0,0,GRLIB_perm_inf]
];

support_vehicles = [
	[Arsenal_typename,0,10,0,0],
	["Box_B_UAV_06_medical_F",5,5,0,0],
	[mobile_respawn,10,5,0,0],
	[canisterFuel,0,5,1,0],
	["C_Offroad_01_repair_F",5,15,5,GRLIB_perm_inf],
	["C_Van_01_fuel_F",5,15,20,GRLIB_perm_inf],
	[Respawn_truck_typename,15,50,5,GRLIB_perm_log],
	["B_Slingload_01_Repair_F",10,100,0,GRLIB_perm_log],
	["B_Slingload_01_Fuel_F",0,100,30,GRLIB_perm_log],
	["B_Slingload_01_Ammo_F",0,150,0,GRLIB_perm_log],
	["B_Slingload_01_Medevac_F",10,100,0,GRLIB_perm_log],
	["B_Truck_01_ammo_F",5,150,10,GRLIB_perm_tank],
	["B_Truck_01_Repair_F",10,130,10,GRLIB_perm_tank],
	["B_Truck_01_fuel_F",5,120,40,GRLIB_perm_tank],
  	["Box_NATO_Ammo_F",0,80,0,GRLIB_perm_log],
  	["Box_NATO_WpsLaunch_F",0,150,0,GRLIB_perm_tank],
	["Land_CargoBox_V1_F",0,500,0,GRLIB_perm_max],
	[FOB_box_typename,50,1500,50,GRLIB_perm_max],
	[FOB_truck_typename,50,1500,50,GRLIB_perm_max],
	["B_APC_Tracked_01_CRV_F",10,2000,20,GRLIB_perm_max],
	[ammobox_b_typename,0,round(300 / GRLIB_recycling_percentage),0,99999],
	[ammobox_o_typename,0,round(300 / GRLIB_recycling_percentage),0,99999],
	[ammobox_i_typename,0,round(300 / GRLIB_recycling_percentage),0,99999],
	[A3W_BoxWps,0,round(150 / GRLIB_recycling_percentage),0,99999],
	[waterbarrel_typename,0,round(100 / GRLIB_recycling_percentage),0,GRLIB_perm_inf],
	[fuelbarrel_typename,0,round(100 / GRLIB_recycling_percentage),0,GRLIB_perm_inf],
	[foodbarrel_typename,0,round(100 / GRLIB_recycling_percentage),0,GRLIB_perm_inf]
];

if ( isNil "blufor_squad_inf_light" ) then { blufor_squad_inf_light = [] };
if ( count blufor_squad_inf_light == 0 ) then { blufor_squad_inf_light = [
	"B_Soldier_SL_F",
	"B_medic_F",
	"B_Soldier_GL_F",
	"B_soldier_AR_F",
	"B_Soldier_F",
	"B_Soldier_F"
	];
};
if ( isNil "blufor_squad_inf" ) then { blufor_squad_inf = [] };
if ( count blufor_squad_inf == 0 ) then { blufor_squad_inf = [
	"B_Soldier_SL_F",
	"B_medic_F",
	"B_soldier_M_F",
	"B_Soldier_AR_F",
	"B_HeavyGunner_F",
	"B_Sharpshooter_F"
	];
};
if ( isNil "blufor_squad_at" ) then { blufor_squad_at = [] };
if ( count blufor_squad_at == 0 ) then { blufor_squad_at = [
	"B_Soldier_SL_F",
	"B_medic_F",
	"B_soldier_AT_F",
	"B_soldier_AT_F",
	"B_soldier_F",
	"B_soldier_F"
	];
};
if ( isNil "blufor_squad_aa" ) then { blufor_squad_aa = [] };
if ( count blufor_squad_aa == 0 ) then { blufor_squad_aa = [
	"B_Soldier_SL_F",
	"B_medic_F",
	"B_soldier_AA_F",
	"B_soldier_AA_F",
	"B_soldier_F",
	"B_soldier_F"
	];
};
if ( isNil "blufor_squad_mix" ) then { blufor_squad_mix = [] };
if ( count blufor_squad_mix == 0 ) then { blufor_squad_mix = [
	"B_Soldier_SL_F",
	"B_medic_F",
	"B_soldier_AA_F",
	"B_soldier_AT_F",
	"B_soldier_F",
	"B_soldier_F"
	];
};
if ( isNil "blufor_squad_recon" ) then { blufor_squad_recon = [] };
if ( count blufor_squad_recon == 0 ) then { blufor_squad_recon = [
	"B_recon_TL_F",
	"B_recon_medic_F",
	"B_Recon_Sharpshooter_F",
	"B_recon_LAT_F",
	"B_recon_M_F",
	"B_recon_F"
	];
};

squads = [
	[blufor_squad_inf_light,10,300,0,GRLIB_perm_max],
	[blufor_squad_inf,20,400,0,GRLIB_perm_max],
	[blufor_squad_recon,25,500,0,GRLIB_perm_max],
	[blufor_squad_at,25,600,0,GRLIB_perm_max],
	[blufor_squad_aa,25,600,0,GRLIB_perm_max],
	[blufor_squad_mix,25,600,0,GRLIB_perm_max]
];

// All the UAVs must be declared here
uavs = [
	"B_UAV_01_F",
	"B_UAV_02_F",
	"B_T_UAV_03_F",
	"B_UAV_05_F",
	"B_UAV_06_F",
	"C_UAV_06_F",
	"B_UGV_01_F",
	"B_UGV_01_rcws_F",
	"B_UGV_02_Demining_F"
];
if ( isNil "uavs" ) then { uavs = [] };

elite_vehicles = ["B_APC_Tracked_01_CRV_F", "B_MBT_01_TUSK_F" ];
{ if (_x select 4 == GRLIB_perm_max) then { elite_vehicles pushback (_x select 0)} } foreach light_vehicles + heavy_vehicles + air_vehicles + static_vehicles;

// Everything the AI troups should be able to resupply from
ai_resupply_sources = [
	Arsenal_typename,
	"B_Truck_01_ammo_F",
	"B_Slingload_01_Ammo_F",
	"B_APC_Tracked_01_CRV_F"
];

// Everything the AI troups should be able to healing from
ai_healing_sources = [
	Respawn_truck_typename,
	"Box_B_UAV_06_medical_F",
	"B_APC_Tracked_01_CRV_F"
];

// Everything that can resupply other vehicles
vehicle_repair_sources = [
	"B_APC_Tracked_01_CRV_F",
	"C_Offroad_01_repair_F",
	"B_Truck_01_Repair_F",
	"B_Slingload_01_Repair_F"
];

vehicle_rearm_sources = [
	"B_APC_Tracked_01_CRV_F",
	"B_Truck_01_ammo_F",
	"B_Slingload_01_Ammo_F",
	"Box_NATO_Ammo_F"
];

vehicle_refuel_sources = [
	"B_APC_Tracked_01_CRV_F",
	"B_Truck_01_fuel_F",
	"B_Slingload_01_Fuel_F"
];

vehicle_artillery = [
	"B_Mortar_01_F",
	"B_Ship_Gun_01_F",
	"I_E_Truck_02_MRL_F",
	"B_MBT_01_arty_F"
];

// *** BADDIES ***

if ( isNil "opfor_sentry") then { opfor_sentry = "O_Soldier_lite_F" };
if ( isNil "opfor_rifleman") then { opfor_rifleman = "O_Soldier_F" };
if ( isNil "opfor_grenadier") then { opfor_grenadier = "O_Soldier_GL_F" };
if ( isNil "opfor_squad_leader") then { opfor_squad_leader = "O_Soldier_SL_F" };
if ( isNil "opfor_team_leader") then { opfor_team_leader = "O_Soldier_TL_F" };
if ( isNil "opfor_marksman") then { opfor_marksman = "O_soldier_M_F" };
if ( isNil "opfor_machinegunner") then { opfor_machinegunner = "O_Soldier_AR_F" };
if ( isNil "opfor_heavygunner") then { opfor_heavygunner = "O_HeavyGunner_F" };
if ( isNil "opfor_medic") then { opfor_medic = "O_medic_F" };
if ( isNil "opfor_rpg") then { opfor_rpg = "O_Soldier_LAT_F" };
if ( isNil "opfor_at") then { opfor_at = "O_Soldier_AT_F" };
if ( isNil "opfor_aa") then { opfor_aa = "O_Soldier_AA_F" };
if ( isNil "opfor_officer") then { opfor_officer = "O_officer_F" };
if ( isNil "opfor_sharpshooter") then { opfor_sharpshooter = "O_Sharpshooter_F" };
if ( isNil "opfor_sniper") then { opfor_sniper = "O_sniper_F" };
if ( isNil "opfor_engineer") then { opfor_engineer = "O_engineer_F" };
if ( isNil "opfor_paratrooper") then { opfor_paratrooper = "O_soldier_PG_F" };
if ( isNil "opfor_mrap") then { opfor_mrap = "O_MRAP_02_F" };
if ( isNil "opfor_mrap_armed") then { opfor_mrap_armed = "O_MRAP_02_gmg_F" };
if ( isNil "opfor_transport_helo") then { opfor_transport_helo = "O_Heli_Transport_04_bench_F" };
if ( isNil "opfor_transport_truck") then { opfor_transport_truck = "O_Truck_03_covered_F" };
if ( isNil "opfor_fuel_truck") then { opfor_fuel_truck = "O_Truck_03_fuel_F" };
if ( isNil "opfor_ammo_truck") then { opfor_ammo_truck = "O_Truck_03_ammo_F" };
if ( isNil "opfor_fuel_container") then { opfor_fuel_container = "Land_Pod_Heli_Transport_04_fuel_F" };
if ( isNil "opfor_ammo_container") then { opfor_ammo_container = "Land_Pod_Heli_Transport_04_ammo_F" };
if ( isNil "opfor_flag") then { opfor_flag = "Flag_CSAT_F" };

militia_squad = [
	"O_G_Soldier_SL_F",
	"O_G_Soldier_A_F",
	"O_G_Soldier_AR_F",
	"O_G_medic_F",
	"O_G_engineer_F",
	"O_G_Soldier_exp_F",
	"O_G_Soldier_GL_F",
	"O_G_Soldier_M_F",
	"O_G_Soldier_F",
	"O_G_Soldier_LAT_F",
	"O_G_Soldier_lite_F",
	"O_G_Sharpshooter_F",
	"O_G_Soldier_TL_F",
	"O_Soldier_AA_F",
	"O_Soldier_AT_F"
];

divers_squad = [
	"O_diver_TL_F",
	"O_diver_TL_F",
	"O_diver_exp_F",
	"O_diver_exp_F",
	"O_diver_exp_F",
	"O_diver_exp_F",
	"O_diver_F",
	"O_diver_F",
	"O_diver_F",
	"O_diver_F",
	"O_diver_F",
	"O_diver_F",
	"O_diver_F",
	"O_diver_F"
];

resistance_squad = [
	"I_G_Soldier_SL_F",
	"I_G_Soldier_A_F",
	"I_G_Soldier_AR_F",
	"I_G_medic_F",
	"I_G_Soldier_exp_F",
	"I_G_Soldier_GL_F",
	"I_G_Soldier_M_F",
	"I_G_Soldier_F",
	"I_G_Soldier_LAT_F",
	"I_G_Soldier_lite_F",
	"I_G_Sharpshooter_F",
	"I_G_Soldier_TL_F"
];

militia_vehicles = [
	"O_G_Offroad_01_armed_F",
	"O_G_Offroad_01_AT_F",
	"I_C_Offroad_02_LMG_F",
	"O_LSV_02_armed_F",
	"O_LSV_02_AT_F",
	"O_G_Offroad_01_armed_F",
	"O_G_Offroad_01_AT_F",
	"I_C_Offroad_02_LMG_F",
	"O_LSV_02_armed_F",
	"O_LSV_02_AT_F"
];

opfor_boat = [
	"O_Boat_Armed_01_hmg_F",
	"O_T_Boat_Armed_01_hmg_F",
	"O_Boat_Armed_01_hmg_F",
	"O_T_Boat_Armed_01_hmg_F"
];

opfor_vehicles = [
	"O_APC_Tracked_02_cannon_F",
	"O_APC_Wheeled_02_rcws_F",
	"O_APC_Tracked_02_cannon_F",
	"O_APC_Wheeled_02_rcws_F",
	"O_MBT_02_cannon_F",
	"O_MBT_02_cannon_F",
	"O_APC_Tracked_02_AA_F",
	"O_MRAP_02_gmg_F",
	"O_MRAP_02_hmg_F",
	"O_MRAP_02_hmg_F",
	"O_MBT_04_cannon_F",
	"O_MBT_04_command_F"
];

opfor_vehicles_low_intensity = [
	"O_APC_Tracked_02_cannon_F",
	"O_APC_Wheeled_02_rcws_F",
	"O_MRAP_02_hmg_F",
	"O_MRAP_02_hmg_F",
	"O_MRAP_02_gmg_F",
	"O_LSV_02_armed_F",
	"O_LSV_02_AT_F"
];

opfor_battlegroup_vehicles = [
	"O_MRAP_02_hmg_F",
	"O_MRAP_02_gmg_F",
	"O_APC_Tracked_02_cannon_F",
	"O_APC_Wheeled_02_rcws_F",
	"O_Truck_03_covered_F",
	"O_MBT_02_cannon_F",
	"O_MBT_02_cannon_F",
	"O_APC_Tracked_02_AA_F",
	"O_Heli_Attack_02_F",
	"O_Heli_Light_02_F",
	"O_Heli_Transport_04_bench_F",
	"O_Truck_03_transport_F",
	"O_MBT_04_cannon_F",
	"O_MBT_04_command_F"
];

opfor_battlegroup_vehicles_low_intensity = [
	"O_APC_Tracked_02_cannon_F",
	"O_APC_Wheeled_02_rcws_F",
	"O_MRAP_02_hmg_F",
	"O_MRAP_02_hmg_F",
	"O_MRAP_02_gmg_F",
	"O_Truck_03_covered_F",
	"O_Heli_Transport_04_bench_F",
	"O_Truck_03_transport_F",
	"O_LSV_02_armed_F",
	"O_LSV_02_AT_F"
];

opfor_troup_transports = [
	"O_APC_Wheeled_02_rcws_F",
	"O_Truck_03_covered_F",
	"O_Heli_Transport_04_bench_F",
	"O_Truck_03_transport_F",
	"O_Heli_Light_02_F",
	"O_T_VTOL_02_infantry_F"
];

opfor_choppers = [
	"O_Heli_Attack_02_F",
	"O_Heli_Attack_02_black_F",
	"O_Heli_Light_02_F",
	"O_Heli_Light_02_v2_F",
	"O_Heli_Transport_04_bench_F",
	"O_T_VTOL_02_infantry_F",
	"O_Heli_Attack_02_F",
	"O_Heli_Attack_02_black_F",
	"O_Heli_Light_02_F",
	"O_Heli_Light_02_v2_F",
	"O_Heli_Transport_04_bench_F"
];

opfor_air = [
	"O_Plane_CAS_02_F",
	"O_Plane_Fighter_02_F",
	"O_Plane_CAS_02_F",
	"O_Plane_Fighter_02_Stealth_F",
	"O_T_VTOL_02_infantry_F",
	"O_T_VTOL_02_vehicle_F",
	"O_Plane_CAS_02_Cluster_F"
];

opfor_statics = [
	"O_HMG_01_high_F",
	"O_GMG_01_high_F",
	"O_static_AA_F",
	"O_static_AT_F",
	"O_Mortar_01_F"
];

ind_recyclable = [
	["I_Truck_02_covered_F",0,round (20 / GRLIB_recycling_percentage),0],
	["I_Truck_02_transport_F",0,round (20 / GRLIB_recycling_percentage),0]
];

opfor_texture_overide = [
	//"Urban",
	//"Digital"
];

opfor_recyclable = [
	["O_HMG_01_high_F",0,round (20 / GRLIB_recycling_percentage),0],
	["O_GMG_01_high_F",0,round (40 / GRLIB_recycling_percentage),0],
	["O_static_AA_F",0,round (80 / GRLIB_recycling_percentage),0],
	["O_static_AT_F",0,round (80 / GRLIB_recycling_percentage),0],
	["O_Mortar_01_F",0,round (300 / GRLIB_recycling_percentage),0],
	["O_LSV_02_armed_F",1,round (20 / GRLIB_recycling_percentage),2],
	["O_LSV_02_AT_F",1,round (40 / GRLIB_recycling_percentage),2],
	["O_G_Offroad_01_armed_F",1,round (30 / GRLIB_recycling_percentage),2],
	["O_G_Offroad_01_AT_F",1,round (40 / GRLIB_recycling_percentage),2],
	["I_C_Offroad_02_LMG_F",1,round (30 / GRLIB_recycling_percentage),2],
	["O_Truck_03_covered_F",5,round (20 / GRLIB_recycling_percentage),5],
	["O_Truck_03_transport_F",5,round (20 / GRLIB_recycling_percentage),5],
	["O_MRAP_02_hmg_F",5,round (50 / GRLIB_recycling_percentage),3],
	["O_MRAP_02_gmg_F",5,round (50 / GRLIB_recycling_percentage),3],
	["O_Boat_Armed_01_hmg_F",2,round (100 / GRLIB_recycling_percentage),2],
	["O_T_Boat_Armed_01_hmg_F",2,round (100 / GRLIB_recycling_percentage),2],
	["O_APC_Wheeled_02_rcws_F",10,round (150 / GRLIB_recycling_percentage),10],
	["O_APC_Tracked_02_cannon_F",10,round (200 / GRLIB_recycling_percentage),10],
	["O_APC_Tracked_02_AA_F",10,round (300 / GRLIB_recycling_percentage),10],
	["O_MBT_02_cannon_F",15,round (400 / GRLIB_recycling_percentage),15],
	["O_MBT_04_cannon_F",15,round (500 / GRLIB_recycling_percentage),15],
	["O_MBT_04_command_F",15,round (500 / GRLIB_recycling_percentage),15],
	["O_Heli_Attack_02_F",10,round (700 / GRLIB_recycling_percentage),15],
	["O_Heli_Attack_02_black_F",10,round (700 / GRLIB_recycling_percentage),15],
	["O_Heli_Light_02_F",10,round (600 / GRLIB_recycling_percentage),10],
	["O_Heli_Light_02_v2_F",10,round (600 / GRLIB_recycling_percentage),10],
	["O_Heli_Transport_04_bench_F",10,round (500 / GRLIB_recycling_percentage),10],
	["O_Plane_CAS_02_F",20,round (1000 / GRLIB_recycling_percentage),30],
	["O_Plane_Fighter_02_F",20,round (1000 / GRLIB_recycling_percentage),30],
	["O_T_VTOL_02_vehicle_F",20,round (1000 / GRLIB_recycling_percentage),20]
];

// Other stuff

civilians = [
	"C_Orestes",
	"C_Nikos",
	"C_Nikos_aged",
	"C_man_1",
	"C_man_polo_6_F",
	"C_man_polo_3_F",
	"C_man_polo_2_F",
	"C_man_polo_4_F",
	"C_man_polo_5_F",
	"C_man_polo_1_F",
	"C_man_p_beggar_F",
	"C_man_1_2_F",
	"C_man_p_fugitive_F",
	"C_man_hunter_1_F",
	"C_Man_Fisherman_01_F",
	"C_man_sport_1_F",
	"C_man_sport_3_F",
	"C_man_sport_2_F",
	"C_Man_Messenger_01_F",
	"C_Story_Mechanic_01_F",
	"C_Man_casual_2_F",
	"C_Man_casual_4_F",
	"C_Man_casual_1_F",
	"C_Man_casual_3_F",
	"C_Man_casual_5_F",
	"C_journalist_F",
	"C_man_shorts_2_F",
	"C_man_w_worker_F",
	"C_Paramedic_01_base_F",
	"C_Man_UAV_06_F",
	"C_Man_UtilityWorker_01_F"
];

civilian_vehicles = [
	"C_Heli_Light_01_civil_F",
	"C_Heli_light_01_furious_F",
	"C_Hatchback_01_F",
	"C_Hatchback_01_sport_F",
	"C_Offroad_01_F",
	"C_Offroad_01_darkred_F",
	"C_Offroad_luxe_F",
	"C_Offroad_02_unarmed_F",
	"C_Offroad_01_covered_F",
	"C_Offroad_01_comms_F",
	"I_C_Offroad_02_unarmed_F",
	"SUV_01_base_black_F",
	"C_SUV_01_F",
	"C_Van_01_transport_F",
	"C_Van_01_box_F",
	"C_Van_01_fuel_F",
	"C_Quadbike_01_F",
	"C_Van_02_transport_F",
	"C_Van_02_medevac_F",
	"C_Van_02_service_F",
	"B_GEN_Van_02_transport_F",
	"C_Truck_02_covered_F",
	"C_Truck_02_transport_F",
	"C_Tractor_01_F"
];

// Configuration for ammo boxes transport
// First entry: classname
// Second entry: how far behind the vehicle the boxes should be unloaded
// Following entries: attachTo position for each box, the number of boxes that can be loaded is derived from the number of entries
box_transport_config = [
	[ "C_Offroad_01_F", -5, [0, -1.55, 0.2] ],
	[ "B_G_Offroad_01_F", -5, [0, -1.55, 0.2] ],
	[ "I_G_Offroad_01_F", -5, [0, -1.55, 0.2] ],
	[ "B_Truck_01_transport_F", -6.5, [0, -0.4, 0.4], [0, -2.1, 0.4], [0, -3.8, 0.4] ],
	[ "B_Truck_01_covered_F", -6.5, [0, -0.4, 0.4], [0, -2.1, 0.4], [0, -3.8, 0.4] ],
	[ "C_Truck_02_transport_F", -5.5, [0, 0.3, 0], [0, -1.25, 0], [0, -2.8, 0] ],
	[ "C_Truck_02_covered_F", -5.5, [0, 0.3, 0], [0, -1.25, 0], [0, -2.8, 0] ],
	[ "I_Truck_02_transport_F", -5.5, [0, 0.3, 0], [0, -1.25, 0], [0, -2.8, 0] ],
	[ "I_Truck_02_covered_F", -5.5, [0, 0.3, 0], [0, -1.25, 0], [0, -2.8, 0] ],
	[ "O_Truck_03_transport_F", -6.5, [0, -0.8, 0.4], [0, -2.4, 0.4], [0, -4.0, 0.4] ],
	[ "O_Truck_03_covered_F", -6.5, [0, -0.8, 0.4], [0, -2.4, 0.4], [0, -4.0, 0.4] ],
	[ "C_Van_01_box_F", -5.3, [0, -1.05, 0.2], [0, -2.6, 0.2] ],
	[ "C_Van_01_transport_F", -5.3, [0, -1.05, 0.2], [0, -2.6, 0.2] ],
	[ "B_Heli_Transport_03_F", -7.5, [0, 2.2, -1], [0, 0.8, -1], [0, -1.0, -1] ],
	[ "B_Heli_Transport_03_unarmed_F", -7.5, [0, 2.2, -1], [0, 0.8, -1], [0, -1.0, -1] ],
	[ "I_Heli_Transport_02_F", -6.5, [0, 4.2, -1.45], [0, 2.5, -1.45], [0, 0.8, -1.45], [0, -0.9, -1.45] ]
];
transport_vehicles = [];
{transport_vehicles pushBack ( _x select 0 )} foreach (box_transport_config);

// Whitelist Vehicle (recycle)
GRLIB_vehicle_whitelist = [
	Arsenal_typename,
	ammobox_b_typename,
	ammobox_o_typename,
	ammobox_i_typename,
	mobile_respawn,
	A3W_BoxWps,
	canisterFuel,
	waterbarrel_typename,
	fuelbarrel_typename,
	foodbarrel_typename,
	"Land_PierLadder_F",
	"Box_B_UAV_06_medical_F",
	"Land_CncBarrierMedium4_F",
	"Land_CncWall4_F",
	"Land_HBarrier_5_F",
	"Land_BagBunker_Small_F",
	"Land_BagFence_Long_F"
];

// Blacklist Vehicle (lock and paint)
GRLIB_vehicle_blacklist = [
	Arsenal_typename,
	mobile_respawn,
	huron_typename,
	opfor_ammobox_transport,
	Respawn_truck_typename,
	FOB_box_typename,
	FOB_truck_typename,
	canisterFuel,
	waterbarrel_typename,
	fuelbarrel_typename,
	foodbarrel_typename,
	"Box_NATO_Ammo_F",
  	"Box_NATO_WpsLaunch_F",
	"Box_B_UAV_06_medical_F",
	"B_Slingload_01_Repair_F",
	"B_Slingload_01_Fuel_F",
	"B_Slingload_01_Ammo_F",
	"B_Slingload_01_Medevac_F",
	"B_Heli_Transport_01_F",
	"O_Heli_Light_02_unarmed_F",
	"O_Truck_03_transport_F",
	"O_Truck_03_covered_F",
	"O_Truck_03_ammo_F",
	"O_Truck_03_fuel_F",
	"O_Truck_03_medical_F"
];
//{GRLIB_vehicle_blacklist pushBack ( _x select 0 )} foreach (support_vehicles);

infantry_units = [ infantry_units ] call F_filterMods;
light_vehicles = [ light_vehicles ] call F_filterMods;
heavy_vehicles = [ heavy_vehicles ] call F_filterMods;
air_vehicles = [ air_vehicles ] call F_filterMods;
support_vehicles = [ support_vehicles ] call F_filterMods;
static_vehicles = [ static_vehicles ] call F_filterMods;
buildings = [ buildings ] call F_filterMods;
build_lists = [[],infantry_units,light_vehicles,heavy_vehicles,air_vehicles,static_vehicles,buildings,support_vehicles,squads];
militia_squad = [ militia_squad , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
militia_vehicles = [ militia_vehicles , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
opfor_vehicles = [ opfor_vehicles , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
opfor_vehicles_low_intensity = [ opfor_vehicles_low_intensity , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
opfor_battlegroup_vehicles = [ opfor_battlegroup_vehicles , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
opfor_battlegroup_vehicles_low_intensity = [ opfor_battlegroup_vehicles_low_intensity , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
opfor_troup_transports = [ opfor_troup_transports , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
opfor_choppers = [ opfor_choppers , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
opfor_air = [ opfor_air , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
civilians = [ civilians , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
civilian_vehicles = [ civilian_vehicles , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
military_alphabet = ["Alpha","Bravo","Charlie","Delta","Echo","Foxtrot","Golf","Hotel","India","Juliet","Kilo","Lima","Mike","November","Oscar","Papa","Quebec","Romeo","Sierra","Tango","Uniform","Victor","Whiskey","X-Ray","Yankee","Zulu"];
land_vehicles_classnames = (opfor_vehicles + militia_vehicles);
opfor_squad_low_intensity = [
	opfor_squad_leader,
	opfor_medic,
	opfor_rpg,
	opfor_sentry,
	opfor_sentry,
	opfor_sentry,
	opfor_sentry
];
opfor_squad_8_standard = [
	opfor_squad_leader,
	opfor_medic,
	opfor_machinegunner,
	opfor_rpg,
	opfor_heavygunner,
	opfor_marksman,
	opfor_marksman,
	opfor_grenadier
];
opfor_squad_8_infkillers = [
	opfor_squad_leader,
	opfor_medic,
	opfor_machinegunner,
	opfor_heavygunner,
	opfor_marksman,
	opfor_sharpshooter,
	opfor_sniper,
	opfor_rpg
];
opfor_squad_8_tankkillers = [
	opfor_squad_leader,
	opfor_medic,
	opfor_machinegunner,
	opfor_rpg,
	opfor_rpg,
	opfor_at,
	opfor_at,
	opfor_at
];
opfor_squad_8_airkillers = [
	opfor_squad_leader,
	opfor_medic,
	opfor_machinegunner,
	opfor_rpg,
	opfor_rpg,
	opfor_aa,
	opfor_aa,
	opfor_aa
];
all_resistance_troops = [] + militia_squad;
all_hostile_classnames = (land_vehicles_classnames + opfor_air + opfor_choppers + opfor_troup_transports + opfor_vehicles_low_intensity + opfor_boat);
{ land_vehicles_classnames pushback (_x select 0); } foreach (heavy_vehicles + light_vehicles);
air_vehicles_classnames = [] + opfor_choppers;
{ air_vehicles_classnames pushback (_x select 0); } foreach air_vehicles;
markers_reset = [99999,99999,0];
zeropos = [0,0,0];
squads_names = [ localize "STR_LIGHT_RIFLE_SQUAD", localize "STR_RIFLE_SQUAD", localize "STR_AT_SQUAD", localize "STR_AA_SQUAD", localize "STR_MIXED_SQUAD", localize "STR_RECON_SQUAD" ];
boats_names = [ "B_Boat_Transport_01_F", "B_Boat_Armed_01_minigun_F" ];
ammobox_transports_typenames = [];
{ ammobox_transports_typenames pushback (_x select 0) } foreach box_transport_config;
ammobox_transports_typenames = [ ammobox_transports_typenames , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
elite_vehicles = [ elite_vehicles , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
original_resistance = [ "O_G_Soldier_SL_F","O_G_Soldier_A_F","O_G_Soldier_AR_F","O_G_medic_F","O_G_engineer_F","O_G_Soldier_exp_F","O_G_Soldier_GL_F","O_G_Soldier_M_F","O_G_Soldier_F","O_G_Soldier_LAT_F","O_G_Soldier_lite_F","O_G_Sharpshooter_F","O_G_Soldier_TL_F","O_Soldier_AA_F","O_Soldier_AT_F"];
opfor_infantry = [opfor_sentry,opfor_rifleman,opfor_grenadier,opfor_squad_leader,opfor_team_leader,opfor_marksman,opfor_machinegunner,opfor_heavygunner,opfor_medic,opfor_rpg,opfor_at,opfor_aa,opfor_officer,opfor_sharpshooter,opfor_sniper,opfor_engineer];
GRLIB_intel_table = "Land_CampingTable_small_F";
GRLIB_intel_chair = "Land_CampingChair_V2_F";
GRLIB_intel_file = "Land_File1_F";
GRLIB_intel_laptop = "Land_Laptop_device_F";
GRLIB_ignore_colisions_when_building = [
	Arsenal_typename,
	mobile_respawn,
	canisterFuel,
	"Box_B_UAV_06_medical_F",
	"Box_NATO_Ammo_F",
  	"Box_NATO_WpsLaunch_F",
	"Land_CargoBox_V1_F",
	"B_HMG_01_F",
	"B_HMG_01_high_F",
	"B_GMG_01_F",
	"B_GMG_01_high_F",
	"B_static_AA_F",
	"B_static_AT_F",
	"B_Mortar_01_F",
	"CamoNet_BLUFOR_open_F",
	"CamoNet_BLUFOR_big_F",
	"Land_Flush_Light_red_F",
	"Land_Flush_Light_green_F",
	"Land_Flush_Light_yellow_F",
	"Land_runway_edgelight",
	"Land_runway_edgelight_blue_F",
	"Land_HelipadSquare_F",
	"Sign_Sphere100cm_F",
	"TMR_Autorest_Georef",
	"Land_ClutterCutter_large_F",
	"Land_HighVoltageColumn_F",
	"Land_HighVoltageColumnWire_F",
	"Land_PowerLine_01_pole_small_F",
	"Land_PowerLine_01_pole_tall_F",
	"Land_PowerLine_01_wire_50m_F",
	"Land_PowerLine_01_wire_50m_main_F"
];
GRLIB_sar_wreck = "Land_Wreck_Heli_Attack_01_F";
GRLIB_sar_fire = "test_EmptyObjectForFireBig";
GRLIB_Ammobox = [
	Arsenal_typename,
	A3W_BoxWps,
	"Box_B_UAV_06_medical_F",
	"Box_NATO_Ammo_F",
	"Box_NATO_WpsLaunch_F",
	"mission_USLaunchers",
	"Land_CargoBox_V1_F"
];
GRLIB_AirDrop_1 = [
	"I_Quadbike_01_F",
	"I_G_Offroad_01_F",
	"I_G_Quadbike_01_F",
	"C_Offroad_01_F",
	"B_G_Offroad_01_F"
];
GRLIB_AirDrop_2 = [
	"I_G_Offroad_01_armed_F",
	"B_G_Offroad_01_armed_F"
	,"O_G_Offroad_01_armed_F",
	"I_C_Offroad_02_LMG_F"
];
GRLIB_AirDrop_3 = [
	"I_MRAP_03_hmg_F",
	"I_MRAP_03_hmg_F",
	"B_T_MRAP_01_hmg_F",
	"B_T_MRAP_01_gmg_F"
];
GRLIB_AirDrop_4 = [
	"B_Truck_01_transport_F",
	"B_Truck_01_covered_F",
	"I_Truck_02_covered_F",
	"I_Truck_02_transport_F"
];
GRLIB_AirDrop_5 = [
	"I_APC_tracked_03_cannon_F",
	"I_APC_Wheeled_03_cannon_F",
	"B_APC_Wheeled_01_cannon_F"
];
GRLIB_AirDrop_6 = [
	"C_Boat_Civil_01_F",
	"C_Boat_Transport_02_F",
	"B_Boat_Transport_01_F",
	"I_C_Boat_Transport_02_F"
];

GRLIB_player_grave = [
	"Land_Grave_rocks_F",
	"Land_Grave_forest_F",
	"Land_Grave_dirt_F"
];
