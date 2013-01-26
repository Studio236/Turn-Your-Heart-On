package ca.studio236.GameJam
{
	import org.flixel.*;
	
	public class PlayState extends FlxState
	{
		[Embed(source = "../../../../assets/blankTileCsv", mimeType = "application/octet-stream")]
		public var mapString:Class;
		
		[Embed(source="../../../../assets/tilemap.png")]
		private var tilegraphic:Class;
		
		[Embed(source = '../../../../assets/TargetCursor.png')] 
		public var targetPNG:Class;
		
		private var tilemap:FlxTilemap;
		
		private var character:HeartBoy = new HeartBoy();
		
		private var entities:FlxGroup;
		
		override public function create():void
		{
			//loads the crosshair
			FlxG.mouse.show(targetPNG);
			prepTileMap();
			add(character);
			
			
		}
		
		public function prepTileMap() {
		
			trace(new mapString);
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
			super.update();
			
			FlxG.collide(entities,tilemap);
			
		}
	}
}