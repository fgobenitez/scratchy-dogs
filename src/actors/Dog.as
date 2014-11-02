package actors
{
	import utils.ai.State;
	
	import starling.textures.Texture;
	
	public class Dog extends Actor
	{
	
		private var _walking:State;
		private var _scratching:State;
		private var _dying:State;
		private var _death:State;
		
		
		public function Dog(textures:Vector.<Texture>, fps:Number=12)
		{
			super(textures, fps);
		
			this._walking = new State(this.initWalkingAnim, this.walk, null);
			this._scratching = new State(this.scratch, null, null);
			this._dying = new State(this.initDyingAnim, null, null);
			this._death = new State(this.destroy, null, null);
			
			this.fsm.addTransition(_walking, _scratching, "reachedMaxFleas");
			this.fsm.addTransition(_scratching, _walking, "finishedScratching");
			this.fsm.addTransition(_walking, _dying, "bloodFinished");
			this.fsm.addTransition(_dying, _death, "dyingAnimationFinished");
			
			this.fsm.start(this._walking);
			
		}
		
		private function initWalkingAnim():void{
			trace ("initializing walking animation...");
			
		}
		private function walk():void{
			trace ("walking...");
			this.x += 10;	
		}
		
		private function scratch():void{
			trace ("initializing scratching animation...");
			this.fsm.handle("finishedScratching");
		}
		
		private function initDyingAnim():void{
			trace ("initializing dying animation...");
			this.fsm.handle("dyinigAnimationFinished");
		}
		
		private function destroy():void{
			trace("destroy");
		}
		
	}
}