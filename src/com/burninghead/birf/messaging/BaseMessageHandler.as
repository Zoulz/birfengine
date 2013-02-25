package com.burninghead.birf.messaging
{
	/**
	 * Simple implementation of message handler. Good for simpler
	 * applications that do not send that much messages.
	 * Performance-wise it does not scale very well though.
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
