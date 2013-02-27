package com.burninghead.utils.logger
{
	/**
	 * Base class for logger. Simply keeps references to output
	 * handlers that are executed for each logged message.
	 * 
	 * @see LogType
	 * 
	 * @author tomas.augustinovic
	 */
	public class BaseLogger implements ILogger
	{
		private var _outputHandlers:Vector.<ILoggerOutput>;
		
		/**
		 * Set default member variables.
		 */
		public function BaseLogger()
		{
			_outputHandlers = new Vector.<ILoggerOutput>();
		}

		/**
		 * @inheritDoc
		 */
		public function log(message:String, type:String):void
		{
			//	Get string representation of current time.
			var cur:Date = new Date();
			var time:String = cur.getHours().toString() + ":" + cur.getMinutes().toString() + ":" + cur.getSeconds().toString() + ":" + cur.getMilliseconds().toString();
			
			//	Loop through the output handlers.
			var len:int = _outputHandlers.length;
			for (var i:int = 0; i < len; i++)
			{
				_outputHandlers[i].handleLog(message, type, time);
			}
			
			//	If the message was fatal, throw actual flash error.
			if (type == LogType.FATAL)
			{
				throw new Error(message);
			}
		}

		/**
		 * @inheritDoc
		 */
		public function registerOutput(output:ILoggerOutput):void
		{
			if (output != null)
			{
				_outputHandlers.push(output);
			}
		}

		/**
		 * @inheritDoc
		 */
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
