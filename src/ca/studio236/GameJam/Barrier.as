package ca.studio236.GameJam
{
	import org.flixel.FlxTilemap;
	import org.flixel.system.FlxTile;
	
	public class Barrier extends FlxTile
	{
		public function Barrier(Tilemap:FlxTilemap, Index:uint, Width:Number, Height:Number, Visible:Boolean, AllowCollisions:uint)
		{
			super(Tilemap, Index, Width, Height, Visible, AllowCollisions);
		}
	}
}