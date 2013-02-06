package com.burninghead.birf.controller
{
	import com.burninghead.birf.messaging.CommandMessage;
	import com.burninghead.birf.messaging.IMessage;
	import com.burninghead.birf.messaging.IMessageHandler;
	import com.burninghead.birf.model.IModel;
	import com.burninghead.birf.utils.ReflectionUtil;
	import com.burninghead.birf.view.IView;

	import org.swiftsuspenders.Injector;


	/**
	 * @author BigZoulz
	 */
	public class BaseController implements IController
	{
		private var _injector:Injector;
		
		private var _view:IView;
		private var _model:IModel;
		private var _messageHandler:IMessageHandler;
		
		public function BaseController(view:IView, model:IModel, messageHandler:IMessageHandler)
		{
			_view = view;
			_model = model;
			_messageHandler = messageHandler;
			
			_injector = new Injector();
			_injector.mapValue(IView, _view);		//	TODO is it a good idea to expose both view and model to commands?
			_injector.mapValue(IModel, _model);		//	Maybe we should have view/model specific commands?
			_injector.mapValue(IMessageHandler, _messageHandler);
			
			_messageHandler.listener.add(onMessageReceived);
		}
		
		public function executeCommand(clazz:Class, params:Object):void
		{
			if (_injector.hasMapping(clazz))
			{
				var cmd:ICommand = _injector.getInstance(clazz);
				cmd.execute(params);
			}
			else
			{
				_view.console.println("CONTROLLER> Command is missing. Have you registered it?", "error", 0xff0000);
			}
		}
		
		protected function onMessageReceived(msg:IMessage):void
		{
			if (msg is CommandMessage)
			{
				executeCommand(CommandMessage(msg).command, msg.payload);
			}
		}
		
		public function registerCommand(clazz:Class):void
		{
			if (ReflectionUtil.isType(clazz, ICommand))
			{
				_injector.mapSingleton(clazz);
			}
			else
			{
				throw new Error("Must implement ICommand interface.");
			}
		}
	}
}
