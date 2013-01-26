package ca.studio236.GameJam
{
	public class HeartWorm extends Enemy
	{
		[Embed(source="../../../../assets/HeartWormHead.png")]
		public var graphic1:Class;	
		
		[Embed(source="../../../../assets/HeartWormBody.png")]
		public var graphic2:Class;	
		
		public var growth:int;
		
		public function HeartWorm(character:HeartBoy, speed:int, X:Number=0, Y:Number=0, SimpleGraphic:Class=null)
		{
			speed = 20;
			super(character, speed, X, Y, graphic1);
			this.health = 15;
			this.pointValue = 2500;
			growth = 0;
			this.immovable = true;
		}
		
		override public function update():void
		{
			growth++;
			this.x += Math.sin(growth/2)*30 + (Math.random()*100 - 50);
			this.y += Math.sin(growth/2)*30 + (Math.random()*100 - 50);
		}
	}
}