package ca.studio236.GameJam
{
	public class Boss_Girlfriend extends Enemy
	{
		public function Boss_Girlfriend(character:HeartBoy, speed:int, X:Number=0, Y:Number=0, SimpleGraphic:Class=null)
		{
			super(character, speed, X, Y, SimpleGraphic);
			this.health = 750;
			this.pointValue = 150000;
		}
	}
}