package ca.studio236.GameJam
{	
	import org.flixel.*;
	
	public class MenuState extends FlxState
	{
		override public function create():void
		{		
		}
		
		public function goToGame(){
			FlxG.switchState(new PlayState);
		}
		
		override public function update():void
		{
			if(FlxG.keys.B) {
				goToGame();
			}
		}
		
	}
}