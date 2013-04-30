package com.burninghead.birf.states
{
import com.burninghead.utils.ReflectionUtils;
import com.burninghead.utils.logger.ILogger;
	import com.burninghead.utils.logger.LogType;

import flash.system.ApplicationDomain;

import org.osflash.signals.ISignal;
	import org.osflash.signals.Signal;

	import flash.utils.Dictionary;
	/**
	 * Base class for state machine.
	 * 
	 * <pre>
	 * -----------------------------------------------------------------------------------------------------------------------------------------
	 * 
	 * Copyright (c) Tomas Augustinovic 2012-2013
	 *
	 * Licence Agreement (The MIT License)
	 *
	 * Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files
	 * (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge,
	 * publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do
	 * so, subject to the following conditions:
	 *
	 * The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
	 *
	 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
	 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE
	 * FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
	 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
	 * 
	 * -----------------------------------------------------------------------------------------------------------------------------------------
	 * </pre>
	 * 
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

		public function registerXml(xml:XML):void
		{
			for each (var node:XML in xml.children())
			{
				if (node.localName().toString() == "state")
				{
					var state:IState = ReflectionUtils.getInstanceByName(node.@type.toString());
					registerState(node.@id.toString(), state);
				}
				else if (node.localName().toString() == "transition")
				{
					var trans:BaseStateTransition = new BaseStateTransition(node.@from.toString(), node.@to.toString());
					registerTransition(node.@id.toString(), trans);
				}
			}
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
