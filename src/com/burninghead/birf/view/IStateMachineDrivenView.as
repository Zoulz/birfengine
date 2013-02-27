package com.burninghead.birf.view
{
	/**
	 * Describes a view driven by a state machine.
	 * 
	 * @author tomas.augustinovic
	 */
	public interface IStateMachineDrivenView extends IView
	{
		/**
		 * Initialize the state machine. Added all the states
		 * and transitions required for the application to run.
		 */
		function initStateMachine():void;
	}
}
