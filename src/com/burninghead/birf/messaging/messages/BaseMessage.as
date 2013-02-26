package com.burninghead.birf.messaging.messages
{
	import com.burninghead.birf.messaging.IMessage;
	/**
	 * Base message class. Implements the barebones of a message.
	 * 
	 * @author tomas.augustinovic
	 */
	public class BaseMessage implements IMessage
	{
		private var _type:String;
		private var _sender:*;
		private var _payload:*;
		
		/**
		 * Setup references to supplied parameters.
		 */
		public function BaseMessage(type:String, sender:*, payload:* = null)
		{
			_type = type;
			_sender = sender;
			_payload = payload;
		}
		
		/**
		 * @inheritDoc
		 */
		public function get type():String
		{
			return _type;
		}

		/**
		 * @inheritDoc
		 */
		public function get sender():*
		{
			return _sender;
		}

		/**
		 * @inheritDoc
		 */
		public function get payload():*
		{
			return _payload;
		}
	}
}
