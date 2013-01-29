package ca.studio236.GameJam
{
	import org.flixel.*; //Allows you to refer to flixel objects in your code
	
	[SWF(width="955", height="650", backgroundColor="#000000")] //Set the size and color of the Flash file
	[Frame(factoryClass="ca.studio236.GameJam.Preloader")]
	public class GameJam extends FlxGame
	{
		public function GameJam()
		{
			super(480,320,MenuState,2); //Create a new FlxGame object and load "PlayState"
		}
	}
}