package utils.ai
{
	public class State
	{
		private var _transitions:Array;
		private var _currentState:State;
		
		private var _onEnter:Function, _onUpdate:Function, _onExit:Function;
		
		public function State(onEnter:Function, onUpdate:Function,onExit:Function){
			this._onEnter = onEnter;
			this._onUpdate = onUpdate;
			this._onExit = onExit;
			this._transitions = new Array();
		}
		
		public function start(startingState:State):void{
			this._currentState = startingState;
			this._onEnter();
		}
		
		public function set currentState(state:State):void{
			this._currentState = state;
		}
		
		public function get currentState():State{
			return this._currentState;
		}
		
		public function addTransition(fromState:State, toState:State, onEvent:String):void{
			var transition:Transition = new Transition(fromState, toState, onEvent);
			this._transitions.push(transition);
		}
		
		public function handle(event:String):void{
			var foundTransition:Transition;
			// Search transition that handles the event.
			for each (var transition:Transition in this._transitions){
				if (transition.onEvent == event){
					foundTransition = transition;
				}
			}
			// Execute current state onExit action
			this._currentState.onExit();
			// Set new current state
			this._currentState = foundTransition.toState;
			// Execute on enter state action
			this._currentState.onEnter();
		
		}
	
		public function onEnter():void{
			this._onEnter();
		}
		
		public function onUpdate():void{
			this._onUpdate();
			this.currentState.onUpdate();
		}
		
		public function onExit():void{
			this._onExit();
		}
	}
}