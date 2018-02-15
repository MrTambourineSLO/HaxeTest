package;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.math.FlxPoint;

import flixel.addons.editors.tiled.TiledTileLayer;
import flixel.addons.editors.tiled.TiledLayer;
import flixel.addons.editors.tiled.TiledMap;
import flixel.addons.editors.tiled.TiledObject;
import flixel.addons.editors.tiled.TiledObjectLayer;
import flixel.tile.FlxTilemap;

// Good idea to change display config to neko (windows) in VSCode - or whatever is selected 
// http://forum.haxeflixel.com/topic/515/type-not-found-flixel-addons/9
// autocomplete may not work otherwise

class LevelLoader
{
    public static function loadLevel(state : PlayState, level : String) : Void 
    {
        var tiledMap = new TiledMap("assets/data/" + level + ".tmx");
        
        // tiledMap.getLayer() reurns "generic" layer - could be "Object Layer" or "TiledLayer",
        // thus we cast it to make sure it's indeed TiledTileLayer
        var mainLayer : TiledTileLayer = cast tiledMap.getLayer("Main");
        state.map = new FlxTilemap();

        // Last argument is "Starting Index " - ie value used to offset the Id of the tile to draw
        state.map.loadMapFromArray(
            mainLayer.tileArray,
            tiledMap.width,
            tiledMap.height,
            AssetPaths.tiles__png,
            16,16,1
        );

        var backLayer : TiledTileLayer = cast tiledMap.getLayer("Back");
        // We add back layer to separate FlxTileMap - we create it on the fly
        var backMap = new FlxTilemap();

        backMap.loadMapFromArray(
            backLayer.tileArray,
            tiledMap.width,
            tiledMap.height,
            AssetPaths.tiles__png,
            16,16,1
        );
        // We don't care about collisions for background
        backMap.solid = false;
        
        // Add both maps to the state (scene)
        // back map HAS to be before MAP        
        state.add(backMap); 
        state.add(state.map);

    }
}


