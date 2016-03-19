private["_type"];
_type = _this select 0;
if(_type == 0 || _type == 1) then {
	player removeAction s_player_build_origins_H1;
	s_player_build_origins_H1 = -1;
	player removeAction s_player_build_origins_H2;
	s_player_build_origins_H2 = -1;
	player removeAction s_player_build_origins_H3;
	s_player_build_origins_H3 = -1;
	player removeAction s_player_build_origins_B1;
	s_player_build_origins_B1 = -1;
	player removeAction s_player_build_origins_B2;
	s_player_build_origins_B2 = -1;
	player removeAction s_player_build_origins_B3;
	s_player_build_origins_B3 = -1;
	player removeAction s_player_build_origins_SG;
	s_player_build_origins_SG = -1;
	player removeAction s_player_build_origins_LG;
	s_player_build_origins_LG = -1;
	player removeAction s_player_build_origins_KING;
	s_player_build_origins_KING = -1;
	player removeAction s_player_build_origins_SH;
	s_player_build_origins_SH = -1;
};
if(_type == 0 || _type == 2) then {
	player removeAction s_player_origins_unlock;
	s_player_origins_unlock = -1;
};
if(_type == 0 || _type == 3) then {
	player removeAction s_player_origins_stronghold_doors;
	s_player_origins_stronghold_doors = -1;
};
sleep 2;
true