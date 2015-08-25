/**
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_numberOfVehiclesToSpawn","_mapSize","_numberOfChunks","_chunksOnXAxis","_chunksOnYAxis","_chunkSizeX","_chunkSizeY","_chunkPositions","_y"];
_numberOfVehiclesToSpawn = _this;
_mapSize = getNumber (configFile >> "CfgWorlds" >> worldName >> "mapSize");
_numberOfChunks = _numberOfVehiclesToSpawn ;
_chunksOnXAxis = floor (sqrt _numberOfChunks);
_chunksOnYAxis = floor(_numberOfChunks / _chunksOnXAxis);
_chunkSizeX = floor (_mapSize / _chunksOnXAxis);
_chunkSizeY = floor (_mapSize / _chunksOnYAxis);
_chunkPositions = [];
for "_x" from 0 to _chunksOnXAxis - 1 do 
{
	for "_y" from 0 to _chunksOnYAxis - 1 do 
	{
		_chunkPositions pushBack [_x * _chunkSizeX + _chunkSizeX * 0.5, _y * _chunkSizeY + _chunkSizeY * 0.5];
	};
};
[_chunkSizeX, _chunkSizeY, _chunkPositions]