package com.burninghead.birf.messaging
{
	import com.burninghead.birf.messaging.messages.BaseMessage;
	import com.burninghead.birf.messaging.messages.CommandMessage;
	/**
	 * @author tomas.augustinovic
	 */
	public class Messenger
	{
		private var _handler:IMessageHandler;
		private var _sender:*;
		
		public function Messenger(handler:IMessageHandler, sender:*)
		{
			_handler = handler;
			_sender = sender;
		}
		
		public function sendMessage(type:String, payload:* = null):void
		{
			_handler.send(new BaseMessage(type, _sender, payload));
		}
		
		public function sendCommandMessage(command:Class, payload:* = null):void
		{
			_handler.send(new CommandMessage(command, _sender, payload));
		}
	}
}
