package ca.studio236.GameJam
{
	import ca.studio236.GameJam.PlaqueDaddy;
	
	import flash.geom.Rectangle;
	
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	
	public class Spawner
	{
		[Embed(source="../../../../assets/260.png")] 
		private var onTheBall:Class;
		private var maxEnemies:Number = 5;
		private var _group:FlxGroup;
		private var score:Scoreboard;
		private var c:HeartBoy;
		private var b:FlxGroup;
		private var boss = true;
		private var bossSpawned = false;
		private var bossHasSpawned = false;
		private var spawnstate = "normal";
		private var spawnstatetimer = 0;
		private var _hud:FlxGroup;
		[Embed(source='../../../../assets/sounds/eventalarm.mp3')]
		private var ALARM:Class;
	
		public function Spawner(character,group:FlxGroup,s:Scoreboard,bull:FlxGroup,hud:FlxGroup)
		{
			_hud = hud;
			_group = group;
			score = s;
			c =character;
			b = bull;
		}
		
		public function tickSpawner() {
			
			maxEnemies = Math.floor(score._score/100000)+5;
			
			
			if(PlayState.boss && !bossSpawned) {
				_group.add(new BossTheClot(b,c,0));
				bossSpawned = true;
			}else if(PlayState.boss){
				
			}else{
			if(score._score >= 150000 && !bossHasSpawned) {
				PlayState.boss = true;
				bossHasSpawned = true;
			}
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
			
			
			//spawn events
			
			var spawnevent = Math.random();
			
			if(spawnevent < 0.0005 && spawnstate == "normal") {
				
				//PLAK ATTACK
				this.spawnstatetimer = 1000;
				this.spawnstate = 'plak_attack';
				_hud.add(new TextBlast(_hud,"PLAK ATTACK!!!"));
				FlxG.play(ALARM);
				
			}
			
			
			if(spawnstate == 'plak_attack' && spawnstatetimer > 0) {
				this.spawnstatetimer --;
				if(this.spawnstatetimer % 30 == 0) {
					var pa = Math.random();
					if(pa < 0.25) {
						
						_group.add(new Plaque(c,Math.floor(Math.random()*FlxG.width), -32));//top
					}
					else if(pa > 0.25 && pa < 0.50) {
						
						_group.add(new Plaque(c,Math.floor(Math.random()*FlxG.width), FlxG.height + 32));//bottom
					}
					else if(pa > 0.50, pa < 0.75) {
						_group.add(new Plaque(c,-32, Math.floor(Math.random()*FlxG.width)));//left
					}
					else if(pa > 0.75) {
						
						_group.add(new Plaque(c,FlxG.width + 32, Math.floor(Math.random()*FlxG.width)));//left
					}
				}
				
			}else if (spawnstatetimer <= 0) {
				this.spawnstate = 'normal'
			}
			
				
			if(_group.length < maxEnemies && !PlayState.boss && spawnstate == "normal") {
				
				
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
								_group.add(new Plaque(c,FlxG.width + 32, Math.floor(Math.random()*FlxG.width)));//left
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
									_group.add(new PlaqueDaddy(b,c,Math.floor(Math.random()*FlxG.width), -32));
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
									_group.add(new PlaqueDaddy(b,c,Math.floor(Math.random()*FlxG.width), FlxG.height + 32));//bottom
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
									_group.add(new PlaqueDaddy(b,c,-32, Math.floor(Math.random()*FlxG.width)));//left
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
									_group.add(new PlaqueDaddy(b,c,FlxG.width + 32, Math.floor(Math.random()*FlxG.width)));//right
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
									_group.add(new PlaqueDaddy(b,c,Math.floor(Math.random()*FlxG.width), -32));
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
									_group.add(new PlaqueDaddy(b,c,Math.floor(Math.random()*FlxG.width), FlxG.height + 32));//bottom
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
									_group.add(new PlaqueDaddy(b,c,-32, Math.floor(Math.random()*FlxG.width)));//left
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
									_group.add(new PlaqueDaddy(b,c,FlxG.width + 32, Math.floor(Math.random()*FlxG.width)));//right
								}else{
									_group.add(new HeartWorm(c,FlxG.width + 32, Math.floor(Math.random()*FlxG.width)));//right
								}
							}
							else if(bossHasSpawned && Math.random() < 0.0001){
								_group.add(new BossTheClot(b,c,0));
							}
						}
					}
				}
			}
		}}
	}
}