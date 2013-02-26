package com.burninghead.birf.utils.logger
{
	/**
	 * Describes a logger. Loggers are used to log important information that
	 * can occur during execution. Used to debug applications and should not
	 * be included in the final product.
	 * 
	 * @see LogType
	 * 
	 * @author tomas.augustinovic
	 */
	public interface ILogger
	{
		/**
		 * Logs a message. Will be invoked for each output handler.
		 * @param message A textual message describing the situation.
		 * @param type Messages can be categorized by type based on the severity of the information.
		 */
		function log(message:String, type:String):void;
		/**
		 * Register a output handler.
		 * @param output Instance of output handler.
		 */
		function registerOutput(output:ILoggerOutput):void;
		/**
		 * Remove output handler from logger.
		 * @param output Instance of output handler.
		 */
		function unregisterOutput(output:ILoggerOutput):void;
	}
}
