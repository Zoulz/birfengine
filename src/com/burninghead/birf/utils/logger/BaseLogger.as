package com.burninghead.birf.utils.logger
{
	/**
	 * @author tomas.augustinovic
	 */
	public class BaseLogger implements ILogger
	{
		private var _outputHandlers:Vector.<ILoggerOutput>;
		
		public function BaseLogger()
		{
			_outputHandlers = new Vector.<ILoggerOutput>();
		}

		public function log(message:String, type:String):void
		{
			var len:int = _outputHandlers.length;
			
			for (var i:int = 0; i < len; i++)
			{
				_outputHandlers[i].handleLog(message, type);
			}
			
			if (type == LogType.FATAL)
			{
				throw new Error(message);
			}
		}

		public function registerOutput(output:ILoggerOutput):void
		{
			if (output != null)
			{
				_outputHandlers.push(output);
			}
		}

		public function unregisterOutput(output:ILoggerOutput):void
		{
			var idx:int = _outputHandlers.indexOf(output);
			if (idx != -1)
			{
				_outputHandlers.splice(idx, 1);
			}
		}
	}
}
