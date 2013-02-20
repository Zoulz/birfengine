package com.burninghead.birf.messaging.handlers
{
	import com.burninghead.birf.messaging.BirfMessageEvent;
	import com.burninghead.birf.messaging.IMessage;
	import com.burninghead.birf.messaging.IMessageHandler;

	import flash.events.EventDispatcher;
	/**
	 * @author tomas.augustinovic
	 */
	public class EventMessageHandler implements IMessageHandler
	{
		private var _dispatcher:EventDispatcher;
		
		public function EventMessageHandler()
		{
			clearListeners();
		}
		
		public function send(msg:IMessage):void
		{
			_dispatcher.dispatchEvent(new BirfMessageEvent(msg));
		}

		public function addListener(listener:*):void
		{
			_dispatcher.addEventListener(BirfMessageEvent.BIRF_MESSAGE, listener, false, 0, true);
		}

		public function removeListener(listener:*):void
		{
			_dispatcher.removeEventListener(BirfMessageEvent.BIRF_MESSAGE, listener);
		}

		public function clearListeners():void
		{
			_dispatcher = null;
			_dispatcher = new EventDispatcher();
		}
	}
}
