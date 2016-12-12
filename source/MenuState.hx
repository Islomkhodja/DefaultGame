package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.util.FlxAxes;
import flixel.util.FlxColor;
class MenuState extends FlxState
{
	private var playButton:FlxButton;
	private var optionButton:FlxButton;
	private var bg:FlxSprite;
	
	override public function create():Void
	{
		FlxG.camera.bgColor = 0x000fff;
		FlxG.cameras.flash(FlxColor.BLACK, 4);
		/*
		bg = new FlxSprite(0, 0, AssetPaths.BrokenNose__jpg);
		add(bg);
		bg  = new FlxSprite(FlxG.width/2, 0, AssetPaths.BrokenNose__jpg);
		add(bg);
		*/
		playButton = new FlxButton(FlxG.width/2 - 50, FlxG.height/2 - 50, "Start", playGame);
		playButton.setSize(100, 50);
		add(playButton);
		
		optionButton = new FlxButton(FlxG.width/2 - 50, FlxG.height/2, "Option", optionGame);
		optionButton.setSize(100, 50);
		add(optionButton);
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
	
	private function playGame() {
		FlxG.switchState(new PlayState());
		
	}
	
	private function optionGame() {
		FlxG.switchState(new OptionState());
	}
}
