package ca.studio236.GameJam
{
	public class CholSmall extends Enemy
	{
		[Embed(source="../../../../assets/CholSmall.png")]
		public var graphic:Class;
		
		public function CholSmall(character:HeartBoy, speed:int, X:Number=0, Y:Number=0, SimpleGraphic:Class=null)
		{
			speed = 25;
			super(character, speed, X, Y, graphic);
			this.health = 20;
			this.pointValue = 2000;
			this.angle = Math.random() * 360;
		}
		
		override public function update():void
		{
			this.angle += 1;
			
			super.update();
		}
	}
}