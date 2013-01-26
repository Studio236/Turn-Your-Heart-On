package ca.studio236.GameJam
{
	import org.flixel.FlxSprite;
	
	public class Powerup extends FlxSprite
	{
		[Embed(source="../../../../assets/PowerUps/PU_2Bypass.png")]
		public var Dub:Class;
		
		[Embed(source="../../../../assets/PowerUps/PU_3Bypass.png")]
		public var Trip:Class;
		
		[Embed(source="../../../../assets/PowerUps/PU_4Bypass.png")]
		public var Quad:Class;
		
		[Embed(source="../../../../assets/PowerUps/PU_Caffeine.png")]
		public var Caff:Class;
		
		[Embed(source="../../../../assets/PowerUps/PU_Defib.png")]
		public var Defib:Class;
		
		[Embed(source="../../../../assets/PowerUps/PU_Health.png")]
		public var Health:Class;
		
		public var _powerType:String;
		
		public function Powerup(powerType:String, X:Number=0, Y:Number=0, SimpleGraphic:Class=null)
		{
			super(X, Y, SimpleGraphic);
			_powerType = powerType;
		}
		
		override public function update():void
		{
			if(_powerType=="Health"){
				this.loadGraphic(Dub,true,false,16,16);
				//health up
			}else if(_powerType=="Caffeine"){
				this.loadGraphic(Trip,true,false,16,16);
				//invincible for 10 seconds
			}else if(_powerType=="Double"){
				this.loadGraphic(Quad,true,false,16,16);
				//two direction shooting
			}else if(_powerType=="Triple"){
				this.loadGraphic(Caff,true,false,16,16);
				//three direction shooting
			}else if(_powerType=="Quad"){
				this.loadGraphic(Defib,true,false,16,16);
				//four firection shooting
			}else if(_powerType=="Defib"){
				this.loadGraphic(Health,true,false,16,16);
				//deal 10 damange to every enemy
			}
		}
	}
}