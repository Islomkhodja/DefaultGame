package;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.util.FlxColor;
import flixel.tile.FlxTilemap;
import flixel.graphics.FlxGraphic;

class PlayState extends FlxState
{
	private var player1:Player;
	private var player2:Player2;
	private var level:FlxTilemap;
	public var playerBullets:FlxGroup;
	
	override public function create():Void	
	{
		FlxG.mouse.visible = false;
		
		
		var numPlayerBullets:Int = 8;
		
		
		playerBullets = new FlxGroup(numPlayerBullets);
		var sprite:FlxSprite;
		
		
		
		for (i in 0...numPlayerBullets)
		{
			
			
			sprite = new FlxSprite( -100, -100);
			
			
			sprite.makeGraphic(2, 8);
			sprite.exists = false;
			
			
			playerBullets.add(sprite);
		}
		
		add(playerBullets);
		
		
		FlxG.mouse.visible = false;
		FlxG.cameras.bgColor = FlxColor.WHITE;
		
		level = new FlxTilemap();
		level.loadMapFromCSV(AssetPaths.level__csv, FlxGraphic.fromClass(GraphicAuto), 0, 0, AUTO);
		
		add(level);
		
		
		player1 = new Player(5, 35);
		add(player1);
		
		player2 = new Player2(10, 5);
		add(player2);
		
		addCamera(Std.int(FlxG.height / 2), 0xFFFFCCCC, player1);
		addCamera(0, 0xFFCCCCFF, player2);
		
		super.create();
	}
	
	private function addCamera(Y:Int, Color:Int, Follow:FlxSprite)
	{
		var camera:FlxCamera = new FlxCamera(0, Y, FlxG.width, Std.int(FlxG.height / 2));
		camera.setScrollBoundsRect(0, 0, level.width, FlxG.height);
		camera.bgColor = Color;
		camera.follow(Follow);
		FlxG.cameras.add(camera);
	}
	// lol

	override public function update(elapsed:Float):Void
	{
		FlxG.collide();
		
		super.update(elapsed);
	}
}
