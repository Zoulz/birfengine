package com.burninghead.extensions.view.stage2d.states
{
	import com.burninghead.birf.states.IState;

	import flash.display.Sprite;


	/**
	 * @author tomas.augustinovic
	 */
	public interface IStage2DViewState extends IState
	{
		/**
		 * Return the display object container for the view state.
		 * @return Sprite
		 */
		function get container():Sprite;
	}
}
