package com.burninghead.tests.performance.messaging
{
	import com.burninghead.birf.messaging.BaseMessageHandler;
	import com.burninghead.birf.messaging.IMessage;
	import com.burninghead.birf.messaging.messages.BaseMessage;
	import com.burninghead.utils.messaging.BirfMessageEvent;
	import com.burninghead.utils.messaging.handlers.EventMessageHandler;
	import com.burninghead.utils.messaging.handlers.SignalMessageHandler;
	import com.burninghead.utils.messaging.handlers.TurboSignalMessageHandler;
	import com.burninghead.utils.performance.PerfTestCase;
	import com.jacksondunstan.signals.Slot1;
	/**
	 * @author tomas.augustinovic
	 */
	public class MessageHandlerTests extends PerfTestCase implements Slot1
	{
		private var _signalHandler:SignalMessageHandler;
		private var _defHandler:BaseMessageHandler;
		private var _tsignalHandler:TurboSignalMessageHandler;
		private var _eventHandler:EventMessageHandler;
		
		public function MessageHandlerTests()
		{
			super();
			
			_signalHandler = new SignalMessageHandler();
			_defHandler = new BaseMessageHandler();
			_tsignalHandler = new TurboSignalMessageHandler();
			_eventHandler = new EventMessageHandler();
			
			for (var i:int = 0; i < 50; i++)
			{
				_signalHandler.addListener(onMessage);
				_defHandler.addListener(onMessage);
				_tsignalHandler.addListener(this);
				_eventHandler.addListener(onEventMessage);
			}
			
			//	Push tests.
			tests.push({ name: "SignalMessageHandler", func: signalHandlerTest });
			tests.push({ name: "DefaultMessageHandler", func: defHandlerTest });
			tests.push({ name: "EventMessageHandler", func: eventHandlerTest });
			tests.push({ name: "TurboSignalMessageHandler", func: tsignalHandlerTest });
		}
		
		private function signalHandlerTest():void
		{
			_signalHandler.send(new BaseMessage("perf_test", null));
		}
		
		private function defHandlerTest():void
		{
			_defHandler.send(new BaseMessage("perf_test", null));
		}
		
		private function eventHandlerTest():void
		{
			_eventHandler.send(new BaseMessage("perf_test", null));
		}
		
		private function tsignalHandlerTest():void
		{
			_tsignalHandler.send(new BaseMessage("perf_test", null));
		}
		
		private function onMessage(message:IMessage):void
		{
		}
		
		private function onEventMessage(event:BirfMessageEvent):void
		{
		}

		public function onSignal1(arg:*):void
		{
		}
	}
}
