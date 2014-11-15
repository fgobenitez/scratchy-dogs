package
{
	import flash.display.Sprite;
	import net.hires.debug.Stats;
	import starling.core.Starling;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	
	[SWF (frameRate="60", width="800", height="600", backgroundColor="0x333333")]
	public class scratchyDogs extends Sprite
	{
		private var stats:Stats;
		private var myStarling:Starling;
		
		public function scratchyDogs()
		{
			// support autoOrients
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			stats = new Stats();
			this.addChild(stats);
			myStarling = new Starling(Game, stage);
			myStarling.antiAliasing = 1;
			myStarling.start();
		}
	}
}