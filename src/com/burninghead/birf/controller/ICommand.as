package com.burninghead.birf.controller
{
	/**
	 * Describes a simple executable command.
	 * 
	 * @author tomas.augustinovic
	 */
	public interface ICommand
	{
		/**
		 * Execute the command.
		 * @param params Parameters for the command.
		 */
		function execute(params:*):void;
	}
}
