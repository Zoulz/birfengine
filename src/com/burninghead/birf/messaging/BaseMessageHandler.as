package com.burninghead.birf.messaging
{
	/**
	 * Simple implementation of message handler. Good for simpler applications that do not send that much messages. Performance-wise it
	 * does not scale very well though.
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
	 * @author tomas.augustinovic
	 */
	public class BaseMessageHandler implements IMessageHandler
	{
		private var _listeners:Vector.<Function>;
		
		/**
		 * Set default member values.
		 **/
		public function BaseMessageHandler()
		{
			clearListeners();
		}
		
		/**
		 * Send a message to all listening objects.
		 * @param msg Message to send
		 */
		public function send(msg:IMessage):void
		{
			var len:int = _listeners.length;
			for (var i:int = 0; i < len; i++)
			{
				_listeners[i](msg);
			}
		}

		/**
		 * Add a listening method reference to the handler.
		 * @param listener Function reference
		 */
		public function addListener(listener:*):void
		{
			_listeners.push(listener);
		}

		/**
		 * Remove listener from handler.
		 * @param listener Function reference
		 */
		public function removeListener(listener:*):void
		{
			_listeners.splice(_listeners.indexOf(listener), 1);
		}

		/**
		 * Clear all the listeners.
		 */
		public function clearListeners():void
		{
			_listeners = new Vector.<Function>();
		}
	}
}
