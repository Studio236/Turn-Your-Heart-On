package ca.studio236.GameJam
{
	import org.flixel.*;
	
	public class PlayState extends FlxState
	{
		[Embed(source = "../../../../assets/blankTileCsv", mimeType = "application/octet-stream")]
		public var mapString:Class;
		
		[Embed(source="../../../../assets/4SideTiles.png")]
		private var tilegraphic:Class;
		
		[Embed(source="../../../../assets/particle.png")]
		private var particle:Class;
		
		[Embed(source = '../../../../assets/TargetCursor.png')] 
		public var targetPNG:Class;
		
		[Embed(source='../../../../assets/Backdrop.png')]
		public var bg:Class;
		
		private var tilemap:FlxTilemap;
		
		public var character:HeartBoy = new HeartBoy();
		
		private var entities:FlxGroup = new FlxGroup();
		
		private var enemies:FlxGroup = new FlxGroup();
		
		private var bullets:FlxGroup = new FlxGroup();
		
		private var sparay:FlxGroup = new FlxGroup();
		
		private var footsteps:FlxGroup = new FlxGroup();
		
		private var emitter:FlxEmitter = new FlxEmitter(100,100);
		
		
		public var spawner:Spawner;
		
		public var score:Scoreboard = new Scoreboard(5,FlxG.height - 20,100);
		
		public var health:FlxText;
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
			Bypass = 1;
			BypassTimer = -1;
			//loads the crosshair
			FlxG.mouse.show(targetPNG);
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
			add(score);
			
			
			health = new FlxText(FlxG.width - 60, FlxG.height - 20,100,"<3 <3 <3");
			add(health);
			
			
			spawner = new Spawner(character,enemies,score,bullets);
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
			if(FlxG.keys.SPACE){
				generateNewMap();
			
			}
			if(BypassTimer < 0){
				Bypass = 1;
			}else{
				BypassTimer--;
			}
			
			if(FlxG.mouse.pressed() && character.alive) {
				
				if(Bypass==2){
					sparay.add(new Spray(sparay,character.x,character.y,character.angle));
					sparay.add(new Spray(sparay,character.x,character.y,character.angle-180));
				}else if(Bypass==3){
					sparay.add(new Spray(sparay,character.x,character.y,character.angle));
					sparay.add(new Spray(sparay,character.x,character.y,character.angle-120));
					sparay.add(new Spray(sparay,character.x,character.y,character.angle+120));
				}else if(Bypass==4){
					sparay.add(new Spray(sparay,character.x,character.y,character.angle));
					sparay.add(new Spray(sparay,character.x,character.y,character.angle-90));
					sparay.add(new Spray(sparay,character.x,character.y,character.angle-180));
					sparay.add(new Spray(sparay,character.x,character.y,character.angle-270));
				}else{
					sparay.add(new Spray(sparay,character.x,character.y,character.angle));
				}
			}
			PowerUpRandomizer();

			
			
			if(FlxG.timeScale <= 1.0) {
				FlxG.timeScale += 0.02;
			}
			
			
			super.update();
			FlxG.collide(enemies,sparay,overlapHandle);
			FlxG.collide(entities,tilemap);
			FlxG.collide(enemies,character,playerHit);
			FlxG.overlap(character,powerup, characterPowerUpHandler); 
			FlxG.overlap(bullets,character,playerHit); 
			spawner.tickSpawner();
			
			
			
			
		}
		
		public function goToMenu(){
			FlxG.switchState(new MenuState);
		}
		
		public function overlapHandle(o,b) {
			//trace('test');
			
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
				
				powerup = new Powerup(_PowerUpRandomizer,Math.random()*FlxG.width,Math.random()*FlxG.height);
				
				entities.add(powerup);
			}
		}
		
		public function characterPowerUpHandler(c,p){
			Bypass = p.react(this._PowerUpRandomizer, this.character,this.health,this.enemies, this.Bypass);
			if(Bypass==2){
				BypassTimer=1000;
			}else if(Bypass==3){
				BypassTimer=500;
			}else if(Bypass==4){
				BypassTimer=250;
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
			if(c.flickering == false){
				e.hurt(1);
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
				emitter.x = character.x;
				emitter.y = character.y; 
				FlxG.shake(0.1,0.5); 
				health.text = "GAME OVER";
				health.flicker(-1);
				emitter.makeParticles(particle,150);
				emitter.start()
				
			}else{
				//push back
			}
		}
		
		
		
	}
}