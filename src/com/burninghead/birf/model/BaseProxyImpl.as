package com.burninghead.birf.model
{
	import com.burninghead.birf.messaging.IMessage;
	import com.burninghead.birf.messaging.IMessageHandler;
	import com.burninghead.birf.messaging.Messenger;
	/**
	 * Base class for implementing a model/service proxy. Injects the message handler and a messenger to easily allow sub class
	 * implementations to access the central message handling.
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
	 * @see IMessageHandler
	 * @see Messenger
	 * 
	 * @author tomas.augustinovic
	 */
	public class BaseProxyImpl implements IProxy
	{
		/**
		 * <b>[Inject]</b>
		 */
		[Inject] public var messageHandler:IMessageHandler;
		
		protected var _messenger:Messenger;
		
		/**
		 * <b>[PostConstruct]</b> Post dependency injection constructor. Setup message
		 * handler and messenger. Perform custom init afterwards.
		 */
		[PostConstruct] public function postConstruct():void
		{
			messageHandler.addListener(onMessageReceived);
			_messenger = new Messenger(messageHandler, this);
			
			init();
		}
		
		/**
		 * Perform any initialization of the proxy implementation here.
		 */
		protected function init():void
		{
			//	No-op
		}
		
		/**
		 * Perform any cleanup of the proxy implementation here.
		 */
		public function dispose():void
		{
			//	No-op
		}
		
		/**
		 * Handler for messages. Override this in sub class to process
		 * incoming messages.
		 */
		protected function onMessageReceived(msg:IMessage):void
		{
			//	No-op
		}
	}
}
