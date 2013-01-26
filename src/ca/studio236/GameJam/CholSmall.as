package ca.studio236.GameJam
{
	public class CholSmall extends Enemy
	{
		public function CholSmall(character:HeartBoy, speed:int, X:Number=0, Y:Number=0, SimpleGraphic:Class=null)
		{
			super(character, speed, X, Y, SimpleGraphic);
			this.health = 10;
			this.pointValue = 1000;
		}
	}
}