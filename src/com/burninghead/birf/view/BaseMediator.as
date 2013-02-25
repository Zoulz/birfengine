package com.burninghead.birf.view
{
	import com.jacksondunstan.signals.Slot1;
	import com.burninghead.birf.messaging.IMessage;
	import com.burninghead.birf.messaging.IMessageHandler;
	import com.burninghead.birf.messaging.Messenger;
	/**
	 * @author tomas.augustinovic
	 */
	public class BaseMediator implements IMediator, Slot1
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
		 * Perform any initialization of the mediator here.
		 */
		protected function init():void
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
		
		/**
		 * @inheritDoc
		 */
		public function registerView(value:*):void
		{
		}

		/**
		 * Perform any cleanup of the mediator here.
		 */
		public function dispose():void
		{
		}
	}
}
