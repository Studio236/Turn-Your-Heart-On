package ca.studio236.GameJam
{
	import org.flixel.FlxText;
	
	public class PowerUpBlast extends FlxText
	{
		public function PowerUpBlast(X:Number, Y:Number, Width:uint, Text:String=null, EmbeddedFont:Boolean=true)
		{
			super(X, Y, Width, Text, EmbeddedFont);
		}
		
		override public function update():void {
			
			this.y--;
			this.angle++;
			this.alpha -= 0.01;
			
			if(this._alpha < 0)
				this.destroy();
			
		}
	}
}