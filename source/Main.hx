package;

import flixel.FlxGame;
import openfl.display.Sprite;

class Main extends Sprite
{
	public function new()
	{
		super();
		// We set Game Width/Height here to 320 * 180
		// in Project.xml we set it ot 640 * 360 which makes it 2X scaled @ 16:9 ratio
		addChild(new FlxGame(320, 180, PlayState));
	}
}
