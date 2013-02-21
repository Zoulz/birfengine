package com.burninghead.birf.controller
{
	import com.jacksondunstan.signals.Slot1;
	import com.burninghead.birf.messaging.IMessage;
	import com.burninghead.birf.messaging.IMessageHandler;
	import com.burninghead.birf.messaging.messages.BaseMessage;
	import com.burninghead.birf.messaging.messages.CommandMessage;
	import com.burninghead.birf.model.IModel;
	import com.burninghead.birf.utils.ReflectionUtil;
	import com.burninghead.birf.view.IView;
	import com.burninghead.birf.view.stage2d.mediators.ConsoleMediatorMsgType;

	import org.swiftsuspenders.Injector;


	/**
	 * @author BigZoulz
	 */
	public class BaseController implements IController, Slot1
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
			_injector.map(IView).toValue(_view);
			_injector.map(IModel).toValue(_model);
			_injector.map(IMessageHandler).toValue(_messageHandler);
			
			_messageHandler.addListener(onMessageReceived);
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
				var msg:String = "";
				if (clazz != null)
				{
					msg = "Command '" + ReflectionUtil.getNameOfObject(clazz, true) + "' is missing. Have you registered it?";
				}
				else
				{
					msg = "Command is null.";
				}
				
				_messageHandler.send(new BaseMessage(ConsoleMediatorMsgType.PRINT_MESSAGE, this, { msg: msg, category: "warn" }));
			}
		}
		
		protected function onMessageReceived(msg:IMessage):void
		{
			if (msg is CommandMessage)
			{
				executeCommand(CommandMessage(msg).command, msg.payload);
			}
		}
		
		public function onSignal1(arg:*):void
		{
			onMessageReceived(arg as IMessage);
		}
		
		public function registerCommand(clazz:Class):void
		{
			if (ReflectionUtil.isType(clazz, ICommand))
			{
				_injector.map(clazz).asSingleton();
			}
			else
			{
				throw new Error("Must implement ICommand interface.");
			}
		}
	}
}
