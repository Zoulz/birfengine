package com.burninghead.birf.controller
{
	import com.burninghead.birf.messaging.IMessageHandler;
	import com.burninghead.birf.messaging.Messenger;
	/**
	 * @author tomas.augustinovic
	 */
	public class BaseCommand
	{
		[Inject] public var messageHandler:IMessageHandler;
		
		protected var _messenger:Messenger;
		
		[PostConstruct]
		public function postConstruct():void
		{
			_messenger = new Messenger(messageHandler, this);
		}
	}
}
