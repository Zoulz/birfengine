package com.burninghead.extensions.utils.logger
{
	import com.burninghead.extensions.view.displaylist.mediators.ConsoleMediatorMsgType;
	import com.burninghead.birf.messaging.messages.BaseMessage;
	import com.burninghead.birf.messaging.IMessageHandler;
	import com.burninghead.birf.utils.logger.ILoggerOutput;
	/**
	 * @author tomas.augustinovic
	 */
	public class ConsoleLoggerOutput implements ILoggerOutput
	{
		private var _msgHandler:IMessageHandler;
		
		public function ConsoleLoggerOutput(msgHandler:IMessageHandler)
		{
			_msgHandler = msgHandler;
		}
		
		public function handleLog(message:String, type:String, time:String = ""):void
		{
			_msgHandler.send(new BaseMessage(ConsoleMediatorMsgType.PRINT_MESSAGE, this, { msg: message, category: type }));
		}
	}
}
