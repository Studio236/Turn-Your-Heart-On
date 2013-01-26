package ca.studio236.GameJam
{
	import org.flixel.*;
	
	public class Plaque extends Enemy
	{
		
		[Embed(source="../../../../assets/plaque.png")]
		public var graphic:Class;	
			
		public var time:Number = 100;
		public function Plaque(character:HeartBoy, X:Number=0, Y:Number=0, SimpleGraphic:Class=null, pointValue:int=100 )
		{
			super(character, 100, X, Y, graphic);
			_character = character;
			this.solid = false;
		}
		
		override public function update():void {
			
			var cx = _character.x - (this.x + 8);
			var cy = _character.y - (this.y + 8);
			
			var radians = Math.atan2(cx,cy);
			
			var degrees = (radians * 180 / Math.PI);
			
			this.angle = -degrees + 180;
			
			time+= FlxG.elapsed;
			
			this.acceleration.x = Math.sin(time/2)*30;
			this.acceleration.y = Math.cos(time/2)*30;
			
			super.update();
			
		}
	}
}