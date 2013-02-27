package com.burninghead.tests.unit.messaging
{
	import com.burninghead.birf.messaging.IMessage;
	import com.burninghead.birf.messaging.messages.BaseMessage;
	import com.burninghead.utils.messaging.handlers.SignalMessageHandler;
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
		
		[Test(description='Add a listener method to the message handler.')]
		public function addListenerTest():void
		{
			_signalHandler.addListener(onMessageListener);
		}
		
		[Test(description='Remove a listener method from the message handler.')]
		public function removeListenerTest():void
		{
			_signalHandler.removeListener(onMessageListener);
		}
		
		[Test(description='Clear all listeners from the message handler.')]
		public function clearListenersTest():void
		{
			_signalHandler.clearListeners();
		}
		
		[Test(description='Add a listener method to the message handler and send a message.')]
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
