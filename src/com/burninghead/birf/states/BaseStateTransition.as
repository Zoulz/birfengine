package com.burninghead.birf.states
{
	/**
	 * Base class implementation of a simple transition between two states.
	 * 
	 * @see IStateTransition
	 * 
	 * @author tomas.augustinovic
	 */
	public class BaseStateTransition implements IStateTransition
	{
		private var _fromId:String;
		private var _toId:String;
		
		/**
		 * Sets member variables.
		 * @param fromStateId The state to transition from.
		 * @param toStateId The state to transition to.
		 */
		public function BaseStateTransition(fromStateId:String, toStateId:String)
		{
			_fromId = fromStateId;
			_toId = toStateId;
		}

		/**
		 * Getter method that will return the from-state id.
		 * @return Id of the from-state.
		 */
		public function get fromStateId():String
		{
			return _fromId;
		}

		/**
		 * Returns the to-state id.
		 * @return Id of to-state.
		 */
		public function get toStateId():String
		{
			return _toId;
		}
	}
}
