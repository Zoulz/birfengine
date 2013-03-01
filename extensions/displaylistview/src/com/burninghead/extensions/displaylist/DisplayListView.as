package com.burninghead.extensions.displaylist
{
	import com.burninghead.birf.messaging.IMessageHandler;
	import com.burninghead.birf.model.IModel;
	import com.burninghead.birf.states.IState;
	import com.burninghead.birf.states.IStateMachine;
	import com.burninghead.birf.states.InjectedStateMachine;
	import com.burninghead.birf.view.BaseView;
	import com.burninghead.birf.view.IStateMachineDrivenView;
	import com.burninghead.birf.view.IView;
	import com.burninghead.extensions.displaylist.states.IDisplayListViewState;
	import com.burninghead.utils.assets.GSAssetLoader;
	import com.burninghead.utils.assets.IAssetLoader;
	import com.burninghead.utils.audio.BaseSoundManager;
	import com.burninghead.utils.audio.ISoundManager;

	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.events.Event;

	/**
	 * @author tomas.augustinovic
	 */
	public class DisplayListView extends BaseView implements IView, IStateMachineDrivenView
	{
		private var _container:Sprite;
		private var _stateMachine:IStateMachine;

		public function DisplayListView(model:IModel, msgHandler:IMessageHandler)
		{
			super(model, msgHandler);
		}
		
		/**
		 * Remove event listener. Then signal that the view is initialized.
		 * @param event
		 */
		private function onAddedToStage(event:Event):void
		{
			//	Remove listener.
			_container.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
			//	Dispatch signal indicating that view is ready.
			_initialized.dispatch();
		}
		
		override public function dispose():void
		{
			super.dispose();
			
			if (_container.hasEventListener(Event.ADDED_TO_STAGE))
			{
				_container.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			}
			(stageObject as DisplayObjectContainer).removeChild(_container);
		}
		
		/**
		 * Initialize the view state machine.
		 */
		public function initStateMachine():void
		{
		}
		
		/**
		 * Create a display object container and add it to stage. Then inject additional
		 * dependencies in the injector. Finally, initialize the view state machine.
		 */
		override protected function init():void
		{
			//	Create container sprite.
			_container = new Sprite();
			
			//	Attach stage listener.
			_container.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
			//	Attach container display object to stage.
			(stageObject as DisplayObjectContainer).addChild(_container);
			
			//	Inject dependencies.
			injectStateMachine();
			injectAdditionalDependencies();
			
			//	Initialize view states.
			initStateMachine();
		}
		
		/**
		 * Inject asset loader and sound manager.
		 */
		protected function injectAdditionalDependencies():void
		{
			_injector.map(IAssetLoader).toSingleton(GSAssetLoader);
			_injector.map(ISoundManager).toSingleton(BaseSoundManager);
		}
		
		/**
		 * Inject the view state machine.
		 */
		protected function injectStateMachine():void
		{
			//	Create instance of state machine.
			_stateMachine = new InjectedStateMachine(_injector);
			_stateMachine.stateChanged.add(onStateChanged);
			
			//	Inject.
			_injector.map(IStateMachine).toValue(_stateMachine);
		}

		/**
		 * Handles when a view state change happens. Add new view state display
		 * container to the display list, while removing the old one.
		 * @param newState Reference to the new view state
		 * @param oldState Reference to the old view state.
		 */
		override protected function onStateChanged(oldState:IState, newState:IState):void
		{
			//	Add the new state as a child.
			_container.addChildAt(IDisplayListViewState(newState).container, 0);
			
			//	Remove the old state (if one is set).
			if (oldState != null)
			{
				_container.removeChild(IDisplayListViewState(oldState).container);
			}
		}
	}
}
