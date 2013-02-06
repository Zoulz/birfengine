package com.burninghead.birf.controller
{
	/**
	 * @author BigZoulz
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
