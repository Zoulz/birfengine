package com.burninghead.utils.logger
{
	/**
	 * Base class logger. Simply keeps references to output handlers that are executed for each logged message.
	 * 
	 * <pre>
	 * -----------------------------------------------------------------------------------------------------------------------------------------
	 * 
	 * Copyright (c) Tomas Augustinovic 2012-2013
	 *
	 * Licence Agreement (The MIT License)
	 *
	 * Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files
	 * (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge,
	 * publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do
	 * so, subject to the following conditions:
	 *
	 * The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
	 *
	 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
	 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE
	 * FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
	 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
	 * 
	 * -----------------------------------------------------------------------------------------------------------------------------------------
	 * </pre>
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
