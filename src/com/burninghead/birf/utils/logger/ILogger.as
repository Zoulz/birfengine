package com.burninghead.birf.utils.logger
{
	/**
	 * @author tomas.augustinovic
	 */
	public interface ILogger
	{
		function log(message:String, type:String):void;
		function registerOutput(output:ILoggerOutput):void;
		function unregisterOutput(output:ILoggerOutput):void;
	}
}
