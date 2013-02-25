package com.burninghead.extensions.view
{
	import com.burninghead.birf.view.IView;
	/**
	 * @author tomas.augustinovic
	 */
	public interface IStateMachineDrivenView extends IView
	{
		/**
		 * Initialize the state machine.
		 */
		function initStateMachine():void;
	}
}
