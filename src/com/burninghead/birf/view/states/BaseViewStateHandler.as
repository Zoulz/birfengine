package com.burninghead.birf.view.states
{
	import org.osflash.signals.ISignal;
	import org.osflash.signals.Signal;
	/**
	 * @author tomas.augustinovic
	 */
	public class BaseViewStateHandler implements IViewStateHandler
	{
		private var _currentState:IViewState;
		private var _stateChanged:Signal;
		private var _states:Vector.<IViewState>;
		
		public function BaseViewStateHandler()
		{
			_stateChanged = new Signal();
			_currentState = null;
			_states = new Vector.<IViewState>();
		}

		public function registerViewStates(states:Vector.<ViewStateDefinition>, initialStateIndex:uint = 0):void
		{
			for each (var def:ViewStateDefinition in states)
			{
				var state:IViewState = new def.State();
				
				//	Inject dependencies.
				if (def.injector != null)
				{
					def.injector.injectInto(state);
				}
				
				//	Listen for state change signal.
				state.changeState.add(changeViewState);
				
				_states[def.index] = state;
			}
			
			//	Change to initial view state.
			changeViewState(initialStateIndex);
		}

		public function unregisterViewState(stateIndex:uint):void
		{
			//	TODO implement
		}
		
		private function changeViewState(newState:uint, params:Object = null):void
		{
			_stateChanged.dispatch(_states[newState]);
			
			if (_currentState != null)
			{
				_currentState.exit();
			}
			
			_currentState = _states[newState];
			
			_currentState.enter(params);
		}

		public function get currentState():IViewState
		{
			return _currentState;
		}

		public function get stateChanged():ISignal
		{
			return _stateChanged;
		}
	}
}
