package com.burninghead.birf.messaging
{
	import com.burninghead.birf.messaging.messages.BaseMessage;
	import com.burninghead.birf.messaging.messages.CommandMessage;
	/**
	 * Helper class that makes sending messages somewhat easier.
	 * 
	 * @author tomas.augustinovic
	 */
	public class Messenger
	{
		private var _handler:IMessageHandler;
		private var _sender:*;
		
		/**
		 * Set references to supplied objects.
		 * @param handler Message handler reference to use for messaging.
		 * @param sender Object that is the sender of messages.
		 */
		public function Messenger(handler:IMessageHandler, sender:*)
		{
			_handler = handler;
			_sender = sender;
		}
		
		/**
		 * Send a standard base message with a string type.
		 * @param type String type name for the message.
		 * @param payload Payload object that is sent together with the message.
		 */
		public function sendMessage(type:String, payload:* = null):void
		{
			_handler.send(new BaseMessage(type, _sender, payload));
		}
		
		/**
		 * Send a message that contains a command.
		 * @param command Class of the command to execute.
		 * @param payload Payload object that is sent together with the message.
		 */
		public function sendCommandMessage(command:Class, payload:* = null):void
		{
			_handler.send(new CommandMessage(command, _sender, payload));
		}
	}
}
