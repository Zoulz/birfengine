package com.burninghead.birf.states
{
	import com.burninghead.birf.utils.logger.LogType;
	import com.burninghead.birf.utils.logger.ILogger;
	import org.osflash.signals.Signal;
	import org.osflash.signals.ISignal;
	import flash.utils.Dictionary;
	/**
	 * @author tomas.augustinovic
	 */
	public class BaseStateMachine implements IStateMachine
	{
		protected var _transitions:Dictionary;
		
		private var _states:Dictionary;
		private var _currentState:IState;
		private var _currentStateId:String;
		private var _stateChanged:Signal;
		private var _logger:ILogger;
		
		public function BaseStateMachine(logger:ILogger = null)
		{
			_states = new Dictionary();
			_stateChanged = new Signal();
			_transitions = new Dictionary();
			_currentStateId = "";
			_currentState = null;
			_logger = logger;
		}

		public function changeState(id:String):void
		{
			//	Exit old state (if available).
			if (_currentState)
			{
				_currentState.exit();
			}

			//	Set the new state.
			var oldState:IState = _currentState;
			_currentState = _states[id] as IState;
			
			//	Enter the new state.
			if (_currentState)
			{
				_currentStateId = id;

				_stateChanged.dispatch(oldState, _currentState);
				
				_currentState.enter();
			}
			else
			{
				if (_logger)
				{
					_logger.log("The target transition state is not valid.", LogType.ERROR);
				}
			}
		}

		public function registerState(id:String, state:IState):void
		{
			if (id != null && state != null)
			{
				state.transition.add(onStateTransition);
				_states[id] = state;
			}
		}
		
		public function unregisterState(id:String):void
		{
			_states[id] = null;
		}
		
		public function registerTransition(id:String, transition:IStateTransition):void
		{
			if (id != null && transition != null)
			{
				_transitions[id] = transition;
			}
		}

		public function unregisterTransition(id:String):void
		{
			_transitions[id] = null;
		}
		
		protected function onStateTransition(state:IState, transitionId:String):void
		{
			var transition:IStateTransition = _transitions[transitionId] as IStateTransition;
			
			if (_states[transition.fromStateId] == state)
			{
				changeState(transition.toStateId);
			}
		}

		public function update():void
		{
			if (_currentState != null)
			{
				_currentState.update();
			}
		}

		public function get stateChanged():ISignal
		{
			return _stateChanged;
		}

		public function get stateId():String
		{
			return _currentStateId;
		}
	}
}
