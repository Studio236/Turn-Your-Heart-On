package ca.studio236.GameJam
{
	import org.flixel.FlxText;
	
	public class Pointblast extends FlxText
	{
		private var i;
		
		public function Pointblast(e:Enemy,s:Scoreboard)
		{
			i = e.pointValue;
			s._score += e.pointValue;
			super(e.x, e.y, 100, e.pointValue.toString());
		}
		
		override public function update():void {
			
			this.y++;
			this.angle++;
			this.alpha -= 1.0/(i/20);
			
			if(this._alpha < 0)
				this.destroy();
			
		}
	}
}