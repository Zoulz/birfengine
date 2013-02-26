package com.burninghead.birf.controller
{
	import com.burninghead.birf.messaging.IMessageHandler;
	import com.burninghead.birf.messaging.Messenger;
	/**
	 * Base class for commands. Injects the message handler to
	 * allow the command access to messaging "out-of-the-box".
	 * 
	 * @see ICommand
	 * 
	 * @author tomas.augustinovic
	 */
	public class BaseCommand
	{
		/**
		 * <b>[Inject]</b>
		 */
		[Inject] public var messageHandler:IMessageHandler;
		
		protected var _messenger:Messenger;
		
		/**
		 * <b>[PostConstruct]</b> Create instance of messenger with the message
		 * handler as parameter.
		 */
		[PostConstruct] public function postConstruct():void
		{
			_messenger = new Messenger(messageHandler, this);
		}
	}
}
