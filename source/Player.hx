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
    public function new(x:Float, y:Float)
    {
        super(x,y);
        // 16x16 -> size of a single frame of animation
        loadGraphic(AssetPaths.player__png,true,16,16);
        // Frame indices are calculated from left to right, top to bottom
        animation.add("idle",[0]);
        animation.add("walk",[1,2,3,2],12);
        animation.add("skid",[4]);
        animation.add("jump",[5]);
        animation.add("fall",[5]);
        animation.add("dead",[12]);
        
        // setSize adjusts the size of a HITBOX
        setSize(8,12);
        // since BoundingBox is calculated from bottom left we need OFFSET to
        // place the HITBOX correctly
        offset.set(4,4);
        // drag is essentially friction
        drag.x = DRAG;
        acceleration.y = GRAVITY;
        maxVelocity.set(WALK_SPEED,FALLING_SPEED);


    }

    override public function update(elapsed:Float) : Void
    {
        super.update(elapsed);
    }
}