package com.burninghead.birf.controller
{
	/**
	 * @author tomas.augustinovic
	 */
	public interface ICommand
	{
		/**
		 * Execute the command.
		 * @param params Parameters for the command
		 */
		function execute(params:*):void;
	}
}
