package com.burninghead.tests.unit.messaging
{
	import com.burninghead.birf.messaging.IMessage;
	import org.hamcrest.object.instanceOf;
	import org.hamcrest.object.isNotNull;
	import org.flexunit.assertThat;
	import com.burninghead.birf.messaging.messages.BaseMessage;
	import com.burninghead.utils.messaging.handlers.TurboSignalMessageHandler;
	import com.jacksondunstan.signals.Slot1;
	/**
	 * @author tomas.augustinovic
	 */
	public class TurboSignalMessageHandlerTests implements Slot1
	{
		private var _signalHandler:TurboSignalMessageHandler;
		
		[Before]
		public function runBeforeEveryTest():void
		{
			_signalHandler = new TurboSignalMessageHandler();
		}
		
		[After]
		public function runAfterEveryTest():void
		{
			_signalHandler = null;
		}
		
		[Test(description='Add a listener method to the message handler.')]
		public function addListenerTest():void
		{
			_signalHandler.addListener(this);
		}
		
		[Test(description='Remove a listener method from the message handler.')]
		public function removeListenerTest():void
		{
			_signalHandler.removeListener(this);
		}
		
		[Test(description='Clear all listeners from the message handler.')]
		public function clearListenersTest():void
		{
			_signalHandler.clearListeners();
		}
		
		[Test(description='Add a listener method to the message handler and send a message.')]
		public function sendMessageTest():void
		{
			_signalHandler.addListener(this);
			
			_signalHandler.send(new BaseMessage("unit_test", null));
		}

		public function onSignal1(arg:*):void
		{
			assertThat(arg, isNotNull());
			
			assertThat(arg, instanceOf(IMessage));
		}
	}
}
