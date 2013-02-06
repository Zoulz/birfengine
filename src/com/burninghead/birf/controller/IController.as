package com.burninghead.birf.controller
{
	/**
	 * @author tomas.augustinovic
	 * 
	 * TODO add commands? To not bloat the controller...
	 */
	public interface IController
	{
		/**
		 * Register command with the controller.
		 * @param clazz Command class
		 */
		function registerCommand(clazz:Class):void;
		/**
		 * Execute the specified command.
		 * @param clazz Command class
		 * @param params Parameters supplied to the command
		 */
		function executeCommand(clazz:Class, params:Object):void;
	}
}
