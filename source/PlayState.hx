package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState; 
import flixel.text.FlxText; 
import flixel.ui.FlxButton; 
import flixel.math.FlxMath;
// For creating game map
import flixel.tile.FlxTilemap;
// Contains some collision logic
import flixel.FlxObject;
import flixel.util.FlxColor;

/*
>Always run cmd / PS as an admin for haxe to work!

>If we press F2 while playing we get a COOL debug screen !
 We write to log by calling FlxG.log.add(); 
 */


class PlayState extends FlxState
{
	public var map:FlxTilemap;
	var player:FlxSprite;
	/*
	 * 	0 - Empty space
	 * 	1 - Solid space
	 * 	We will use tiles.png as file to draw our map
	 *  - Sprite index 0 will represent tile.png @ index 0
	 *  - Sprite index 1 will represent  -||- 1
	 */
	var mapData:Array<Int> = 
	[
		1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,
		1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,
		1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,
		1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,1,
		1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,1,
		1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,
		1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,
		1,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,
		1,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,
		1,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
		1,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
		1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
	];
	override public function create():Void
	{
		map = new FlxTilemap();
		/* 
		- 20 * 12 => Number of tiles width * height
		- 16 * 16 => width & height of tile in px
		 */
		map.loadMapFromArray(mapData,20,12,AssetPaths.tiles__png,16,16);
		/**
		 *  add => FlxGroup function - it tells an object that it belongs to a state (scene)
		 *  When it's added it will become active (visible) when that state is played
		 */
		add(map);

		player = new Player(64,16);	
		add(player);
		super.create();
	}

	override public function update(elapsed:Float):Void
	{

		super.update(elapsed);
		/*
			COLLISIONS
			Very straightforward,
			we can also pass a function when they collide - we'll see that later
		*/
		FlxG.collide(map,player);
	}

}
