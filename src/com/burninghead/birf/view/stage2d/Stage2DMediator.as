package com.burninghead.birf.view.stage2d
{
	import com.burninghead.birf.messaging.IMessage;
	import com.burninghead.birf.messaging.IMessageHandler;
	import com.burninghead.birf.messaging.Messenger;
	import com.burninghead.birf.view.IMediator;

	import flash.display.DisplayObject;


	/**
	 * @author tomas.augustinovic
	 */
	public class Stage2DMediator implements IMediator
	{
		[Inject] public var messageHandler:IMessageHandler;
		
		private var _container:DisplayObject;
		
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
		
		protected function isViewRegistered():Boolean
		{
			return (displayObject != null);
		}
		
		public function registerView(value:*):void
		{
			if (_container != null)
			{
				dispose();
			}
			
			_container = value;
		}

		public function dispose():void
		{
			_container = null;
		}
		
		public function get displayObject():DisplayObject
		{
			return _container;
		}
	}
}
