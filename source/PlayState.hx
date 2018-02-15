package;

import flixel.FlxCamera.FlxCameraFollowStyle;
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
	
	
	override public function create():Void
	{
	

		player = new Player(FlxG.width * 0.5,10);	
		LevelLoader.loadLevel(this,"playground");
		
		add(player);

		// PLATFORMER is dynamic camera - it'll move when when object gets closer to the edges
		FlxG.camera.follow(player, FlxCameraFollowStyle.PLATFORMER);
		// Define rectangular area where camera is allowed to scroll (it'll stop scrolling if
		// eg player falls off a cliff)
		FlxG.camera.setScrollBoundsRect(0,0,map.width,map.height,true);
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
		FlxG.collide(this,player);
	}

}
