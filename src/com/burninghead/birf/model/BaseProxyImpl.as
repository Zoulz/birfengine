package com.burninghead.birf.model
{
	import com.burninghead.birf.messaging.IMessage;
	import com.burninghead.birf.messaging.IMessageHandler;
	import com.burninghead.birf.messaging.Messenger;
	/**
	 * Base class for implementing a model/service proxy. Injects the message
	 * handler and a messenger to easily allow sub class implementations to access
	 * the central message handling.
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
		}
		
		/**
		 * Perform any cleanup of the proxy implementation here.
		 */
		public function dispose():void
		{
		}
		
		/**
		 * Handler for messages. Override this in sub class to process
		 * incoming messages.
		 */
		protected function onMessageReceived(msg:IMessage):void
		{
		}
	}
}
