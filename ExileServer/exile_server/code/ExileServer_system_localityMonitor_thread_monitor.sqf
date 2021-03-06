/**
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_array","_players","_count"];
_array = allMissionObjects "Exile_Construction_Abstract_Static";
_players = allPlayers;
_count = count _players;
if(_count > (_this select 0))then
{
	{
		if(local _x)then
		{
			if(_forEachIndex > _count)then
			{
				_x setOwner (owner (_players select (round (_forEachIndex % _count))));
			}
			else
			{
				_x setOwner (owner (_players select _forEachIndex));
			};
		};
	}
	forEach _array;
};