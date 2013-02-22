package com.burninghead.birf.messaging
{
	/**
	 * @author tomas.augustinovic
	 */
	public class BaseMessageHandler implements IMessageHandler
	{
		private var _listeners:Vector.<Function>;
		
		public function BaseMessageHandler()
		{
			clearListeners();
		}
		
		public function send(msg:IMessage):void
		{
			var len:int = _listeners.length;
			for (var i:int = 0; i < len; i++)
			{
				_listeners[i](msg);
			}
		}

		public function addListener(listener:*):void
		{
			_listeners.push(listener);
		}

		public function removeListener(listener:*):void
		{
			_listeners.splice(_listeners.indexOf(listener), 1);
		}

		public function clearListeners():void
		{
			_listeners = new Vector.<Function>();
		}
	}
}
