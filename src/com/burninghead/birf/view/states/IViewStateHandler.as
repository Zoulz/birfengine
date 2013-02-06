package com.burninghead.birf.view.states
{
	import org.osflash.signals.ISignal;
	/**
	 * @author tomas.augustinovic
	 */
	public interface IViewStateHandler
	{
		/**
		 * Registers view state definitions with the handler.
		 * @param states List containing view state definitions
		 * @param initialStateIndex The initial view state to start at
		 */
		function registerViewStates(states:Vector.<ViewStateDefinition>, initialStateIndex:uint = 0):void;
		/**
		 * Removes the view state of the specified index in the handler.
		 * @param stateIndex Index of view state
		 */
		function unregisterViewState(stateIndex:uint):void;
		/**
		 * Return the current active view state.
		 * @return IViewState
		 */
		function get currentState():IViewState;
		/**
		 * Return signal listener for when view state changes occur.
		 * @return ISignal
		 */
		function get stateChanged():ISignal;
	}
}
