package com.burninghead.birf.model
{
	import com.burninghead.birf.messaging.IMessage;
	import com.burninghead.birf.messaging.IMessageHandler;
	import com.burninghead.birf.messaging.Messenger;
	/**
	 * @author tomas.augustinovic
	 */
	public class BaseModelPart implements IProxy
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
		
		public function dispose():void
		{
		}
		
		protected function onMessageReceived(msg:IMessage):void
		{
		}
	}
}
