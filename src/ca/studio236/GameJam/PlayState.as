package ca.studio236.GameJam
{
	import org.flixel.*;
	
	public class PlayState extends FlxState
	{
		[Embed(source = "../../../../assets/blankTileCsv", mimeType = "application/octet-stream")]
		public var mapString:Class;
		
		[Embed(source="../../../../assets/tilemap.png")]
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
		
		private var sparay:FlxGroup = new FlxGroup();
		
		private var footsteps:FlxGroup = new FlxGroup();
		
		private var emitter:FlxEmitter = new FlxEmitter(100,100);
		
		private var powerups:FlxGroup = new FlxGroup();
		
		public var spawner:Spawner;
		
		public var score:Scoreboard = new Scoreboard(5,FlxG.height - 20,100);
		
		public var health:FlxText;
		
		private var PowerUpRandomizerString:String;
		
		override public function create():void
		{
			add(new FlxSprite(0,0,bg));
			
			//loads the crosshair
			FlxG.mouse.show(targetPNG);
			prepTileMap();
			add(footsteps);
			sparay.maxSize = 200;
			entities.add(sparay);
			PowerUpRandomizer();
			entities.add(character);
			for(var i = 0; i < 1; i ++) {
				enemies.add(new HeartWorm(character,200,200));
			}
			entities.add(enemies);
			add(entities);
			add(emitter);
			add(new Veins());
			add(score);
			
			health = new FlxText(FlxG.width - 60, FlxG.height - 20,100,"<3 <3 <3");
			add(health);
			
			
			spawner = new Spawner(character,enemies,score);
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
							tilemap.setTile(i,j,1);
						}
						
						
					}
				}
			}
		}
		
		override public function update():void {
			if(FlxG.keys.SPACE){
				generateNewMap();
			
			}
			if(FlxG.mouse.pressed()) {
				
				sparay.add(new Spray(sparay,character.x,character.y,character.angle));
			}

			
			
			if(FlxG.timeScale <= 1.0) {
				FlxG.timeScale += 0.02;
			}
			
			
			super.update();
			FlxG.collide(enemies,sparay,overlapHandle);
			FlxG.collide(entities,tilemap);
			FlxG.collide(enemies,character,playerHit);
			FlxG.overlap(character,powerups, characterPowerUpHandler); 
			spawner.tickSpawner();
			
			
			
			
		}
		
		public function goToMenu(){
			FlxG.switchState(new MenuState);
		}
		
		public function overlapHandle(o,b) {
			trace('test');
			
			b.kill();
			b.destroy();
			sparay.remove(b,true);
			
			
			o.hurt(1);
			if(o.health <= 1) {
				enemies.remove(o,true);
				emitter.x = o.x;
				emitter.y = o.y;
				add(new Pointblast(o,score));
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
			var PowerUpRandomizer9000:Number = Math.floor(Math.random()*6);
			
			
			switch(PowerUpRandomizer9000)
			{
				case 0:
					PowerUpRandomizerString = "Health";
					break;
				case 1:
					PowerUpRandomizerString = "Caffeine";
					break;
				case 2:
					PowerUpRandomizerString = "Double";
					break;
				case 3:
					PowerUpRandomizerString = "Triple";
					break;
				case 4:
					PowerUpRandomizerString = "Quad";
					break;
				case 5:
					PowerUpRandomizerString = "Defib";
					break;
			}
			
			powerups.add(new Powerup(PowerUpRandomizerString,Math.random()*100,Math.random()*100));
			
			entities.add(powerups);
		}
		
		public function characterPowerUpHandler(c,p){
			p.react(this.PowerUpRandomizerString, this.character,this.health,this.enemies);
			p.kill();
			p.destroy();
			powerups.remove(p, true);
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