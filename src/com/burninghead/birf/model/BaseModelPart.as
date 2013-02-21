package com.burninghead.birf.model
{
	import com.jacksondunstan.signals.Slot1;
	import com.burninghead.birf.messaging.IMessage;
	import com.burninghead.birf.messaging.IMessageHandler;
	import com.burninghead.birf.messaging.Messenger;
	/**
	 * @author tomas.augustinovic
	 */
	public class BaseModelPart implements IProxy, Slot1
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
		
		public function dispose():void
		{
		}
		
		protected function onMessageReceived(msg:IMessage):void
		{
		}
		
		public function onSignal1(arg:*):void
		{
			onMessageReceived(arg as IMessage);
		}
	}
}
