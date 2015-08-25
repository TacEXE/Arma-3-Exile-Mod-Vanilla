/**
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionID","_parameters","_requestingPlayer","_spawnLocationMarkerName","_playerUID","_bambiPlayer","_cargoType"];
_sessionID = _this select 0;
_parameters = _this select 1;
_requestingPlayer = _sessionID call ExileServer_system_session_getPlayerObject;
_spawnLocationMarkerName = _parameters select 0;
_playerUID = getPlayerUID _requestingPlayer;
_group = createGroup independent;
_bambiPlayer = _group createUnit ["Exile_Unit_Player", [0,0,0], [], 0, "CAN_COLLIDE"];
{
	_cargoType = _x call ExileClient_util_cargo_getType;
	diag_log str [_x,_cargoType];
	switch (_cargoType) do
	{
		case 1: 	{ _bambiPlayer addMagazine _x; };
		case 2: 	{ _bambiPlayer addWeaponGlobal _x; };
		case 3: 	{ _bambiPlayer addWeaponGlobal _x; };
		case 4:		{ _bambiPlayer linkItem _x; };
		default 					{ _bambiPlayer addItem _x; };
	};
}
forEach getArray(configFile >> "CfgSettings" >> "BambiSettings" >> "loadOut");
ExileSystemPlayerCreateASYNC pushBack [_playerUID,"",[_sessionID,_requestingPlayer,_spawnLocationMarkerName,_bambiPlayer]];
true