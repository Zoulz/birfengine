package com.burninghead.tests.unit.messaging
{
	import com.burninghead.birf.messaging.messages.BaseMessage;
	import com.burninghead.birf.messaging.IMessage;
	import com.burninghead.birf.messaging.handlers.SignalMessageHandler;
	/**
	 * @author tomas.augustinovic
	 */
	public class SignalMessageHandlerTests
	{
		private var _signalHandler:SignalMessageHandler;
		
		[Before]
		public function runBeforeEveryTest():void
		{
			_signalHandler = new SignalMessageHandler();
		}
		
		[After]
		public function runAfterEveryTest():void
		{
			_signalHandler = null;
		}
		
		[Test]
		public function addListenerTest():void
		{
			_signalHandler.addListener(onMessageListener);
		}
		
		[Test]
		public function removeListenerTest():void
		{
			_signalHandler.removeListener(onMessageListener);
		}
		
		[Test]
		public function clearListenersTest():void
		{
			_signalHandler.clearListeners();
		}
		
		[Test]
		public function sendMessageTest():void
		{
			_signalHandler.addListener(onMessageListener);
			
			_signalHandler.send(new BaseMessage("unit_test", null));
		}
		
		private function onMessageListener(message:IMessage):void
		{
			//	NO-OP
		}
	}
}
