package com.burninghead.birf.view.stage2d.states
{
	import com.burninghead.birf.view.states.IViewState;

	import flash.display.Sprite;


	/**
	 * @author tomas.augustinovic
	 */
	public interface IStage2DViewState extends IViewState
	{
		/**
		 * Return the display object container for the view state.
		 * @return Sprite
		 */
		function get container():Sprite;
	}
}
