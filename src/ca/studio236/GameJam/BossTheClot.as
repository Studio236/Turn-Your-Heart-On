package ca.studio236.GameJam
{
	import org.flixel.*;
	
	public class BossTheClot extends Enemy
	{
		
		[Embed(source='../../../../assets/TheClot.png')]
		public var graphic:Class;
		public var shoot = 0;
		public var shootTimer = 500;
		public var bossstate = "in_top";
		public var blobs = new FlxGroup();
		
		[Embed(source='../../../../assets/sounds/PlaqueDaddy_Shoot.mp3')]
		private var seShoot:Class;
		
		[Embed(source='../../../../assets/sounds/TheClot_Death.mp3')]
		private var seDeath:Class;
		
		[Embed(source='../../../../assets/sounds/Boss.mp3')]
		private var seSong:Class;
		
		[Embed(source='../../../../assets/sounds/Laugh.mp3')]
		private var seLaugh:Class;
		
		[Embed(source='../../../../assets/sounds/ManStones.mp3')]
		public var seSongOriginal:Class;
		
		public function BossTheClot(bullets:FlxGroup, character:HeartBoy, speed:int, X:Number=0, Y:Number=0, SimpleGraphic:Class=null)
		{
			FlxG.playMusic(seSong);	
			FlxG.play(seLaugh);
			super(character, speed, 0, -100, graphic);
			this.health = 1000;
			this.pointValue = 50000;
			this.blobs = bullets;
			this.immovable = true;
			this.getNextDirection();
		}
		
		public function getNextDirection() {
			var r = Math.random();
			
			if(r < 0.50) {
				bossstate = "in_top";
				this.y = -100;
				shootTimer = 100;
				this.angle = -180;
			}if(r >= 0.50) {
				bossstate = "in_bottom";
				this.y = FlxG.height + 100;
				shootTimer = 100;
				this.angle = 0;
			}
		}
		
		
		override public function kill():void{
			FlxG.flash(0xffff0000, 2);
			FlxG.shake(0.05, 1.5);
			PlayState.boss = false;
			FlxG.playMusic(seSongOriginal);	
			FlxG.play(seDeath);
			super.kill();
		}
		
		
		override public function update():void {
			
			shoot++;
			if(bossstate == "in_top") {
				if(y < 0) {
					y++;
				}else{
					bossstate = "shoot_top";
				}
				
			}else if(bossstate == "shoot_top") {
				shootTimer--;
				if(shootTimer <= 0) {
					bossstate = "back_top";
				}else
					if(shoot % 5 == 0) {
						blobs.add(new Blob(50,10,(Math.sin(shoot/1000)*90) + 180));
						blobs.add(new Blob(FlxG.width -50,10,(Math.sin(shoot/1000)*90) + 180));
						shootTimer--;
						FlxG.play(seShoot);
					}
			}else if(bossstate == "back_top") {
				if(this.y > -100) {
					y--;
				}else{
					bossstate = "ready";
				}
			}
			
			
			
			if(bossstate == "in_bottom") {
				if(y > FlxG.height - 100) {
					y--;
				}else{
					bossstate = "shoot_bottom";
				}
				
			}else if(bossstate == "shoot_bottom") {
				shootTimer--;
				if(shootTimer <= 0) {
					bossstate = "back_bottom";
				}else
					if(shoot % 5 == 0) {
						blobs.add(new Blob(50,FlxG.height - 10,(Math.sin(shoot/1000)*90)));
						blobs.add(new Blob(FlxG.width -50,FlxG.height - 10,(Math.sin(shoot/1000)*90)));
						shootTimer--;
						FlxG.play(seShoot);
					}
			}else if(bossstate == "back_bottom") {
				if(this.y < FlxG.height + 100) {
					y++;
				}else{
					bossstate = "ready";
				}
			}
			
			if(bossstate == 'ready') {
				this.getNextDirection();
			}
			
			
		}
		
		
	}
}