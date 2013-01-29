package ca.studio236.GameJam
{
	import org.flixel.*;

	
	public class TextBlast extends FlxText
	{
		private var _group:FlxGroup;
		public function TextBlast(group:FlxGroup,Text:String=null,micro:Boolean = false)
		{
			super(0, FlxG.height/2 - 20, FlxG.width, Text);
			_group = group;
			if(micro) {
				this.size = 20;
			}else{
				this.size = 40;
			}
			
			this.alignment = "center";
			this.color = 0xFFFFFF;
			this.shadow = 0x000000
			
		}
		
		override public function update():void {
			this.y --;
			this.alpha-=0.005;
			if(this.alpha < 0) {
				this.kill();
				this.destroy();
				_group.remove(this,true);
			}
		}
	}
}