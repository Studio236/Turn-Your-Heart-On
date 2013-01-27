package ca.studio236.GameJam
{
	public class CholDerb extends Enemy
	{
		[Embed(source="../../../../assets/DerpCholesterol.png")]
		public var graphic:Class;
		
		public function CholDerb(character:HeartBoy, speed:int, X:Number=0, Y:Number=0, SimpleGraphic:Class=null)
		{
			speed = 5;
			super(character, speed, X, Y, graphic);
			this.health = 500;
			this.pointValue = 10000;
		}
	}
}