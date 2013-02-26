package com.burninghead.birf.utils.logger
{
	/**
	 * Describes a logger output handler. Simply handles the message that
	 * the logger supplies.
	 * 
	 * @see LogType
	 * 
	 * @author tomas.augustinovic
	 */
	public interface ILoggerOutput
	{
		/**
		 * Handle a message coming from the logger.
		 * @param message A textual message describing the situation.
		 * @param type Messages can be categorized by type based on the severity of the information.
		 * @param time String representation of time when the message was logged.
		 */
		function handleLog(message:String, type:String, time:String = ""):void;
	}
}
