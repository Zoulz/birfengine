package com.burninghead.birf.utils.logger
{
	/**
	 * Basic trace output for the logger.
	 * 
	 * @author tomas.augustinovic
	 */
	public class TraceLoggerOutput implements ILoggerOutput
	{
		/**
		 * Trace the message with time stamp and message type.
		 */
		public function handleLog(message:String, type:String, time:String = ""):void
		{
			trace("[" + time + "|" + type + "] " + message);
		}
	}
}
