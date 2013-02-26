package com.burninghead.birf.states
{
	import org.osflash.signals.ISignal;

	/**
	 * Describes a state machine. States and transitions can be registered
	 * and removed. The state machine can also be updated.
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
