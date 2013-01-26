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
		
		private var tilemap:FlxTilemap;
		
		public var character:HeartBoy = new HeartBoy();
		
		private var entities:FlxGroup = new FlxGroup();
		
		private var enemies:FlxGroup = new FlxGroup();
		
		private var sparay:FlxGroup = new FlxGroup();
		
		private var footsteps:FlxGroup = new FlxGroup();
		
		private var emitter:FlxEmitter = new FlxEmitter(100,100);
		
		
		override public function create():void
		{
			
			//loads the crosshair
			FlxG.mouse.show(targetPNG);
			prepTileMap();
			add(footsteps);
			entities.add(sparay);
			entities.add(character);
			for(var i = 0; i < 10; i ++) {
				enemies.add(new Plaque(character,Math.random()*600,Math.random()*600));
			}
			entities.add(enemies);
			add(entities);
			add(emitter);
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
						if(i*32 > character.x && (i+1)*32 < character.x + 16 && j*32 > character.y && (j+1)*32 < character.y + 16){
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
				
				sparay.add(new Spray(character.x,character.y,character.angle));
				
			}
			
			//sfootsteps.add(new Footstep(character.x, character.y));
			
			
			
			
			
			super.update();
			FlxG.collide(enemies,sparay,overlapHandle);
			FlxG.collide(entities,tilemap);
			
			
			
			
		}
		
		public function goToMenu(){
			FlxG.switchState(new MenuState);
		}
		
		public function overlapHandle(o,b) {
			trace('test');
			b.kill();
			b.destroy();
			sparay.remove(b);
			
			o.hurt(1);
			if(o.health <= 1) {
				enemies.remove(o);
				emitter.x = o.x;
				emitter.y = o.y;
				add(new Pointblast(o));
				o.kill();
				o.destroy();
				FlxG.shake(0.01,0.1);
				enemies.add(new Plaque(character,-10,Math.random()*FlxG.height));
				emitter.makeParticles(particle,10);
				
				emitter.start()
			}
			
		}
	}
}