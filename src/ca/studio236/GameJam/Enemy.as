package ca.studio236.GameJam
{
	import org.flixel.*;
	
	public class Enemy extends FlxSprite
	{
		public var pointValue:int;
		public var _character:HeartBoy;
		public var _path:FlxPath;
		public var _speed:int;
		
		public function Enemy(character:HeartBoy, speed:int, X:Number=0, Y:Number=0, SimpleGraphic:Class=null)
		{
			
			_speed = speed;
			_character = character;
			super(X, Y, SimpleGraphic);
		}
		
		override public function update():void
		{
			var cx = this.x - _character.x;
			var cy = this.y - _character.y;
			
			var radians = Math.atan2(cx,cy);
			
			this.velocity.x = -Math.sin(radians)*_speed;
			this.velocity.y = -Math.cos(radians)*_speed;
		}
		
	}
}