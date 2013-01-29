package ca.studio236.GameJam
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.utils.getDefinitionByName;
	import flash.text.*;
	
	/**
	 * ...
	 * @author Jake Cataford
	 */
	
	
	public class Preloader extends MovieClip 
	{
		
		[Embed(source="../../../../assets/emulogic.ttf",embedAsCFF="false",fontName="NES",fontFamily="NES")] 	public	var	FontNES:String;
		private var myText:TextField = new TextField();
		private var myFormat:TextFormat = new TextFormat();
		
		public function Preloader() 
		{
			if (stage) {
				stage.scaleMode = StageScaleMode.NO_SCALE;
				stage.align = StageAlign.TOP_LEFT;
			}
			addEventListener(Event.ENTER_FRAME, checkFrame);
			loaderInfo.addEventListener(ProgressEvent.PROGRESS, progress);
			loaderInfo.addEventListener(IOErrorEvent.IO_ERROR, ioError);
			
			
			myFormat.size = 15;
			myFormat.color = 0xFFFFFF;
			myFormat.font = "NES";
			myText.embedFonts=true;
			myText.defaultTextFormat = myFormat;
			myText.x = 50;
			myText.y = 50;
			myText.width = 550;
			myText.setTextFormat(myFormat);
			myText.text = "Loading...";
			addChild(myText);
		}
		
		private function ioError(e:IOErrorEvent):void 
		{
			trace(e.text);
		}
		
		private function progress(e:ProgressEvent):void 
		{
			if(e.bytesLoaded/e.bytesTotal < 0.10) {
				myText.text = "Engulfing an Extra Large Pizza..."
			}else
			if(e.bytesLoaded/e.bytesTotal < 0.20) {
				myText.text = "Draining a six pack of beer..."
			} else
			if(e.bytesLoaded/e.bytesTotal < 0.30) {
				myText.text = "Annihilating the birthday cake..."
			} else
			if(e.bytesLoaded/e.bytesTotal < 0.40) {
				myText.text = "Filling mouth with whipped cream..."
			} else
			if(e.bytesLoaded/e.bytesTotal < 0.50) {
				myText.text = "Fluffing the marshmellow fluff..."
			} else
			if(e.bytesLoaded/e.bytesTotal < 0.60) {
				myText.text = "Deep frying a chicken..."
			} else
			if(e.bytesLoaded/e.bytesTotal < 0.70) {
				myText.text = "Upgrading Lay-Z boy..."
			} else
			if(e.bytesLoaded/e.bytesTotal < 0.80) {
				myText.text = "Ordering room Service..."
			} else
			if(e.bytesLoaded/e.bytesTotal < 0.90) {
				myText.text = "Loading the game..."
			} else
			if(e.bytesLoaded/e.bytesTotal < 0.10) {
				myText.text = "Turning your heart on..."
			}
		}
		
		private function checkFrame(e:Event):void 
		{
			if (currentFrame == totalFrames) 
			{
				stop();
				loadingFinished();
			}
		}
		
		private function loadingFinished():void 
		{
			removeEventListener(Event.ENTER_FRAME, checkFrame);
			loaderInfo.removeEventListener(ProgressEvent.PROGRESS, progress);
			loaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, ioError);
			
			// TODO hide loader
			
			startup();
		}
		
		private function startup():void 
		{
			var mainClass:Class = getDefinitionByName("ca.studio236.GameJam.GameJam") as Class;
			addChild(new mainClass() as DisplayObject);
		}
		
	}
	
}