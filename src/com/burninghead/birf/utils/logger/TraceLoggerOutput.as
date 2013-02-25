package com.burninghead.birf.utils.logger
{
	/**
	 * @author tomas.augustinovic
	 */
	public class TraceLoggerOutput implements ILoggerOutput
	{
		public function handleLog(message:String, type:String):void
		{
			var time:String = new Date().toTimeString();
			trace("[" + type + " " + time + "] " + message);
		}
	}
}
