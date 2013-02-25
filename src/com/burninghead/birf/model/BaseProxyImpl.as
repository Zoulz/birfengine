package com.burninghead.birf.model
{
	import com.jacksondunstan.signals.Slot1;
	import com.burninghead.birf.messaging.IMessage;
	import com.burninghead.birf.messaging.IMessageHandler;
	import com.burninghead.birf.messaging.Messenger;
	/**
	 * @author tomas.augustinovic
	 */
	public class BaseProxyImpl implements IProxy, Slot1
	{
		[Inject] public var messageHandler:IMessageHandler;
		
		protected var _messenger:Messenger;
		
		/**
		 * Post dependency injection constructor. Setup message handler
		 * and messenger. Perform custom init afterwards.
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
		 * Handler for messages.
		 */
		protected function onMessageReceived(msg:IMessage):void
		{
		}
		
		/**
		 * Turbosignal message handler. Simply pass the message to the
		 * ordinary message handler.
		 * @param arg Message
		 */
		public function onSignal1(arg:*):void
		{
			onMessageReceived(arg as IMessage);
		}
	}
}
