package ca.studio236.GameJam
{
	import org.flixel.FlxPoint;

	public class PlaqueDaddy extends Enemy
	{
		[Embed(source="../../../../assets/plaquedaddy.png")]
		private var graphic:Class;
		
		private var target:FlxPoint;
		
		private var time = 0;
		
		public function PlaqueDaddy(character:HeartBoy, speed:int, X:Number=0, Y:Number=0, SimpleGraphic:Class=null)
		{
			super(character, speed, X, Y, SimpleGraphic);
			this.health = 100;
			target = new FlxPoint(X,Y);
			this.pointValue = 3000;
			this.loadGraphic(graphic,true);
			this.addAnimation("main",[0,1],3);
			this.play("main");
			this.immovable = true;
		}
		
		override public function update():void {
			time++;
			target.x += (_character.x - target.x  )*0.01;
			target.y += (_character.y - target.y)*0.01;
			
			this.x = Math.cos(time/100)*150 + target.x;
			this.y = Math.sin(time/100)*150 + target.y;
			
			if(time % 100 == 0) {
				
			}
		}
	}
}