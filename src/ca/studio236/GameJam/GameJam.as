package ca.studio236.GameJam
{
	import org.flixel.*; //Allows you to refer to flixel objects in your code
	[SWF(width="640", height="480", backgroundColor="#000000")] //Set the size and color of the Flash file
	
	public class GameJam extends FlxGame
	{
		public function GameJam()
		{
			super(640,480,PlayState); //Create a new FlxGame object and load "PlayState"
		}
	}
}