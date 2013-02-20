package com.burninghead.birf.messaging.messages
{
	import com.burninghead.birf.messaging.IMessage;
	/**
	 * Message that supplies a command instead of a textual message.
	 * 
	 * @author tomas.augustinovic
	 */
	public class CommandMessage implements IMessage
	{
		private var _command:Class;
		private var _sender:*;
		private var _payload:*;
		
		public function CommandMessage(command:Class, sender:*, payload:* = null)
		{
			_command = command;
			_sender = sender;
			_payload = payload;
		}
		
		public function get type():String
		{
			return "";
		}

		public function get sender():*
		{
			return _sender;
		}

		public function get payload():*
		{
			return _payload;
		}

		public function get command():Class
		{
			return _command;
		}
	}
}
