package ca.studio236.GameJam
{
	import org.flixel.*;
	
	public class CholDerb extends Enemy
	{
		[Embed(source="../../../../assets/DerpCholesterol.png")]
		public var graphic:Class;
		[Embed(source='../../../../assets/sounds/Derp_Death.mp3')]
		private var se:Class;
		
		public function CholDerb(character:HeartBoy, speed:int, X:Number=0, Y:Number=0, SimpleGraphic:Class=null)
		{
			speed = 5;
			super(character, speed, X, Y);
			this.health = 500;
			this.pointValue = 50000;
			this.loadGraphic(graphic,true,false,128,128);
			this.addAnimation("mouth",[0,1],4);
			this.play("mouth");
		}
		
		override public function kill():void{
			FlxG.play(se);
			super.kill();
		}
	}
}