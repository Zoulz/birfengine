package com.burninghead.extensions.utils.list.items
{
	import com.burninghead.birf.messaging.IMessage;
	import com.burninghead.birf.messaging.IMessageHandler;
	import com.burninghead.birf.utils.list.IListItem;
	/**
	 * @author BigZoulz
	 */
	public class MessageItem implements IListItem
	{
		private var _handler:IMessageHandler;
		private var _callback:Function;
		private var _type:String;
		private var _sender:*;
		
		public function MessageItem(messageHandler:IMessageHandler, type:String, sender:*)
		{
			_handler = messageHandler;
			_type = type;
			_sender = sender;
		}
		
		private function onMessageReceived(msg:IMessage):void
		{
			if (msg.type == _type && msg.sender == _sender)
			{
				_handler.removeListener(onMessageReceived);
				
				_callback();
			}
		}
		
		public function execute(callback:Function):void
		{
			_callback = callback;
			_handler.addListener(onMessageReceived);
		}

		public function abort():void
		{
			_handler.removeListener(onMessageReceived);
			
			_callback();
		}
	}
}
