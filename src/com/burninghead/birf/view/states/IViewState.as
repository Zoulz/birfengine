package com.burninghead.birf.view.states
{
	import org.osflash.signals.ISignal;
	/**
	 * @author tomas.augustinovic
	 */
	public interface IViewState
	{
		/**
		 * This method is invoked when transitioning to the view state.
		 * @param params Payload
		 */
		function enter(params:Object):void;
		/**
		 * Method is invoked when transitioning out of the view state.
		 */
		function exit():void;
		/**
		 * Signal listener for when a view state change has taken place.
		 * @return ISignal
		 */
		function get changeState():ISignal;
	}
}
