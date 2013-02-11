package com.burninghead.birf.messaging
{
	import com.burninghead.birf.utils.ReflectionUtil;
	import com.burninghead.birf.view.stage2d.mediators.ConsoleMediatorMsgType;
	/**
	 * @author tomas.augustinovic
	 */
	public class Messenger
	{
		private var _handler:IMessageHandler;
		private var _sender:*;
		
		public function Messenger(handler:IMessageHandler, sender:*)
		{
			_handler = handler;
			_sender = sender;
		}
		
		public function sendMessage(type:String, payload:* = null):void
		{
			printToConsole(type + " " + _sender);
			
			_handler.send(new BaseMessage(type, _sender, payload));
		}
		
		public function sendCommandMessage(command:Class, payload:* = null):void
		{
			var msg:String = "";
			if (command != null)
			{
				msg = ReflectionUtil.getNameOfObject(command, true) + ", from " + _sender;
			}
			else
			{
				msg = "null, from " + _sender;
			}
			
			printToConsole(msg);
			
			_handler.send(new CommandMessage(command, _sender, payload));
		}
		
		private function printToConsole(type:String):void
		{
			_handler.send(new BaseMessage(ConsoleMediatorMsgType.PRINT_MESSAGE, _sender, { msg: type, category: "command" }));
		}
	}
}
