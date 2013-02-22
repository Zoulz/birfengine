package com.burninghead.birf.utils.logger
{
	/**
	 * @author tomas.augustinovic
	 */
	public interface ILoggerOutput
	{
		function handleLog(message:String, type:String):void;
	}
}
