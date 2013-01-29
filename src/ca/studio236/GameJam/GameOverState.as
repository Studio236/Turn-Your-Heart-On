package ca.studio236.GameJam
{
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;

	public class GameOverState extends FlxState
	{
		public var t_playAgain:FlxText;
		
		[Embed(source="../../../../assets/end.png")]
		public var backgroundImage:Class;
		[Embed(source='../../../../assets/sounds/GetYourHeartOn.mp3')]
		private var se:Class;
		
		public var t_gameover:FlxText;
		public var t_score:FlxText;
		public var t_judgement:FlxText;
		
		public var score:Number;
		
		public var background:FlxSprite = new FlxSprite(0,0,null);
		
		override public function create():void
		{
			FlxG.playMusic(se);
			FlxG.mouse.show();
			
			background.loadGraphic(backgroundImage,true,false,480,320);
			background.addAnimation("walk",[0,1],4);
			background.play("walk");
			
			add(background);
			
			
			
			score = PlayState.finalScore;
			
			t_gameover = new FlxText(250, 15, 300, "GAME OVER");
			t_gameover.size = 30;
			
			add(t_gameover);
			
			t_score = new FlxText(250, 50, 300, "Final Score: " + score.toString());
			t_score.size = 15;
			
			if(score > 1000000){
				t_judgement = new FlxText(250, 72, 300, "RANK: ARTERIAS GOD OF BLOOD");
			}else if(score > 500000){
				t_judgement = new FlxText(250, 72, 300, "RANK: LORD OF THE LYMPHOS");
			}else if(score>400000){
				t_judgement = new FlxText(250, 72, 300, "RANK: MAJOR METABOLIC");
			}else if(score>300000){
				t_judgement = new FlxText(250, 72, 300, "RANK: CAPTAIN CRENATION");
			}else if(score>200000){
				t_judgement = new FlxText(250, 72, 300, "RANK: LIEUTENANT LIPID");
			}else if(score>100000){
				t_judgement = new FlxText(250, 72, 300, "RANK: SERGEANT SEPSIS");
			}else if(score>50000){
				t_judgement = new FlxText(250, 72, 300, "RANK: CORPORAL CARDIO");
			}else if(score>20000){
				t_judgement = new FlxText(250, 72, 300, "RANK: PRIVATE PULMONARY");
			}else{
				t_judgement = new FlxText(250, 72, 300, "RANK: N00B");
			}
			
			add(t_judgement);
			
			t_playAgain = new FlxText(FlxG.width/2 - 40, FlxG.height/1.2,120,"Press 'R' to Replay"); // translate and set text
			
			add(t_playAgain); // add text
			
			add(t_score);
			
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