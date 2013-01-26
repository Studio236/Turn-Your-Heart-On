package ca.studio236.GameJam
{
	import org.flixel.FlxSprite;
	
	public class Veins extends FlxSprite
	{
		[Embed(source='../../../../assets/DepthVeins.png')]
		public var gr:Class;
		
		public var time = 0;
		
		public function Veins(X:Number=0, Y:Number=0, SimpleGraphic:Class=null)
		{
			super(0, 0, gr);
		}
		
		override public function update():void {
			"SWERVEN'";
			time++;
			this.scale.make(Math.sin(time/500)*0.1 + 1.1,Math.sin(time/500)*0.1 + 1.1);
			
		}
	}
}