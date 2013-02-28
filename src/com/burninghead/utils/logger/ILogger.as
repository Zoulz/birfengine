package com.burninghead.utils.logger
{
	/**
	 * Describes a logger. Loggers are used to log important information that can occur during execution. Used to debug applications and
	 * should not be included in the final product.
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
