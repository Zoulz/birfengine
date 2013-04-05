package com.burninghead.extensions.displaylist.states
{
	import com.burninghead.birf.messaging.IMessage;
	import com.burninghead.birf.messaging.IMessageHandler;
	import com.burninghead.birf.messaging.Messenger;
	import com.burninghead.birf.states.BaseState;
	import com.burninghead.birf.states.IState;
	import com.burninghead.birf.view.IView;

	import flash.display.Sprite;
	import flash.events.Event;


	/**
	 * Base class for the display list view state. Creates a sprite object and invokes
	 * a method call when the object is added to the stage.
	 * 
	 * @author tomas.augustinovic
	 */
	public class DisplayListViewState extends BaseState implements IState, IDisplayListViewState
	{
		[Inject] public var view:IView;
		[Inject] public var msgHandler:IMessageHandler;
		
		private var _container:Sprite;
		protected var _messenger:Messenger;
		
		/**
		 * Create a sprite container for this view state. Listen for when it is added
		 * to stage.
		 */
		public function DisplayListViewState()
		{
			super();
			
			_container = new Sprite();
			_container.addEventListener(Event.ADDED_TO_STAGE, onContainerAddedToStage);
		}
		
		/**
		 * Post dependency injection. Perform view state initialization.
		 */
		[PostConstruct] public function postConstruct():void
		{
			//	Setup message handling.
			_messenger = new Messenger(msgHandler, this);
			msgHandler.addListener(onMessageReceived);
			
			init();
		}
		
		/**
		 * Handle any incoming messages.
		 * @param msg Incoming message.
		 */
		protected function onMessageReceived(msg:IMessage):void
		{
			//	No-op
		}
		
		/**
		 * Event handler for when the view state has been added to stage. Remove listener
		 * then invoke method.
		 */
		private function onContainerAddedToStage(event:Event):void
		{
			_container.removeEventListener(Event.ADDED_TO_STAGE, onContainerAddedToStage);
			
			containerAdded();
		}
		
		/**
		 * Initialize the view state here.
		 */
		protected function init():void
		{
			//	No-op
		}
		
		/**
		 * Invoked when the view state container has been added to stage.
		 */
		protected function containerAdded():void
		{
			//	No-op
		}
		
		/**
		 * Return container sprite.
		 * @return Sprite
		 */
		public function get container():Sprite
		{
			return _container;
		}
	}
}
