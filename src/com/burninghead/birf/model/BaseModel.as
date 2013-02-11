package com.burninghead.birf.model
{
	import com.burninghead.birf.messaging.BaseMessage;
	import com.burninghead.birf.messaging.IMessageHandler;
	import com.burninghead.birf.utils.ReflectionUtil;
	import com.burninghead.birf.view.stage2d.mediators.ConsoleMediatorMsgType;

	import org.swiftsuspenders.Injector;


	/**
	 * @author tomas.augustinovic
	 */
	public class BaseModel implements IModel
	{
		private var _injector:Injector;
		private var _messageHandler:IMessageHandler;
		
		public function BaseModel(msgHandler:IMessageHandler)
		{
			_messageHandler = msgHandler;
			
			_injector = new Injector();
			_injector.mapValue(IMessageHandler, _messageHandler);
			_injector.mapValue(IModel, this);
		}
		
		public function getModelPart(proxy:Class, name:String = ""):IProxy
		{
			if (_injector.hasMapping(proxy))
			{
				return _injector.getInstance(proxy, name);
			}
			else
			{
				_messageHandler.send(new BaseMessage(ConsoleMediatorMsgType.PRINT_MESSAGE, this, { msg: "ModelPart is missing. Have you registered it?", category: "warn" }));
				return null;
			}
		}
		
		public function registerProxy(proxy:Class, impl:Class, name:String = ""):void
		{
			if (ReflectionUtil.isType(impl, IProxy))
			{
				_injector.mapSingletonOf(proxy, impl, name);
			}
			else
			{
				throw new Error("Must implement IProxy interface.");
			}
		}
		
		public function unregisterProxy(proxy:Class, name:String = ""):void
		{
			IProxy(_injector.getInstance(proxy, name)).dispose();
			
			_injector.unmap(proxy, name);
		}
	}
}
