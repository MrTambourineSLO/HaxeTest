package;

import flixel.FlxSprite;

class Player extends  FlxSprite
{
    // Class scope
    // Static inline -> they won't be able to be changed once they're defined
    private static inline var ACCELERATION : Int = 320;
    private static inline var DRAG : Int = 320;
    private static inline var GRAVITY : Int = 600;
    private static inline var JUMP_FORCE : Int = -280;
    private static inline var WALK_SPEED : Int = 80;
    private static inline var RUN_SPEED : Int = 140;
    private static inline var FALLING_SPEED : Int = 300;

    public var direction : Int = 1;
    // CTOR
    public function new()
    {
        super();
    }

    override public function update(elapsed:Float) : Void
    {
        super.update(elapsed);
    }
}