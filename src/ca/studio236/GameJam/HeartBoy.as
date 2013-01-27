package ca.studio236.GameJam
{
	import org.flixel.*;
	
	public class HeartBoy extends FlxSprite
	{
		[Embed(source="../../../../assets/Heart_Character.png")]
		public var graphic:Class;

		
		private static const PLAYER_ACCEL = 250;
		
		public function HeartBoy()
		{
			super(300, 300);
			this.solid = true;
			this.loadGraphic(graphic,true,false,32,32);
			this.addAnimation("walk",[0,1,2,3],10);
			this.maxVelocity.x = PLAYER_ACCEL;
			this.maxVelocity.y = PLAYER_ACCEL;
			this.drag.x = 200;
			this.drag.y = 200;
			this.health = 3;
			this.play("walk");
		}
		
		override public function update():void {
			
			
			
			var cx = FlxG.mouse.screenX - (this.x + 16);
			var cy = FlxG.mouse.screenY - (this.y + 16);
			
			var radians = Math.atan2(cx,cy);
			
			var degrees = (radians * 180 / Math.PI);
			
			this.angle = -degrees + 180;
			
			this.acceleration.y = 0;
			this.acceleration.x = 0;
			if(FlxG.keys.A) {
				this.acceleration.x = -(PLAYER_ACCEL + 300) ;
			}
			if(FlxG.keys.W) {
				this.acceleration.y = -(PLAYER_ACCEL + 300);
			}
			if(FlxG.keys.D) {
				this.acceleration.x = PLAYER_ACCEL + 300;
			}
			if(FlxG.keys.S) {
				this.acceleration.y = PLAYER_ACCEL + 300;
			}
			
			if(this.x + 32 > FlxG.width) {
				this.x = FlxG.width -32
			}
			if(this.x < 0) {
				this.x = 0;
			}
			
			if(this.y + 32 > FlxG.height) {
				this.y = FlxG.height-32;
			}
			if(this.y < 0) {
				this.y = 0;
			}
			
			
			super.update();
			
		}
		
	}
}