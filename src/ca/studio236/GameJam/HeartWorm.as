package ca.studio236.GameJam
{
	public class HeartWorm extends Enemy
	{
		public function HeartWorm(character:HeartBoy, speed:int, X:Number=0, Y:Number=0, SimpleGraphic:Class=null)
		{
			super(character, speed, X, Y, SimpleGraphic);
			this.health = 15;
			this.pointValue = 2500;
		}
	}
}