package com.burninghead.birf.model
{
	import com.burninghead.birf.messaging.IMessageHandler;
	import com.burninghead.birf.utils.ReflectionUtil;
	import com.burninghead.birf.utils.logger.ILogger;
	import com.burninghead.birf.utils.logger.LogType;

	import org.swiftsuspenders.Injector;

	/**
	 * @author tomas.augustinovic
	 */
	public class BaseModel implements IModel
	{
		private var _injector:Injector;
		private var _messageHandler:IMessageHandler;
		private var _logger:ILogger;
		
		/**
		 * Set references to supplied objects. Create injector and map values to it.
		 * @param logger Reference to logger
		 * @param msgHandler Reference to message handler
		 */
		public function BaseModel(msgHandler:IMessageHandler, logger:ILogger = null)
		{
			_messageHandler = msgHandler;
			_logger = logger;
			
			//	Map injector.
			_injector = new Injector();
			_injector.map(IMessageHandler).toValue(_messageHandler);
			_injector.map(IModel).toValue(this);
			_injector.map(ILogger).toValue(_logger);
		}
		
		/**
		 * @inheritDoc
		 */
		public function getProxy(proxy:Class, name:String = ""):IProxy
		{
			if (_injector.hasMapping(proxy))
			{
				return _injector.getInstance(proxy, name);
			}
			else
			{
				_logger.log("Proxy is missing. Have you registered it?", LogType.WARN);
				return null;
			}
		}

		/**
		 * @inheritDoc
		 */
		public function registerProxy(proxy:Class, impl:Class, name:String = ""):void
		{
			if (ReflectionUtil.isType(impl, IProxy))
			{
				_injector.map(proxy, name).toSingleton(impl);
			}
			else
			{
				_logger.log("Must implement 'IProxy' interface.", LogType.FATAL);
			}
		}

		/**
		 * @inheritDoc
		 */
		public function unregisterProxy(proxy:Class, name:String = ""):void
		{
			IProxy(_injector.getInstance(proxy, name)).dispose();
			
			_injector.unmap(proxy, name);
		}
	}
}
