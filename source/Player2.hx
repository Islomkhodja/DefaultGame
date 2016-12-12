package;

import flixel.FlxG;
import flixel.FlxSprite;

import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;
import flixel.math.FlxPoint;
import flixel.FlxObject;

/**
 * ...
 * @author Islomkhodja
 */
class Player2 extends FlxSprite 
{
    public var speed:Float = 200;
	public function new(?X:Float=0, ?Y:Float=0) 
	{
		super(X, Y);
		makeGraphic(10, 15, FlxColor.BLUE);
		maxVelocity.set(100, 200);
		acceleration.y = 800;
		drag.x = maxVelocity.x * 10;
	}
	
	private function movement() {
		var up:Bool;
		var down:Bool;
		var right:Bool;
		var left:Bool;
		
		up = FlxG.keys.anyPressed([W]);
		down = FlxG.keys.anyPressed([S]);
		right = FlxG.keys.anyPressed([D]);
		left = FlxG.keys.anyPressed([A]);
		
		
		if(up && down) {
			up = down = false;
		}
		
		if(left && right) {
			left = right = false;
		}
		
		if (up || down || right || left) {
			drag.x = drag.y = 1600;
			var mA:Float = 0;
			 if (up)
			 {
				 mA = -90;
				 if (left)
					 mA -= 45;
				 else if (right)
					 mA += 45;
			 }
			 else if (down)
			 {
				 mA = 90;
				 if (left)
					 mA += 45;
				 else if (right)
					 mA -= 45;
			 }
			 else if (left)
				 mA = 180;
			 else if (right)
				 mA = 0;
			
				 velocity.set(speed, 0);
				 velocity.rotate(FlxPoint.weak(0, 0), mA);
			
		} 
	} // movement function
	
	override public function update(elapsed:Float):Void 
	{
		//movement();
		
		acceleration.x = 0;

		
		FlxG.collide();
		
		// Player 1 controls
		acceleration.x = 0;
		
		if (FlxG.keys.pressed.A)
		{
			acceleration.x = -maxVelocity.x * 7;
		}
		
		if (FlxG.keys.pressed.D)
		{
			acceleration.x = maxVelocity.x * 7;
		}
		
		if (FlxG.keys.justPressed.W && isTouching(FlxObject.FLOOR))
		{
			velocity.y -= maxVelocity.y;
			velocity.y -= maxVelocity.y;
			
		}
		
		super.update(elapsed);
	}
}