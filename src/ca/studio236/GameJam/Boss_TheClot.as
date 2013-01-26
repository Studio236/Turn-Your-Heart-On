package ca.studio236.GameJam
{
	public class Boss_TheClot extends Enemy
	{
		public function Boss_TheClot(character:HeartBoy, speed:int, X:Number=0, Y:Number=0, SimpleGraphic:Class=null)
		{
			super(character, speed, X, Y, SimpleGraphic);
			this.health = 2000;
			this.pointValue = 1000000;
		}
	}
}