params [ "_unit", "_killer", "_instigator"];
private [ "_nearby_bigtown","_msg" ];

if ( isServer ) then {
	if (!(isNull _instigator)) then {
		_killer = _instigator;
	} else {
		if (!(_killer isKindOf "CAManBase")) then {
			_killer = effectiveCommander _killer;
		};
	};

	//diag_log format ["DBG: %1 %2", name _killer, side (group _killer)];
	//diag_log format ["DBG: %1 %2", name _unit, side (group _unit)];

	// ACE
	if (GRLIB_ACE_enabled && local _unit) then {
		if (isNull _killer) then {
			_killer = _unit getVariable ["ace_medical_lastDamageSource", objNull];
		};
	};

	if ( (typeof _unit) in [FOB_box_typename, FOB_truck_typename, foodbarrel_typename, waterbarrel_typename] ) exitWith {
		sleep 30;
		deleteVehicle _unit;
	};

	if ( typeof _unit == mobile_respawn ) exitWith { [_unit, "del"] remoteExec ["addel_beacon_remote_call", 2] };

	if ( ((typeof _unit) in [ammobox_o_typename, ammobox_b_typename, ammobox_i_typename, fuelbarrel_typename]) && ((getPosATL _unit) select 2 < 10) ) exitWith {
		waitUntil { sleep 0.5; (isNull attachedTo _unit) };
		sleep random 2;
		( "R_80mm_HE" createVehicle (getPosATL _unit) ) setVelocity [0, 0, -200];
		deleteVehicle _unit;
	};

	if ((_unit iskindof "LandVehicle") || (_unit iskindof "Air") || (_unit iskindof "Ship") ) then {
		[_unit] call clean_vehicle;
	};

	if ( _unit isKindOf "Man" && vehicle _unit != _unit ) then {
		sleep 3;
		_unit action ["Eject", vehicle _unit];
		//moveOut _unit;
	};

	if (isNil "infantry_weight") then { infantry_weight = 33 };
	if (isNil "armor_weight") then { armor_weight = 33 };
	if (isNil "air_weight") then { air_weight = 33 };

	if ( isPlayer _unit ) then { stats_player_deaths = stats_player_deaths + 1 };

	if ( side _killer == GRLIB_side_friendly ) then {

		_nearby_bigtown = [ sectors_bigtown, {  (!(_x in blufor_sectors)) && ( _unit distance (markerpos _x) < 250 ) } ] call BIS_fnc_conditionalSelect;
		if ( count _nearby_bigtown > 0 ) then {
			combat_readiness = combat_readiness + (0.5 * GRLIB_difficulty_modifier);
			stats_readiness_earned = stats_readiness_earned + (0.5 * GRLIB_difficulty_modifier);
			if ( combat_readiness > 100.0 && GRLIB_difficulty_modifier < 2 ) then { combat_readiness = 100.0 };
		};

		if ( _killer isKindOf "Man" ) then {
			infantry_weight = infantry_weight + 1;
			armor_weight = armor_weight - 0.66;
			air_weight = air_weight - 0.66;
		} else {
			if ( (typeof (vehicle _killer) ) in land_vehicles_classnames ) then  {
				infantry_weight = infantry_weight - 0.66;
				armor_weight = armor_weight + 1;
				air_weight = air_weight - 0.66;
			};
			if ( (typeof (vehicle _killer) ) in air_vehicles_classnames ) then  {
				infantry_weight = infantry_weight - 0.66;
				armor_weight = armor_weight - 0.66;
				air_weight = air_weight + 1;
			};
		};

		if ( infantry_weight > 100 ) then { infantry_weight = 100 };
		if ( armor_weight > 100 ) then { armor_weight = 100 };
		if ( air_weight > 100 ) then { air_weight = 100 };
		if ( infantry_weight < 0 ) then { infantry_weight = 0 };
		if ( armor_weight < 0 ) then { armor_weight = 0 };
		if ( air_weight < 0 ) then { air_weight = 0 };
	};

	if ( _unit isKindOf "Man" && _unit != _killer ) then {
		_isPrisonner = _unit getVariable ["GRLIB_is_prisonner", false];
		if ( side (group _unit) == GRLIB_side_civilian || _isPrisonner ) then {
			stats_civilians_killed = stats_civilians_killed + 1;
			if ( isPlayer _killer ) then {
				stats_civilians_killed_by_players = stats_civilians_killed_by_players + 1;
				if ( GRLIB_civ_penalties ) then {
					_penalty = GRLIB_civ_killing_penalty;
					_score = score _killer;
					if ( _score < GRLIB_perm_inf ) then { _penalty = 5 };
					if ( _score > GRLIB_perm_inf && _score < GRLIB_perm_log ) then { _penalty = 10 };
					_killer addScore - _penalty;
					[name _unit, _penalty, _killer] remoteExec ["remote_call_civ_penalty", 0];
				};
			};
			_isDriver = (driver (vehicle _killer) == _killer);

			if ( side (group _killer) == GRLIB_side_friendly && (!isPlayer _killer) && (!_isDriver) ) then {
				_owner_id = (vehicle _killer) getVariable ["GRLIB_vehicle_owner", ""];
				if (_owner_id == "") then {
					_owner_id = (_killer getVariable ["PAR_Grp_ID", "0_0"]) splitString "_" select 1;
				};

				if (_owner_id != "0") then {
					_owner_player = _owner_id call BIS_fnc_getUnitByUID;
					_owner_player addScore - GRLIB_civ_killing_penalty;
					_msg = format ["%1, Your AI kill Civilian !!", name _owner_player] ;
					[gamelogic, _msg] remoteExec ["globalChat", 0];
					[name _unit, GRLIB_civ_killing_penalty, _owner_player] remoteExec ["remote_call_civ_penalty", 0];
				};
			};
		};

		if ( side _killer == GRLIB_side_friendly ) then {
			if ( side (group _unit) == GRLIB_side_enemy ) then {
				stats_opfor_soldiers_killed = stats_opfor_soldiers_killed + 1;
				if ( isplayer _killer ) then {
					stats_opfor_killed_by_players = stats_opfor_killed_by_players + 1;
				};

				private _ai_score = _killer getVariable ["PAR_AI_score", nil];
				if (!isNil "_ai_score") then {
					_killer setVariable ["PAR_AI_score", (_ai_score - 1), true];
				};
			};
			if ( side (group _unit) == GRLIB_side_friendly ) then {
				stats_blufor_teamkills = stats_blufor_teamkills + 1;
				_killer addScore -9;
				_msg = localize "STR_FRIENDLY_FIRE";
				[gamelogic, _msg] remoteExec ["globalChat", 0];
			};
		} else {
			if ( side (group _unit) == GRLIB_side_friendly ) then {
				stats_blufor_soldiers_killed = stats_blufor_soldiers_killed + 1;
			};
		};
	} else {
		if ( typeof _unit in all_hostile_classnames ) then {
			stats_opfor_vehicles_killed = stats_opfor_vehicles_killed + 1;
			if ( isplayer _killer ) then {
				stats_opfor_vehicles_killed_by_players = stats_opfor_vehicles_killed_by_players + 1;

				if ( GRLIB_ammo_bounties ) then {
					_res = [_unit] call F_getBounty;
					[typeOf _unit, (_res select 0), (_res select 1), _killer] remoteExec ["remote_call_ammo_bounty", 0];
				};
			};
		} else {
			stats_blufor_vehicles_killed = stats_blufor_vehicles_killed + 1;
		};
	};

	_unit setVariable ["R3F_LOG_disabled", true, true];
	please_recalculate = true;
	//sleep 3;
	//_unit enableSimulationGlobal false;
};
