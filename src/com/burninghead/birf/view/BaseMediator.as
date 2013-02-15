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
		[Inject] public var messageHandler:IMessageHandler;
		
		protected var _messenger:Messenger;
		
		[PostConstruct]
		public function postConstruct():void
		{
			messageHandler.listener.add(onMessageReceived);
			_messenger = new Messenger(messageHandler, this);
			
			init();
		}
		
		protected function init():void
		{
		}
		
		protected function onMessageReceived(msg:IMessage):void
		{
		}
		
		public function registerView(value:*):void
		{
		}

		public function dispose():void
		{
		}
	}
}
