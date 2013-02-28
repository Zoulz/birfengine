package com.burninghead.birf.model
{
	import com.burninghead.birf.messaging.IMessageHandler;
	import com.burninghead.utils.ReflectionUtils;
	import com.burninghead.utils.logger.ILogger;
	import com.burninghead.utils.logger.LogType;

	import org.swiftsuspenders.Injector;

	/**
	 * Base class implementation of model. Basically handles injection of proxies.
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
	 * @author tomas.augustinovic
	 */
	public class BaseModel implements IModel
	{
		private var _injector:Injector;
		private var _messageHandler:IMessageHandler;
		private var _logger:ILogger;
		
		/**
		 * Set references to supplied objects. Create injector and map values to it.
		 * @param logger Reference to logger.
		 * @param msgHandler Reference to message handler.
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
			if (ReflectionUtils.isType(impl, IProxy))
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
