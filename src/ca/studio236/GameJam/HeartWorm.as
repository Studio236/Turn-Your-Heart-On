package ca.studio236.GameJam
{
	import org.flixel.*;


	public class HeartWorm extends Enemy
	{
		[Embed(source="../../../../assets/WormHead.png")]
		public var graphic1:Class;	
		
		[Embed(source="../../../../assets/HeartWormBody.png")]
		public var graphic2:Class;	
		
		[Embed(source="../../../../assets/particle.png")]
		private var particle:Class;
		
		public var time:int;
		
		public var target:FlxPoint = new FlxPoint(0,0);
		
		public var worm:FlxGroup = new FlxGroup();
		
		public function HeartWorm(character:HeartBoy, speed:int, X:Number=0, Y:Number=0, SimpleGraphic:Class=null)
		{
			target.make(X,Y);
			speed = 20;
			super(character, speed, X, Y);
			this.loadGraphic(graphic1,true);
			this.addAnimation('idle',[0,1],3);
			this.play('idle');
			this.health = 15;
			this.pointValue = 2500;
			time = 0;
			this.immovable = true;
			
			for(var i = 0; i < 7; i++) {
				worm.add(new FlxSprite(X,Y,graphic2));
			}
			
			FlxG.state.add(worm);
			
		}
		
		override public function update():void
		{
			time++;
			target.x += (_character.x - target.x )*0.01;
			target.y += (_character.y - target.y)*0.01;
			
			
			if(this.alive) {
			this.x = Math.cos(time/20)*50 + target.x;
			this.y = Math.sin(time/20)*50 + target.y;
			
			worm.members[worm.length -1].x += (this.x - worm.members[worm.length -1].x)*0.1;
			worm.members[worm.length -1].y += (this.y - worm.members[worm.length -1].y)*0.1;

			var cx = _character.x - (this.x + 8);
			var cy = _character.y - (this.y + 8);
			
			var radians = Math.atan2(cx,cy);
			
			var degrees = (radians * 180 / Math.PI);
			
			this.angle = -degrees + 180;
			for(var i = worm.length-2; i >= 0; i--) {
				worm.members[i].x += (worm.members[i+1].x - worm.members[i].x)*0.1;
				worm.members[i].y += (worm.members[i+1].y - worm.members[i].y)*0.1;
			}
			}else{
				for(var i = 0; i < 8; i++) {
					worm.members[i].velocity.y = 400;
				}
			}
			
		}
		
		override public function kill():void {
			
			
			for(var i = 0; i < 7; i++) {
				
				worm.members[i].kill();
				worm.members[i].destroy();
				worm.remove(worm.members[i]);
				
				
			}
			FlxG.state.remove(worm);
			super.kill();
		}
	}
}