package ca.studio236.GameJam
{
	import org.flixel.FlxSprite;
	
	public class Powerup extends FlxSprite
	{
		public var _powerType:String;
		
		public function Powerup(powerType:String, X:Number=0, Y:Number=0, SimpleGraphic:Class=null)
		{
			super(X, Y, SimpleGraphic);
			_powerType = powerType;
		}
		
		override public function update():void
		{
			if(_powerType=="Health"){
				//health up
			}else if(_powerType=="Caffeine"){
				//invincible for 10 seconds
			}else if(_powerType=="DoubleBypass"){
				//two direction shooting
			}else if(_powerType=="TripleBypass"){
				//three direction shooting
			}else if(_powerType=="QuadBypass"){
				//four firection shooting
			}else if(_powerType=="Defib"){
				//deal 10 damange to every enemy
			}
		}
	}
}