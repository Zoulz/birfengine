package com.burninghead.birf.messaging.messages
{
	import com.burninghead.birf.messaging.IMessage;

	/**
	 * Message that supplies a command.
	 * 
	 * @author tomas.augustinovic
	 */
	public class CommandMessage extends BaseMessage implements IMessage
	{
		private var _command:Class;
		
		/**
		 * Takes a command class instead of type string.
		 * @param command Class for the command to execute
		 * @param sender Reference to object that is sending the message
		 * @param payload Object passed along with the message that can contain data
		 */
		public function CommandMessage(command:Class, sender:*, payload:* = null)
		{
			_command = command;
			
			super("", sender, payload);
		}
		
		/**
		 * Return command class.
		 * @return Class
		 */
		public function get command():Class
		{
			return _command;
		}
	}
}
