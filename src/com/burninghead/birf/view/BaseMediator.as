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
		
		[PostConstruct]
		public function postConstruct():void
		{
			messageHandler.addListener(onMessageReceived);
			_messenger = new Messenger(messageHandler, this);
			
			init();
		}
		
		protected function init():void
		{
		}
		
		protected function onMessageReceived(msg:IMessage):void
		{
		}
		
		public function onSignal1(arg:*):void
		{
			onMessageReceived(arg as IMessage);
		}
		
		public function registerView(value:*):void
		{
		}

		public function dispose():void
		{
		}
	}
}
