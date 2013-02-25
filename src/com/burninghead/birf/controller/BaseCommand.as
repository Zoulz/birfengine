package com.burninghead.birf.controller
{
	import com.burninghead.birf.messaging.IMessageHandler;
	import com.burninghead.birf.messaging.Messenger;
	/**
	 * Base class for commands. Injects the message handler to
	 * allow the command access to messaging "out-of-the-box".
	 * 
	 * @author tomas.augustinovic
	 */
	public class BaseCommand
	{
		[Inject] public var messageHandler:IMessageHandler;
		
		protected var _messenger:Messenger;
		
		/**
		 * Post-construct constructor. Create instance of messenger with
		 * the message handler as parameter.
		 */
		[PostConstruct] public function postConstruct():void
		{
			_messenger = new Messenger(messageHandler, this);
		}
	}
}
