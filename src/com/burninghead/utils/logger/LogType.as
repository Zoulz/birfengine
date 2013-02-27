package com.burninghead.utils.logger
{
	/**
	 * Specifies some default log types used by the logger.
	 * 
	 * @author tomas.augustinovic
	 */
	public class LogType
	{
		/**
		 * Used for informal messages. No severity implications.
		 */
		public static const INFO:String = "INFO";
		/**
		 * Warning. Means that something is fishy and should be observed. Low implications.
		 */
		public static const WARN:String = "WARN";
		/**
		 * Something happened that should not happen. High severity.
		 */
		public static const ERROR:String = "ERROR";
		/**
		 * Means that something was fatal for the continued execution of the application.
		 * With the base implementation of the logger this will throw an error and halt execution.
		 */
		public static const FATAL:String = "FATAL";
	}
}
