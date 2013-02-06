package com.burninghead.birf.messaging
{
	import com.burninghead.birf.controller.cmds.PrintConsoleCmd;
	import com.burninghead.birf.utils.ReflectionUtil;
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
			printToConsole(ReflectionUtil.getNameOfObject(command, true) + " " + _sender);
			
			_handler.send(new CommandMessage(command, _sender, payload));
		}
		
		private function printToConsole(type:String):void
		{
			_handler.send(new CommandMessage(PrintConsoleCmd, _sender, { msg: "CMD> " + type, category: "msg", color: 0xfa9600 }));
		}
	}
}
