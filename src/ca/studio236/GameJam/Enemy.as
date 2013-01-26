package ca.studio236.GameJam
{
	import org.flixel.FlxSprite;
	
	public class Enemy extends FlxSprite
	{
		public var pointValue:int;
		
		public function Enemy(X:Number=0, Y:Number=0, SimpleGraphic:Class=null, pointValue:int=100)
		{
			super(X, Y, SimpleGraphic);
		}
	
		
	}
}