package ca.studio236.GameJam
{
	import org.flixel.*; //Allows you to refer to flixel objects in your code
	[SWF(width="960", height="650", backgroundColor="#FFFFFFF")] //Set the size and color of the Flash file
	
	public class GameJam extends FlxGame
	{
		public function GameJam()
		{
			super(480,320,PlayState,2); //Create a new FlxGame object and load "PlayState"
		}
	}
}