package com.burninghead.birf.messaging
{
	import org.osflash.signals.ISignal;
	import org.osflash.signals.Signal;
	/**
	 * @author tomas.augustinovic
	 */
	public class BaseMessageHandler implements IMessageHandler
	{
		private var _msg:Signal;
		
		public function BaseMessageHandler()
		{
			_msg = new Signal();
		}
		
		/**
		 * @inheritDoc
		 */
		public function send(msg:IMessage):void
		{
			_msg.dispatch(msg);
		}

		/**
		 * @inheritDoc
		 */
		public function get listener():ISignal
		{
			return _msg;
		}
	}
}
