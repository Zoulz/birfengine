package com.burninghead.extensions.displaylist.states
{
	import com.burninghead.birf.states.IState;

	import flash.display.Sprite;


	/**
	 * Incorperates a display list container into the state.
	 * 
	 * @author tomas.augustinovic
	 */
	public interface IDisplayListViewState extends IState
	{
		/**
		 * Return the display object container for the view state.
		 * @return Sprite
		 */
		function get container():Sprite;
	}
}
