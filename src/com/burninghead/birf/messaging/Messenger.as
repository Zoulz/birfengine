package com.burninghead.birf.messaging
{
	import com.burninghead.birf.messaging.messages.BaseMessage;
	import com.burninghead.birf.messaging.messages.CommandMessage;
	/**
	 * Helper class that makes sending messages somewhat easier.
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
