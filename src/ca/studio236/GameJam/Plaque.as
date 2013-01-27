package ca.studio236.GameJam
{
	import org.flixel.*;
	
	public class Plaque extends Enemy
	{
		
		[Embed(source="../../../../assets/plaque.png")]
		public var graphic:Class;	
		[Embed(source='../../../../assets/sounds/Plaque_Death.mp3')]
		private var se:Class;
			
		public var time:Number = 100;
		public function Plaque(character:HeartBoy, X:Number=0, Y:Number=0, SimpleGraphic:Class=null)
		{
			super(character, 100, X, Y, graphic);
			this.health = 5;
			this.pointValue = 1500;
			_character = character;
			
		}
		
		override public function update():void {
			
			var cx = _character.x - (this.x + 8);
			var cy = _character.y - (this.y + 8);
			
			var radians = Math.atan2(cx,cy);
			
			var degrees = (radians * 180 / Math.PI);
			
			this.angle = -degrees + 180;
			
			time++;
			
			this.x += Math.sin(time/20);
			this.y += Math.cos(time/20);
			
			super.update();
			
		}
		
		override public function kill():void{
			FlxG.play(se);
			super.kill();
		}
	}
}