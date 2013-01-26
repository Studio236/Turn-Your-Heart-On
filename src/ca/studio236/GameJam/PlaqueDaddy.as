package ca.studio236.GameJam
{
	public class PlaqueDaddy extends Enemy
	{
		public function PlaqueDaddy(character:HeartBoy, speed:int, X:Number=0, Y:Number=0, SimpleGraphic:Class=null)
		{
			super(character, speed, X, Y, SimpleGraphic);
			this.health = 15;
			this.pointValue = 3000;
		}
	}
}