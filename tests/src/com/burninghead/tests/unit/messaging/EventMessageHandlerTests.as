package com.burninghead.tests.unit.messaging
{
	import com.burninghead.birf.messaging.IMessage;
	import com.burninghead.birf.messaging.messages.BaseMessage;
	import com.burninghead.utils.messaging.BirfMessageEvent;
	import com.burninghead.utils.messaging.handlers.EventMessageHandler;

	import org.flexunit.assertThat;
	import org.hamcrest.object.instanceOf;
	import org.hamcrest.object.isNotNull;
	/**
	 * @author tomas.augustinovic
	 */
	public class EventMessageHandlerTests
	{
		private var _signalHandler:EventMessageHandler;
		
		[Before]
		public function runBeforeEveryTest():void
		{
			_signalHandler = new EventMessageHandler();
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
		
		private function onMessageListener(event:BirfMessageEvent):void
		{
			assertThat(event.msg, isNotNull());
			
			assertThat(event.msg, instanceOf(IMessage));
		}
	}
}
