package com.burninghead.birf.messaging.messages
{
	import com.burninghead.birf.messaging.IMessage;
	/**
	 * @author tomas.augustinovic
	 */
	public class BaseMessage implements IMessage
	{
		private var _type:String;
		private var _sender:*;
		private var _payload:*;
		
		public function BaseMessage(type:String, sender:*, payload:* = null)
		{
			_type = type;
			_sender = sender;
			_payload = payload;
		}
		
		public function get type():String
		{
			return _type;
		}

		public function get sender():*
		{
			return _sender;
		}

		public function get payload():*
		{
			return _payload;
		}
	}
}
