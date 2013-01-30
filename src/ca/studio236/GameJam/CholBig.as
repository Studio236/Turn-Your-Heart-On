package ca.studio236.GameJam
{	
	import org.flixel.*;
	public class CholBig extends Enemy
	{
		[Embed(source="../../../../assets/CholBig.png")]
		public var graphic:Class;
		[Embed(source='../../../../assets/sounds/CholBig_Death.mp3')]
		private var se:Class;
		
		public function CholBig(character:HeartBoy, speed:int, X:Number=0, Y:Number=0, SimpleGraphic:Class=null)
		{
			speed = 15;
			super(character, speed, X, Y, graphic);
			this.health = 40;
			this.pointValue = 3000;
			this.angle = Math.random() * 360;
		}
		
		override public function update():void
		{
			this.angle += 1;
			
			super.update();
		}
		
		override public function kill():void{
			FlxG.play(se);
			super.kill();
		}
	}
}