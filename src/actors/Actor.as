package actors
{
	import flash.events.Event;
	
	import utils.ai.State;
	
	import utils.math.Vector2D;
	
	import starling.display.MovieClip;
	import starling.textures.Texture;
	
	public class Actor extends MovieClip
	{
		public var energy:int;
		protected var fsm:State;
		
		
		public function Actor(textures:Vector.<Texture>, fps:Number=12)
		{
			super(textures, fps);
			this.fsm = new State(initialize, onUpdate, onExit);
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
			
		}
		
		private function onEnterFrame():void{
			this.fsm.onUpdate();
		}
		
		public function walk(v:Vector2D):void{
			trace("walking...");
		}
		protected function initialize():void{
			trace("initializing...");	
		}
		protected function onUpdate():void{
			trace("update...");	
		}
		protected function onExit():void{
			trace("on Exit...");	
		}
		
	}
}