package ca.studio236.GameJam
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	
	public class PlayState extends FlxState
	{
		[Embed(source = "../../../../assets/blankTileCsv", mimeType = "application/octet-stream")]
		public var mapString:Class;
		
		[Embed(source="../../../../assets/4SideTiles.png")]
		private var tilegraphic:Class;
		
		[Embed(source="../../../../assets/particle.png")]
		private var particle:Class;
		
		[Embed(source='../../../../assets/Backdrop.png')]
		public var bg:Class;
		
		[Embed(source='../../../../assets/sounds/ManStones.mp3')]
		public var gameplayMusic:Class;
		
		[Embed(source='../../../../assets/sounds/Player_Death.mp3')]
		private var hbDeath:Class;
		
		[Embed(source='../../../../assets/sounds/Player_Collide.mp3')]
		private var hbCollide:Class;
		
		[Embed(source='../../../../assets/sounds/MaxHealth.mp3')]
		private var seHealth:Class;
		
		public var gpMusic:FlxSound;
		
		private var tilemap:FlxTilemap;
		
		public var character:HeartBoy = new HeartBoy();
		
		private var entities:FlxGroup = new FlxGroup();
		
		private var enemies:FlxGroup = new FlxGroup();
		
		private var bullets:FlxGroup = new FlxGroup();
		
		private var sparay:FlxGroup = new FlxGroup();
		
		private var footsteps:FlxGroup = new FlxGroup();
		
		private var emitter:FlxEmitter = new FlxEmitter(100,100);
		
		public var endTimer:FlxTimer = new FlxTimer();
		
		public var spawner:Spawner;
		
		public static var boss = false;
		
		public static var finalScore:Number;
		
		public var score:Scoreboard = new Scoreboard(5,FlxG.height - 20,100);
		
		public var health:FlxText;
		public var hud = new FlxGroup();
		private var powerup:Powerup;
		private var _PowerUpRandomizer:int;
		public var Bypass:int;
		public var BypassTimer:Number;
		
		override public function create():void
		{
			
			add(new FlxSprite(0,0,bg));
			_PowerUpRandomizer = Math.floor(Math.random()*6);
			powerup = new Powerup(_PowerUpRandomizer,Math.random()*FlxG.width,Math.random()*FlxG.height);
			entities.add(powerup);
			Bypass = -1;
			BypassTimer = -1;
			//loads the crosshair
			FlxG.playMusic(gameplayMusic);
			prepTileMap();
			add(footsteps);
			sparay.maxSize = 200;
			entities.add(sparay);
			entities.add(character);
			entities.add(enemies);
			add(entities);
			add(emitter);
			add(bullets);
			add(new Veins());
			add(hud);
			add(score);
			
			health = new FlxText(FlxG.width - 60, FlxG.height - 20,100,"<3 <3 <3");
			add(health);
			
			
			spawner = new Spawner(character,enemies,score,bullets,hud);
		}
		
		public function prepTileMap() {

			tilemap = new FlxTilemap();
			tilemap.loadMap(new mapString, tilegraphic,32 ,32);
			
			this.add(tilemap);
			generateNewMap();
			
		}
		
		public function generateNewMap() {
			for(var i = 0; i < 15; i++) {
				for(var j = 0; j < 10; j++) {
					tilemap.setTile(i,j,0);
					var probability = Math.random();
					if(probability < 0.08) {
						if(i*32 <= character.x && (i+1)*32 >= character.x && j*32 <= character.y && (j+1)*32 >= character.y || 
							i*32 <= character.x+16 && (i+1)*32 >= character.x+16 && j*32 <= character.y && (j+1)*32 >= character.y || 
							i*32 <= character.x && (i+1)*32 >= character.x && j*32 <= character.y+16 && (j+1)*32 >= character.y+16 ||
							i*32 <= character.x+16 && (i+1)*32 >= character.x+16 && j*32 <= character.y+16 && (j+1)*32 >= character.y+16){	
						}else{
							tilemap.setTile(i,j,Math.ceil(Math.random()*3));
						}
						
						
					}
				}
			}
		}
		
		override public function update():void {
			
			if(endTimer.finished){
				finalScore = score._score;
				FlxG.switchState(new GameOverState);
			}
			
			if(FlxG.keys.SPACE){
				generateNewMap();
			}
			
			//Dev Add Point Cheat
			if(FlxG.keys.SHIFT && FlxG.keys.PLUS)
			{
				score._score += 1000;
			}
			
			//Dev 1000000 Point Cheat
			if(FlxG.keys.SHIFT && FlxG.keys.M)
			{
				score._score = 1000000;
			}
			
			//Dev Full Health Cheat
			if(FlxG.keys.SHIFT && FlxG.keys.H)
			{
				FlxG.play(seHealth);
				character.health = 3;
				setHealth(3);
			}
			
			if(BypassTimer < 0){
				Bypass = -1;
			}else{
				BypassTimer--;
			}
			
			if(FlxG.mouse.pressed() && character.alive) {
				
				if(Bypass==2){
					//sparay.add(new Spray(sparay,character.x,character.y,character.angle));
					//sparay.add(new Spray(sparay,character.x,character.y,character.angle-180));
					sparay.add(new Spray(sparay,character.x,character.y,character.angle+5));
					sparay.add(new Spray(sparay,character.x,character.y,character.angle-5));
				}else if(Bypass==3){
					//sparay.add(new Spray(sparay,character.x,character.y,character.angle));
					//sparay.add(new Spray(sparay,character.x,character.y,character.angle-120));
					//sparay.add(new Spray(sparay,character.x,character.y,character.angle+120));
					sparay.add(new Spray(sparay,character.x,character.y,character.angle));
					sparay.add(new Spray(sparay,character.x,character.y,character.angle+15));
					sparay.add(new Spray(sparay,character.x,character.y,character.angle-15));
				}else if(Bypass==4){
					//sparay.add(new Spray(sparay,character.x,character.y,character.angle));
					//sparay.add(new Spray(sparay,character.x,character.y,character.angle-90));
					//sparay.add(new Spray(sparay,character.x,character.y,character.angle-180));
					//sparay.add(new Spray(sparay,character.x,character.y,character.angle-270));
					sparay.add(new Spray(sparay,character.x,character.y,character.angle-15));
					sparay.add(new Spray(sparay,character.x,character.y,character.angle-5));
					sparay.add(new Spray(sparay,character.x,character.y,character.angle+5));
					sparay.add(new Spray(sparay,character.x,character.y,character.angle+15));
				}else{
					sparay.add(new Spray(sparay,character.x,character.y,character.angle));
				}
			}
			PowerUpRandomizer();			
			
			if(FlxG.timeScale <= 1.0) {
				FlxG.timeScale += 0.02;
			}
			
			
			super.update();
			FlxG.overlap(enemies,sparay,overlapHandle);
			FlxG.collide(entities,tilemap);
			FlxG.overlap(enemies,character,playerHit);
			FlxG.overlap(character,powerup, characterPowerUpHandler); 
			FlxG.overlap(bullets,character,playerHit); 
			spawner.tickSpawner();
			
			
			
			
		}
		
		public function goToMenu(){
			FlxG.switchState(new MenuState);
		}
		
		public function overlapHandle(o,b) {
			//trace('test');
			if (FlxCollision.pixelPerfectCheck(o, b)) {
				b.kill();
				b.destroy();
				sparay.remove(b,true);
				
				
				o.hurt(1);
				if(o.health <= 1) {
					enemies.remove(o,true);
					emitter.x = o.x;
					emitter.y = o.y;
					add(new Pointblast(o,score));
					add(new MultiBlast(o,score));
					o.kill();
					o.destroy();
					FlxG.shake(0.01,0.1); 
					//enemies.add(new PlaqueDaddy(character,-10,Math.random()*FlxG.height));
					emitter.makeParticles(particle,10);
					
					emitter.start()
				}
			}
			
		}
		
		public function PowerUpRandomizer()
		{
			var slot:Number = Math.random();
			
			if(powerup._age<0) {
				powerup.kill();
				powerup.destroy();
			}else if(powerup._age<100){
				powerup.flicker(100);
			}
			
			if(slot < 0.001 && !powerup.alive){
				_PowerUpRandomizer = Math.floor(Math.random()*6);
				
				powerup = new Powerup(_PowerUpRandomizer,Math.random()*(FlxG.width-16),Math.random()*(FlxG.height-16));
				
				entities.add(powerup);
			}
		}
		
		public function characterPowerUpHandler(c,p){
			Bypass = p.react(this._PowerUpRandomizer, this.character,this.health,this.enemies, this.Bypass);
			if(Bypass==2){
				BypassTimer=1000;
				add(new PowerUpBlast(p.x, p.y, 100, "DOUBLE BYPASS"));
			}else if(Bypass==3){
				BypassTimer=750;
				add(new PowerUpBlast(p.x, p.y, 100, "TRIPLED BYPASS"));
			}else if(Bypass==4){
				BypassTimer=500;
				add(new PowerUpBlast(p.x, p.y, 100, "QUADRUPLE BYPASS"));
			}else if(Bypass==0){
				add(new PowerUpBlast(p.x, p.y, 100, "MAX HEALTH"));
			}else if(Bypass==1){
				add(new PowerUpBlast(p.x, p.y, 100, "CAFFEINE"));
			}else if(Bypass>1000){
				score._score += Bypass;
				add(new PowerUpBlast(p.x, p.y, 100, "DEFIBRILLATOR"));
			}
			p.kill();
			p.destroy();
		}
		
		public function setHealth(i:int){
			if(i==3){
				health.text = "<3 <3 <3";
			}else if(i==2){
				health.text = "<3 <3";
			}else if(i==1){
				health.text = "<3";
			}
		}
		
		public function playerHit(e,c){
			if (FlxCollision.pixelPerfectCheck(e, c)) {
				if(c.flickering == false){
					e.hurt(100);
				}
				if(e.health <= 1) {
					enemies.remove(e,true);
					emitter.x = e.x;
					emitter.y = e.y;
					add(new Pointblast(e,score));
					e.kill();
					e.destroy();
					FlxG.shake(0.01,0.1); 
					emitter.makeParticles(particle,10);
					emitter.start()
				}else{
					//push back
				}
				
				if(c.flickering == false){
					FlxG.play(hbCollide);
					c.hurt(1);
					if(c.health == 2){
						setHealth(2);
					}else if(c.health == 1){
						setHealth(1);
					}
				}
				c.flicker(1);
			
				if(c.health <= 0){
					//game over
					FlxG.play(hbDeath);
					boss = false;
					emitter.x = character.x;
					emitter.y = character.y; 
					FlxG.shake(0.1,0.5); 
					health.text = "GAME OVER";
					health.flicker(-1);
					emitter.makeParticles(particle,150);
					emitter.start();
					endTimer.time = 4;
					endTimer.start();
				}else{
					//push back
				}
			}
		}
		
		
		
	}
}