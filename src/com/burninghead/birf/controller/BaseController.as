package com.burninghead.birf.controller
{
	import com.burninghead.birf.messaging.IMessage;
	import com.burninghead.birf.messaging.IMessageHandler;
	import com.burninghead.birf.messaging.messages.CommandMessage;
	import com.burninghead.birf.model.IModel;
	import com.burninghead.birf.view.IView;
	import com.burninghead.utils.ReflectionUtils;
	import com.burninghead.utils.logger.ILogger;
	import com.burninghead.utils.logger.LogType;

	import org.swiftsuspenders.Injector;

	/**
	 * Base class for controller. Adds support for messaging.
	 * 
	 * <pre>
	 * -----------------------------------------------------------------------------------------------------------------------------------------
	 * 
	 * Copyright (c) Tomas Augustinovic 2012-2013
	 *
	 * Licence Agreement (The MIT License)
	 *
	 * Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files
	 * (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge,
	 * publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do
	 * so, subject to the following conditions:
	 *
	 * The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
	 *
	 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
	 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE
	 * FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
	 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
	 * 
	 * -----------------------------------------------------------------------------------------------------------------------------------------
	 * </pre>
	 * 
	 * @see IController
	 * @see ICommand
	 * 
	 * @author tomas.augustinovic
	 */
	public class BaseController implements IController
	{
		private var _injector:Injector;
		private var _view:IView;
		private var _model:IModel;
		private var _messageHandler:IMessageHandler;
		private var _logger:ILogger;
		
		/**
		 * Set references to supplied objects. Create dependency injector and listen for messages.
		 * @param logger Reference to logger instance.
		 * @param view Reference to view instance.
		 * @param model Reference to model instance.
		 * @param messageHandler Reference to message handler instance.
		 */
		public function BaseController(view:IView, model:IModel, messageHandler:IMessageHandler, logger:ILogger = null)
		{
			_view = view;
			_model = model;
			_messageHandler = messageHandler;
			_logger = logger;
			
			//	Map injector with values.
			_injector = new Injector();
			_injector.map(IView).toValue(_view);
			_injector.map(IModel).toValue(_model);
			_injector.map(IMessageHandler).toValue(_messageHandler);
			_injector.map(ILogger).toValue(_logger);
			
			//	Listen for messages.
			_messageHandler.addListener(onMessageReceived);
		}
		
		/**
		 * @inheritDoc
		 */
		public function executeCommand(clazz:Class, params:Object):void
		{
			if (_injector.hasMapping(clazz))
			{
				var cmd:ICommand = _injector.getInstance(clazz);
				cmd.execute(params);
			}
			else
			{
				var msg:String = "";
				if (clazz != null)
				{
					msg = "Command '" + ReflectionUtils.getNameOfObject(clazz, true) + "' is missing. Have you registered it?";
				}
				else
				{
					msg = "Command is null.";
				}
				
				_logger.log(msg, LogType.WARN);
			}
		}
		
		/**
		 * @inheritDoc
		 */
		public function registerCommand(clazz:Class):void
		{
			if (ReflectionUtils.isType(clazz, ICommand))
			{
				_injector.map(clazz).asSingleton();
			}
			else
			{
				_logger.log("Must implement ICommand interface.", LogType.FATAL);
			}
		}
		
		/**
		 * Handler for receiving messages. If the supplied message is a command
		 * message then try to execute it.
		 * @param msg Received message.
		 */
		protected function onMessageReceived(msg:IMessage):void
		{
			if (msg is CommandMessage)
			{
				executeCommand(CommandMessage(msg).command, msg.payload);
			}
		}
	}
}
