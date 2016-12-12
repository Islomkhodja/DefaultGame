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
class Player extends FlxSprite 
{
	public var speed:Float = 150;
	
	public function new(?X:Float=0, ?Y:Float=0) 
	{
		super(X, Y);
		makeGraphic(10, 10, FlxColor.RED);
		//player.makeGraphic(10, 12, Color);
		maxVelocity.set(100, 200);
		acceleration.y = 800;
		drag.x = maxVelocity.x * 10;
		//man kod qoshdim
	}
	
	private function movement() {
		var up:Bool;
		var down:Bool;
		var right:Bool;
		var left:Bool;
		
		up = FlxG.keys.anyPressed([UP]);
		down = FlxG.keys.anyPressed([DOWN]);
		right = FlxG.keys.anyPressed([RIGHT]);
		left = FlxG.keys.anyPressed([LEFT]);
		
		
		if(up && down) {
			up = down = false;
		}
		
		if(left && right) {
			left = right = false;
		}
		
		if (up || down || right || left) {
			//drag.x = drag.y = 1600;
			var mA:Float = 0;
			 if (up && isTouching(FlxObject.FLOOR))
			 {
				 //mA = 90;
				 velocity.y -= maxVelocity.y / 1.5;
				 /*
				 if (left)
					mA -= 45;
				 else if (right)
					mA += 45; */
			 }
			 else if (down)
			 {
				 mA = 90;
				 if (left)
					mA += 45;
				 else if (right)
					mA -= 45;
			 }
			 else if (left) {
				//mA = 180;
				acceleration.x = -maxVelocity.x * 4;
			 } else if (right) {
				//mA = 0;
				velocity.y -= maxVelocity.y / 1.5;
			 }
				 
			
				// velocity.set(speed, 0);
				// velocity.rotate(FlxPoint.weak(0, 0), mA);
			
		} 
	} // movement function
	
	override public function update(elapsed:Float):Void 
	{
		//acceleration.x = 0;
		//movement();
		
		FlxG.collide();
		
		// Player 1 controls
		acceleration.x = 0;
		
		if (FlxG.keys.pressed.LEFT)
		{
			acceleration.x = -maxVelocity.x * 7;
		}
		
		if (FlxG.keys.pressed.RIGHT)
		{
			acceleration.x = maxVelocity.x * 7;
		}
		
		if (FlxG.keys.justPressed.UP && isTouching(FlxObject.FLOOR))
		{
			velocity.y -= maxVelocity.y;
			velocity.y -= maxVelocity.y;
			
		}
		
		if (FlxG.keys.justPressed.SPACE)
		{
		
			var bullet:FlxSprite = cast(cast(FlxG.state, PlayState).playerBullets.recycle(), FlxSprite);
			bullet.reset(x + width/2 - bullet.width/2, y);
			//bullet.velocity.y = -140;
			bullet.velocity.x = 140;
			if(bullet.isTouching(FlxObject.ANY)) {
				bullet.destroy();
			}
 		}
		super.update(elapsed);
	}
	
	
}