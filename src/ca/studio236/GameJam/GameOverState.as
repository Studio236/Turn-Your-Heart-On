package ca.studio236.GameJam
{
	import org.flixel.FlxG;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.flixel.FlxSprite;

	public class GameOverState extends FlxState
	{
		public var t_playAgain:FlxText;
		
		[Embed(source="../../../../assets/end.png")]
		public var backgroundImage:Class;
		[Embed(source='../../../../assets/sounds/GetYourHeartOn.mp3')]
		private var se:Class;
		
		public var t_gameover:FlxText;
		
		public var background:FlxSprite = new FlxSprite(0,0,null);
		
		override public function create():void
		{
			FlxG.playMusic(se);
			FlxG.mouse.show();
			
			
			t_gameover = new FlxText(250, 25, 300, "GAME OVER");
			t_gameover.size = 30;
			
			t_playAgain = new FlxText(FlxG.width/2 - 40, FlxG.height/1.2,120,"Press 'R' to Replay"); // translate and set text
			
			background.loadGraphic(backgroundImage,true,false,480,320);
			background.addAnimation("walk",[0,1],4);
			background.play("walk");
			
			add(background);
			add(t_playAgain); // add text
			add(t_gameover);
		}
		
		public function goToGame(){
			FlxG.switchState(new PlayState); // switch states
		}

		
		override public function update():void
		{
			// on keypress
			if(FlxG.keys.R) {
				goToGame(); // call goToGame() : loads game
			}
			super.update();

		}
		

	}
}