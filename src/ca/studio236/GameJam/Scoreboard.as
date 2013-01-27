package ca.studio236.GameJam
{
	import org.flixel.FlxText;
	
	public class Scoreboard extends FlxText
	{
		public var scoreDisplay = 0;
		public var _score:int;	
		public var multiplier = 1;
		public var multiplierTimeout = 0;
		public function Scoreboard(X:Number, Y:Number, Width:uint, Text:String=null, EmbeddedFont:Boolean=true)
		{
			_score = 0;
			Text = scoreDisplay.toString();
			super(X, Y, Width, Text, EmbeddedFont);
		}
		
		public function score(i:Number):Number {
			
			_score += i*multiplier;
			multiplier ++;
			//some popup
			
			multiplierTimeout = 60;
			
			return i * multiplier;
			
			
		}
		
		override public function update():void {
			this.text = scoreDisplay.toString();
			if(scoreDisplay < _score) {
				scoreDisplay += 100;
			}
			
			if(multiplierTimeout > 0) {
				multiplierTimeout--;
			}else if( multiplierTimeout <= 0 ){
				multiplier = 1;
			}
			
			
			super.update();
		}
	}
}