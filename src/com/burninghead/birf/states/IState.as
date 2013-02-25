package com.burninghead.birf.states
{
	import org.osflash.signals.ISignal;
	/**
	 * @author tomas.augustinovic
	 */
	public interface IState
	{
		/**
		 * Called when the state machine changes to this state.
		 * Called after the previous state's exit has run.
		 */
		function enter():void;
		/**
		 * Called when the state machine changes to another state from
		 * this state. Called before the new state's enter is invoked.
		 */
		function exit():void;
		/**
		 * Update is called when the state machine receives a update
		 * request. The interval of updates is completely up to the
		 * state machine implementation.
		 */
		function update():void;
		/**
		 * Return signal that indicates if this state wants to transition
		 * into a new state.
		 */
		function get transition():ISignal;
	}
}
