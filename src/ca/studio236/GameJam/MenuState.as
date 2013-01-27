package ca.studio236.GameJam
{	
	import flash.geom.Rectangle;
	
	import org.flixel.*;
	
	public class MenuState extends FlxState
	{
		[Embed(source="../../../../assets/title.png")]
		public var backgroundImage:Class;
		[Embed(source='../../../../assets/sounds/GetYourHeartOn.mp3')]
		private var se:Class;
		[Embed(source = '../../../../assets/ch2.png')] 
		public var targetPNG:Class;
		
		public var background:FlxSprite = new FlxSprite(0,0,null);
			
		// cursor image
		//[Embed(source = '../../../../assets/TargetCursor.png')] 2
		//public var targetPNG:Class;
		
		// start button text
		public var t_start:FlxText;
		public var t_start_controls:FlxText;
		public var t_title:FlxText;
		private var transitionStarted:Boolean = false;
		
		override public function create():void
		{
			FlxG.mouse.show();
			background.loadGraphic(backgroundImage,true,false,480,320);
			background.addAnimation("walk",[0,0,0,0,0,1,1,1,0,0,2,2,2,2,2,0,0,0,0,0,2,2,3,3,3,3,3,0,0,1,1,1,1,3,3,3,3,3,0,2,3],10);
			background.play("walk");
			
			FlxG.playMusic(se);
			FlxG.mouse.show(targetPNG);
			
			t_title = new FlxText(250, 10, 300, "Turn Your   Heart-On");
			t_title.size = 30;
			
			t_start = new FlxText(FlxG.width/2 - 60, FlxG.height/1.2,120,"Press Any Key to Play"); // translate and set text
			t_start_controls = new FlxText(FlxG.width/2 - 100, FlxG.height/1.2+25,300,"Move - WASD          Shoot & Aim - Mouse"); // translate and set text
			add(background);
			add(t_title);
			add(t_start); // add text
			add(t_start_controls);
		}
		
		// function to swap between menu and game
		public function goToGame(){
			
			transitionStarted = true;
			//FlxG.switchState(new PlayState); // switch states
		}
		
		override public function update():void
		{
			super.update();
			
			if(FlxG.keys.any() && !transitionStarted ){
					goToGame(); // call goToGame() : loads game	
			}
				
			if(transitionStarted){
				FlxG.camera.zoom+=0.1
				FlxG.camera.x += (-1800 - FlxG.camera.x)*0.01;
				FlxG.camera.y += (-300 - FlxG.camera.y)*0.01;
			}
			
			if(FlxG.camera.zoom > 9.8) {
				background.alpha -= 0.03
			}
			
			if(background.alpha <= 0) {
				//change
				FlxG.switchState(new PlayState);
			}	
				
		}	
		
	}
}