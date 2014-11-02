package utils.ai
{
	public class Transition
	{
		
		private var _fromState:State, _toState:State;
		private var _onEvent:String;
		
		public function Transition(fromState:State, toState:State, onEvent:String){
			this._fromState = fromState;
			this._toState = toState;
			this._onEvent = onEvent; 
		}
		public function get fromState():State{
			return this._fromState;
		}
		public function get toState():State{
			return this._toState;
		}
		public function get onEvent():String{
			return this._onEvent;
		}
	}
}