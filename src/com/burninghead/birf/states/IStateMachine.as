package com.burninghead.birf.states
{
	import org.osflash.signals.ISignal;

	/**
	 * Describes a state machine. States and transitions can be registered and removed. The state machine can also be updated.
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
	public interface IStateMachine
	{
		/**
		 * Updates the current state.
		 */
		function update():void;
		/**
		 * Change state to that of the supplied id.
		 * @param id Id of state to change to
		 */
		function changeState(id:String):void;
		/**
		 * Register a state with the state machine.
		 * @param id Id of the state
		 * @param state State object
		 */
		function registerState(id:String, state:IState):void;
		/**
		 * Remove state from the state machine.
		 * @param id Id of the state to remove
		 */
		function unregisterState(id:String):void;
		/**
		 * Register a state to state transition.
		 * @param id Id of the transition
		 * @param transition Transition definition object
		 */
		function registerTransition(id:String, transition:IStateTransition):void;
		/**
		 * Remove transition from state machine.
		 * @param id Id of the transition to remove
		 */
		function unregisterTransition(id:String):void;
		/**
		 * Signal that is dispatched when a state change occurs.
		 * @return ISignal
		 */
		function get stateChanged():ISignal;
		/**
		 * Return the id of the currently active state.
		 * @return String
		 */
		function get stateId():String;
	}
}
