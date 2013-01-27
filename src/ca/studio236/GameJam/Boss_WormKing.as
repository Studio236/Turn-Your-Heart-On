package ca.studio236.GameJam
{
	public class Boss_WormKing extends Enemy
	{
		public function Boss_WormKing(character:HeartBoy, speed:int, X:Number=0, Y:Number=0, SimpleGraphic:Class=null)
		{
			super(character, speed, X, Y, SimpleGraphic);
			this.health = 300;
			this.pointValue = 50000;
		}
	}
}