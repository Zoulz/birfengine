package com.burninghead.birf.messaging.handlers
{
	import com.burninghead.birf.messaging.IMessage;
	import com.burninghead.birf.messaging.IMessageHandler;

	import org.osflash.signals.ISignal;
	import org.osflash.signals.Signal;
	/**
	 * @author tomas.augustinovic
	 */
	public class SignalMessageHandler implements IMessageHandler
	{
		private var _msg:Signal;
		
		public function SignalMessageHandler()
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

		public function addListener(listener:*):void
		{
			_msg.add(listener);
		}

		public function removeListener(listener:*):void
		{
			_msg.remove(listener);
		}

		public function clearListeners():void
		{
			_msg.removeAll();
		}
	}
}
