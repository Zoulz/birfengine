package com.burninghead.birf.view
{
	import com.burninghead.birf.messaging.IMessage;
	import com.burninghead.birf.messaging.IMessageHandler;
	import com.burninghead.birf.messaging.Messenger;
	/**
	 * @author tomas.augustinovic
	 */
	public class BaseMediator implements IMediator
	{
		/**
		 * <b>[Inject]</b>
		 */
		[Inject] public var messageHandler:IMessageHandler;
		
		protected var _messenger:Messenger;
		protected var _view:*;
		
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
		 * Perform any initialization of the mediator here.
		 */
		protected function init():void
		{
		}
		
		/**
		 * Handler for messages. Override to process received messages.
		 * @param msg Message object.
		 */
		protected function onMessageReceived(msg:IMessage):void
		{
		}
		
		/**
		 * @inheritDoc
		 */
		public function registerView(value:*):void
		{
			_view = value;
		}

		/**
		 * Perform any cleanup of the mediator here.
		 */
		public function dispose():void
		{
		}
	}
}
