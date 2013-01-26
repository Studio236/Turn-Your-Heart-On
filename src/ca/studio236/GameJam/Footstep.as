package ca.studio236.GameJam
{
	import org.flixel.*;

	public class Footstep extends FlxSprite
	{
		public function Footstep(x=0, y=0)
		{
			super(x, y);
			this.makeGraphic(10,10,0xffff0000);
		}
		
		override public function update():void
		{
			this.alpha -= 0.03;
			if(this.alpha < 0)
			{
				this.kill();
				this.destroy();
			}
			
		}
	}
}