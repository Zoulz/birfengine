package com.burninghead.extensions.view.displaylist.states
{
	import com.burninghead.birf.states.BaseState;
	import com.burninghead.birf.states.IState;
	import com.burninghead.birf.view.IView;

	import flash.display.Sprite;
	import flash.events.Event;


	/**
	 * @author tomas.augustinovic
	 */
	public class DisplayListViewState extends BaseState implements IState, IDisplayListViewState
	{
		[Inject] public var view:IView;
		
		private var _container:Sprite;
		
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
			init();
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
		}
		
		/**
		 * Invoked when the view state container has been added to stage.
		 */
		protected function containerAdded():void
		{
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
