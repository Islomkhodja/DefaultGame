package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;

/**
 * ...
 * @author Islomkhodja
 */
class OptionState extends FlxState
{
	private var backButton:FlxButton;
	
	override public function create():Void	
	{
		backButton = new FlxButton(0, 0, "Back", backFunction);
		backButton.setSize(100, 50);
		add(backButton);
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		
		super.update(elapsed);
	}
	
	private function backFunction() {
		FlxG.switchState(new MenuState());
	}
}