package ca.studio236.GameJam
{
	import org.flixel.FlxText;
	
	public class Scoreboard extends FlxText
	{
		public var _score:int;	
		public var multiplier = 1;
		public function Scoreboard(X:Number, Y:Number, Width:uint, Text:String=null, EmbeddedFont:Boolean=true)
		{
			_score = 0;
			Text = _score.toString();
			super(X, Y, Width, Text, EmbeddedFont);
		}
		
		public function score() {
			
			
		}
		
		override public function update():void {
			this.text = _score.toString();
			super.update();
		}
	}
}