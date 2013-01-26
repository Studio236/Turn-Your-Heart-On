package ca.studio236.GameJam
{
	import org.flixel.*;
	
	public class Spray extends FlxSprite
	{
		private var age:Number = 70;
		private var ref:FlxGroup;
		
		public function Spray(groupRef:FlxGroup, X:Number=0, Y:Number=0, direction:Number = 0, SimpleGraphic:Class=null)
		{
			super(X+8,Y+8);
			ref = groupRef;
			this.makeGraphic(5,5,0xFFFF0000);
			direction -= 90;
			this.velocity.y = Math.sin(direction*0.01745)*200 + Math.random()*5;
			this.velocity.x = Math.cos(direction*0.01745)*200 + Math.random()*5;
		}
		
		override public function update():void {
			age--;
			if(age < 0){
				this.kill();
				this.destroy();
				ref.remove(this,true);
			}
			if(this.isTouching(ANY)){
				this.kill();
				this.destroy();
				ref.remove(this,true);
			}
			if(this.x > FlxG.width || this.x < 0 || this.y > FlxG.height || this.y < 0) {
				this.kill();
				this.destroy();
				ref.remove(this,true);
			}
			super.update();
			
			
		}
	}
}