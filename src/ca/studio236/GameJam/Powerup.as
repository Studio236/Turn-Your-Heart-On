package ca.studio236.GameJam
{
	import org.flixel.*; 
	
	public class Powerup extends FlxSprite
	{
		[Embed(source="../../../../assets/PowerUps/PU_2Bypass.png")]
		public var Dub:Class;
		[Embed(source='../../../../assets/sounds/Powerup.mp3')]
		private var seBypass:Class;
		
		[Embed(source="../../../../assets/PowerUps/PU_3Bypass.png")]
		public var Trip:Class;
		
		[Embed(source="../../../../assets/PowerUps/PU_4Bypass.png")]
		public var Quad:Class;
		
		[Embed(source="../../../../assets/PowerUps/PU_Caffeine.png")]
		public var Caff:Class;
		[Embed(source='../../../../assets/sounds/Caffeine.mp3')]
		private var seCaffeine:Class;
		
		[Embed(source="../../../../assets/PowerUps/PU_Defib.png")]
		public var Defib:Class;
		[Embed(source='../../../../assets/sounds/Defib.mp3')]
		private var seDefib:Class;
		
		[Embed(source="../../../../assets/PowerUps/PU_Health.png")]
		public var Health:Class;
		[Embed(source='../../../../assets/sounds/MaxHealth.mp3')]
		private var seHealth:Class;
		
		public var _powerType:int;
		public var _age:int;
		
		public function Powerup(powerType:int, X:Number=0, Y:Number=0, SimpleGraphic:Class=null)
		{
			super(X, Y, SimpleGraphic);
			_powerType = powerType;
			_age = 700;
			
			if(_powerType==0){
				this.loadGraphic(Health,true,false,16,16);
				//health up
			}else if(_powerType==1){
				this.loadGraphic(Caff,true,false,16,16);
				//invincible for 10 seconds
			}else if(_powerType==2){
				this.loadGraphic(Dub,true,false,16,16);
				//two direction shooting
			}else if(_powerType==3){
				this.loadGraphic(Trip,true,false,16,16);
				//three direction shooting
			}else if(_powerType==4){
				this.loadGraphic(Quad,true,false,16,16);
				//four firection shooting
			}else if(_powerType==5){
				this.loadGraphic(Defib,true,false,16,16);
				//deal 10 damange to every enemy
			}
			this.addAnimation("spin",[0,1,2,3,4,5],10);
			this.play("spin");
		}
		
		override public function update():void
		{
			_age -= 1;
		}
		
		public function react(s:int, c:HeartBoy, h:FlxText, e:FlxGroup, b:int):int{
			if(s==0){
				//health up
				FlxG.play(seHealth);
				c.health = 3;
				h.text = "<3 <3 <3";
				return 0;
			}else if(s==1){
				//invincible for 10 seconds
				FlxG.play(seCaffeine);
				c.flicker(10);
				return 1;
			}else if(s==2){
				//two direction shooting
				FlxG.play(seBypass);
				return 2;
			}else if(s==3){
				//three direction shooting
				FlxG.play(seBypass);
				return 3;
			}else if(s==4){
				//four firection shooting
				FlxG.play(seBypass);
				return 4;
			}else if(s==5){
				//deal 50 damange to every enemy
				FlxG.play(seDefib);
				FlxG.flash(0xffffffff, 4);
				FlxG.shake(0.05, 1.5);
				var tempScore:int = 0;
				for(var i = 0; i < e.length; i++){
					//calculate scores of detroyed enemies
					tempScore += e.members[i].pointValue;
					e.members[i].kill();
					e.members[i].destroy();
					e.clear();
				}
				return tempScore;
			}
			return -1;
		}
	}
}