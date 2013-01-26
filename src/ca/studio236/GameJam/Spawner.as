package ca.studio236.GameJam
{
	import org.flixel.*;

	public class Spawner
	{
		private var maxEnemies:Number = 5;
		private var _group:FlxGroup;
		private var score:Scoreboard;
		private var c:HeartBoy;
		
		public function Spawner(character,group:FlxGroup,s:Scoreboard)
		{
			_group = group;
			score = s;
			c =character;
			
			
		}
		
		public function tickSpawner() {
			
			if(_group.length < maxEnemies) {
				
				
				var rand = Math.random();
				
				//0.01 chance of filling enemies.
				
				if(Math.random() < 0.01) {
					
					while(_group.length < maxEnemies) {
						
						var a = Math.random();
							if(a < 0.15 && a > 0.05) {
								_group.add(new HeartWorm(c,100,250,FlxG.height + 100));
							}else if(a < 0.05){
								_group.add(new PlaqueDaddy(c,100,250,-100));
							}else if(a < 0.25 && a > 0.15) {
								_group.add(new Plaque(c,-100,Math.floor(Math.random()*FlxG.height)));
							}else if(a < 0.50 && a > 0.25) {
								_group.add(new Plaque(c,FlxG.width, Math.floor(Math.random()*FlxG.height)));
							}else if(a < 0.75 && a > 0.50){
								_group.add(new CholSmall(c,100,Math.floor(Math.random()*FlxG.width), -32));
							}else{
								_group.add(new CholBig(c, 100, Math.floor(Math.random()*FlxG.width), FlxG.height + 32)); 
							}
						
						
						
					}
					
					
					
					
				}
				
				
				
				
			}
			
			
		}
	}
}