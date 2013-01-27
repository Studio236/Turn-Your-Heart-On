package ca.studio236.GameJam
{
	import ca.studio236.GameJam.PlaqueDaddy;
	
	import org.flixel.*;
	
	public class Spawner
	{
		private var maxEnemies:Number = 5;
		private var _group:FlxGroup;
		private var score:Scoreboard;
		private var c:HeartBoy;
		private var p:FlxGroup;
		public function Spawner(character,group:FlxGroup,s:Scoreboard,bull:FlxGroup)
		{
			_group = group;
			score = s;
			c =character;
			p = bull;
			
		}
		
		public function tickSpawner() {
			
			maxEnemies = Math.floor(score._score/100000)+5;
			
			if(Math.random() < 0.00001) {
				var zx = Math.random();
				if(zx < 0.25) {
					_group.add(new CholDerb(c,100,Math.floor(Math.random()*FlxG.width), -128));//top
				}
				else if(zx > 0.25 && z1 < 0.50) {
					_group.add(new CholDerb(c,100,Math.floor(Math.random()*FlxG.width), FlxG.height + 128));//bottom
				}
				else if(zx > 0.50, z1 < 0.75) {
					_group.add(new CholDerb(c,100,-128, Math.floor(Math.random()*FlxG.width)));//left
				}
				else if(zx > 0.75) {
					_group.add(new CholDerb(c,100,FlxG.width + 128, Math.floor(Math.random()*FlxG.width)));//right
				}
			}
				
			if(_group.length < maxEnemies) {
				
				
				var rand = Math.random();
				
				//0.01 chance of filling enemies.
				
				if(Math.random() < 0.008) {
					
					
					
					
					while(_group.length < maxEnemies) {
						
						
						//FIRST ZONE
						if(score._score < 10000) {
							var z1 = Math.random();
							if(z1 < 0.25) {
								_group.add(new CholSmall(c,100,Math.floor(Math.random()*FlxG.width), -32));//top
							}
							else if(z1 > 0.25 && z1 < 0.50) {
								_group.add(new CholSmall(c,100,Math.floor(Math.random()*FlxG.width), FlxG.height + 32));//bottom
							}
							else if(z1 > 0.50, z1 < 0.75) {
								_group.add(new CholSmall(c,100,-32, Math.floor(Math.random()*FlxG.width)));//left
							}
							else if(z1 > 0.75) {
								_group.add(new CholSmall(c,100,FlxG.width + 32, Math.floor(Math.random()*FlxG.width)));//right
							}
							
						}
						//Zone 2
						else if(score._score < 30000){
							var z2 = Math.random();
							var z22 = Math.random();
							if(z2 < 0.25) {
								if(z22 < 0.50) {
									_group.add(new CholSmall(c,100,Math.floor(Math.random()*FlxG.width), -32));//top
								}else{
									_group.add(new CholBig(c,100,Math.floor(Math.random()*FlxG.width), -32));//top
								}
							}
							else if(z2 > 0.25 && z2 < 0.50) {
								if(z22 < 0.50) {
									_group.add(new CholSmall(c,100,Math.floor(Math.random()*FlxG.width), FlxG.height + 32));//bottom
								}else{
									_group.add(new CholBig(c,100,Math.floor(Math.random()*FlxG.width), FlxG.height + 32));//bottom
								}
							}
							else if(z2 > 0.50, z2 < 0.75) {
								if(z22 < 0.50) {
									_group.add(new CholSmall(c,100,-32, Math.floor(Math.random()*FlxG.width)));//left
								}else{
									_group.add(new CholBig(c,100,-32, Math.floor(Math.random()*FlxG.width)));//left
								}
							}
							else if(z2 > 0.75) {
								if(z22 < 0.50) {
									_group.add(new CholSmall(c,100,FlxG.width + 32, Math.floor(Math.random()*FlxG.width)));//right
								}else{
									_group.add(new CholBig(c,100,FlxG.width + 32, Math.floor(Math.random()*FlxG.width)));//right
								}
							}
						}

						
						//Zone 3
						else if(score._score < 100000){
							var z3 = Math.random();
							var z33 = Math.random();
							if(z3 < 0.25) {
								if(z33 < 0.50) {
									_group.add(new CholSmall(c,100,Math.floor(Math.random()*FlxG.width), -32));//top
								}else if(z33 < 0.75){
									_group.add(new CholBig(c,100,Math.floor(Math.random()*FlxG.width), -32));//top
								}else{
									_group.add(new Plaque(c,Math.floor(Math.random()*FlxG.width), -32));//top
								}
							}
							else if(z3 > 0.25 && z3 < 0.50) {
								if(z33 < 0.50) {
									_group.add(new CholSmall(c,100,Math.floor(Math.random()*FlxG.width), FlxG.height + 32));//bottom
								}else if(z33 < 0.75){
									_group.add(new CholBig(c,100,Math.floor(Math.random()*FlxG.width), FlxG.height + 32));//bottom
								}else{
									_group.add(new Plaque(c,Math.floor(Math.random()*FlxG.width), FlxG.height + 32));//bottom
								}
							}
							else if(z3 > 0.50, z2 < 0.75) {
								if(z33 < 0.50) {
									_group.add(new CholSmall(c,100,-32, Math.floor(Math.random()*FlxG.width)));//left
								}else if(z33 < 0.75){
									_group.add(new CholBig(c,100,-32, Math.floor(Math.random()*FlxG.width)));//left
								}else{
									_group.add(new Plaque(c,-32, Math.floor(Math.random()*FlxG.width)));//left
								}
							}
							else if(z3 > 0.75) {
								if(z33 < 0.50) {
									_group.add(new CholSmall(c,100,FlxG.width + 32, Math.floor(Math.random()*FlxG.width)));//right
								}else if(z33 < 0.75){
									_group.add(new CholBig(c,100,FlxG.width + 32, Math.floor(Math.random()*FlxG.width)));//right
								}else{
									_group.add(new Plaque(c,-32, Math.floor(Math.random()*FlxG.width)));//left
								}
							}
						}
						
						//zone 4
						else if(score._score < 200000){
							var z4 = Math.random();
							var z44 = Math.random();
							if(z4 < 0.25) {
								if(z44 < 0.40) {
									_group.add(new CholSmall(c,100,Math.floor(Math.random()*FlxG.width), -32));//top
								}else if(z44 < 0.65){
									_group.add(new CholBig(c,100,Math.floor(Math.random()*FlxG.width), -32));//top
								}else if(z44 < 0.90){
									_group.add(new Plaque(c,Math.floor(Math.random()*FlxG.width), -32));//top
								}else{
									_group.add(new PlaqueDaddy(p,c,Math.floor(Math.random()*FlxG.width), -32));
								}
							}
							else if(z4 > 0.25 && z44 < 0.50) {
								if(z44 < 0.40) {
									_group.add(new CholSmall(c,100,Math.floor(Math.random()*FlxG.width), FlxG.height + 32));//bottom
								}else if(z44 < 0.65){
									_group.add(new CholBig(c,100,Math.floor(Math.random()*FlxG.width), FlxG.height + 32));//bottom
								}else if(z44 < 0.90){
									_group.add(new Plaque(c,Math.floor(Math.random()*FlxG.width), FlxG.height + 32));//bottom
								}else{
									_group.add(new PlaqueDaddy(p,c,Math.floor(Math.random()*FlxG.width), FlxG.height + 32));//bottom
								}
							}
							else if(z4 > 0.50, z4 < 0.75) {
								if(z44 < 0.40) {
									_group.add(new CholSmall(c,100,-32, Math.floor(Math.random()*FlxG.width)));//left
								}else if(z44 < 0.65){
									_group.add(new CholBig(c,100,-32, Math.floor(Math.random()*FlxG.width)));//left
								}else if(z44 < 0.90){
									_group.add(new Plaque(c,-32, Math.floor(Math.random()*FlxG.width)));//left
								}else{
									_group.add(new PlaqueDaddy(p,c,-32, Math.floor(Math.random()*FlxG.width)));//left
								}
							}
							else if(z4 > 0.75) {
								if(z44 < 0.50) {
									_group.add(new CholSmall(c,100,FlxG.width + 32, Math.floor(Math.random()*FlxG.width)));//right
								}else if(z44 < 0.75){
									_group.add(new CholBig(c,100,FlxG.width + 32, Math.floor(Math.random()*FlxG.width)));//right
								}else if(z44 < 0.90){
									_group.add(new Plaque(c,FlxG.width + 32, Math.floor(Math.random()*FlxG.width)));//right
								}else{
									_group.add(new PlaqueDaddy(p,c,FlxG.width + 32, Math.floor(Math.random()*FlxG.width)));//right
								}
							}
						}
						
						//final zone
						else{
							var z5 = Math.random();
							var z55 = Math.random();
							if(z5 < 0.25) {
								if(z55 < 0.30) {
									_group.add(new CholSmall(c,100,Math.floor(Math.random()*FlxG.width), -32));//top
								}else if(z55 < 0.50){
									_group.add(new CholBig(c,100,Math.floor(Math.random()*FlxG.width), -32));//top
								}else if(z55 < 0.80){
									_group.add(new Plaque(c,Math.floor(Math.random()*FlxG.width), -32));//top
								}else if(z55 < 0.90){
									_group.add(new PlaqueDaddy(p,c,Math.floor(Math.random()*FlxG.width), -32));
								}else{
									_group.add(new HeartWorm(c,Math.floor(Math.random()*FlxG.width), -32));
								}
							}
							else if(z5 > 0.25 && z5 < 0.50) {
								if(z55 < 0.30) {
									_group.add(new CholSmall(c,100,Math.floor(Math.random()*FlxG.width), FlxG.height + 32));//bottom
								}else if(z44 < 0.65){
									_group.add(new CholBig(c,100,Math.floor(Math.random()*FlxG.width), FlxG.height + 32));//bottom
								}else if(z55 < 0.80){
									_group.add(new Plaque(c,Math.floor(Math.random()*FlxG.width), FlxG.height + 32));//bottom
								}else if(z55 < 0.90){
									_group.add(new PlaqueDaddy(p,c,Math.floor(Math.random()*FlxG.width), FlxG.height + 32));//bottom
								}else{
									_group.add(new HeartWorm(c,Math.floor(Math.random()*FlxG.width), FlxG.height + 32));
								}
							}
							else if(z5 > 0.50, z4 < 0.75) {
								if(z55 < 0.40) {
									_group.add(new CholSmall(c,100,-32, Math.floor(Math.random()*FlxG.width)));//left
								}else if(z55 < 0.65){
									_group.add(new CholBig(c,100,-32, Math.floor(Math.random()*FlxG.width)));//left
								}else if(z55 < 0.80){
									_group.add(new Plaque(c,-32, Math.floor(Math.random()*FlxG.width)));//left
								}else if(z55 < 0.90){
									_group.add(new PlaqueDaddy(p,c,-32, Math.floor(Math.random()*FlxG.width)));//left
								}else{
									_group.add(new HeartWorm(c,-32, Math.floor(Math.random()*FlxG.width)));//left
								}
							}
							else if(z5 > 0.75) {
								if(z55 < 0.50) {
									_group.add(new CholSmall(c,100,FlxG.width + 32, Math.floor(Math.random()*FlxG.width)));//right
								}else if(z55 < 0.65){
									_group.add(new CholBig(c,100,FlxG.width + 32, Math.floor(Math.random()*FlxG.width)));//right
								}else if(z55 < 0.80){
									_group.add(new Plaque(c,FlxG.width + 32, Math.floor(Math.random()*FlxG.width)));//right
								}else if(z55 < 0.90){
									_group.add(new PlaqueDaddy(p,c,FlxG.width + 32, Math.floor(Math.random()*FlxG.width)));//right
								}else{
									_group.add(new HeartWorm(c,FlxG.width + 32, Math.floor(Math.random()*FlxG.width)));//right
								}
							}
						}
					}
				}
			}
		}
	}
}