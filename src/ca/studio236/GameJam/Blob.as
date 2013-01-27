package ca.studio236.GameJam
{
	import org.flixel.FlxSprite;
	
	public class Blob extends FlxSprite
	{
		[Embed(source="../../../../assets/blob.png")]
		private var graphic:Class;
		
		public function Blob(X:Number=0, Y:Number=0, direction:Number = 0 )
		{
			super(X, Y);
			health = 100;
			this.velocity.x = Math.sin(direction)*100;
			this.velocity.y = Math.cos(direction)*100;
			this.loadGraphic(graphic,true);
			this.addAnimation("blob", [0,1],4);
			this.play("blob");
			this.immovable = true;
		}
	}
}