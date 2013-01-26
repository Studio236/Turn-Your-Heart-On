package ca.studio236.GameJam
{
	public class CholBig extends Enemy
	{
		public function CholBig(character:HeartBoy, speed:int, X:Number=0, Y:Number=0, SimpleGraphic:Class=null)
		{
			super(character, speed, X, Y, SimpleGraphic);
			this.health = 20;
			this.pointValue = 2500;
		}
	}
}