package com.burninghead.birf.model
{
	import com.burninghead.birf.messaging.IMessageHandler;
	import com.burninghead.birf.utils.ReflectionUtil;

	import org.swiftsuspenders.Injector;


	/**
	 * @author tomas.augustinovic
	 */
	public class BaseModel implements IModel
	{
		private var _injector:Injector;
		
		[Inject] public var messageHandler:IMessageHandler;
		
		public function BaseModel()
		{
		}
		
		[PostConstruct]
		public function postConstruct():void
		{
			_injector = new Injector();
			_injector.mapValue(IMessageHandler, messageHandler);
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
