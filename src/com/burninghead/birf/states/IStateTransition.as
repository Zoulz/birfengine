package com.burninghead.birf.states
{
	/**
	 * Describes a simple transition between two states.
	 * 
	 * @author tomas.augustinovic
	 */
	public interface IStateTransition
	{
		/**
		 * Id of state to transition from.
		 * @return String
		 */
		function get fromStateId():String;
		/**
		 * Id of state to transition to.
		 * @return String
		 */
		function get toStateId():String;
	}
}
