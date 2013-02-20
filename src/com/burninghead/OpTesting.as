package com.burninghead
{
	import com.burninghead.birf.messaging.BirfMessageEvent;
	import com.burninghead.birf.messaging.EventMessageHandler;
	import com.burninghead.birf.messaging.IMessage;
	import com.burninghead.birf.messaging.MessageHandler;
	import com.burninghead.birf.messaging.Messenger;
	import com.burninghead.birf.messaging.SignalMessageHandler;
	import com.burninghead.birf.messaging.TurboSignalMessageHandler;
	import com.burninghead.birf.utils.perf.TimedFunction;
	import com.jacksondunstan.signals.Slot1;

	import flash.display.Sprite;
	import flash.text.TextField;
	/**
	 * @author BigZoulz
	 */
	public class OpTesting extends Sprite implements Slot1
	{
		private var _txt:TextField;
		
		public function OpTesting()
		{
			_txt = new TextField();
			_txt.width = 300;
			addChild(_txt);

			var test:TimedFunction;
			var sigHandler:SignalMessageHandler = new SignalMessageHandler();
			var msgHandler:MessageHandler = new MessageHandler();
			var evtHandler:EventMessageHandler = new EventMessageHandler();
			var tsigHandler:TurboSignalMessageHandler = new TurboSignalMessageHandler();
			var sigMsg:Messenger = new Messenger(sigHandler, null);
			var msg:Messenger = new Messenger(msgHandler, null);
			var evtMsg:Messenger = new Messenger(evtHandler, null);
			var tsigMsg:Messenger = new Messenger(tsigHandler, null);
			
			for (var i:int = 0; i < 100; i++)
			{
				sigHandler.addListener(onTest);
				msgHandler.addListener(onTest);
				evtHandler.addListener(onTestEvent);
				tsigHandler.addListener(this);
			}

			test = new TimedFunction("Signals", 
			function():void
			{
				for (var i:int = 0; i < 1000000; i++)
				{
					sigMsg.sendMessage("test");
				}

			});
			
			log(test.result);
			
			test = new TimedFunction("Function-references", 
			function():void
			{
				for (var i:int = 0; i < 1000000; i++)
				{
					msg.sendMessage("test");
				}
			});
			
			log(test.result);
			
			test = new TimedFunction("Events", 
			function():void
			{
				for (var i:int = 0; i < 1000000; i++)
				{
					evtMsg.sendMessage("test");
				}
			});
			
			log(test.result);
			
			test = new TimedFunction("TurboSignals", 
			function():void
			{
				for (var i:int = 0; i < 1000000; i++)
				{
					tsigMsg.sendMessage("test");
				}
			});
			
			log(test.result);
		}
		
		private function log(txt:String):void
		{
			_txt.appendText(txt);
			_txt.appendText("\n");
		}
		
		private function onTestEvent(event:BirfMessageEvent):void
		{
			
		}
		
		private function onTest(msg:IMessage):void
		{
			
		}

		public function onSignal1(arg:*):void
		{
			var msg:IMessage = arg;
		}
	}
}
