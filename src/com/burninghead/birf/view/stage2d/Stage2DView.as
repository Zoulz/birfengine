package com.burninghead.birf.view.stage2d
{
	import com.burninghead.birf.audio.BaseSoundManager;
	import com.burninghead.birf.audio.ISoundManager;
	import com.burninghead.birf.messaging.IMessageHandler;
	import com.burninghead.birf.model.IModel;
	import com.burninghead.birf.net.assets.BaseAssetLoader;
	import com.burninghead.birf.net.assets.IAssetLoader;
	import com.burninghead.birf.states.IState;
	import com.burninghead.birf.states.IStateMachine;
	import com.burninghead.birf.view.BaseView;
	import com.burninghead.birf.view.IStateDrivenView;
	import com.burninghead.birf.view.IView;
	import com.burninghead.birf.view.InjectedStateMachine;
	import com.burninghead.birf.view.stage2d.states.IStage2DViewState;

	import org.osflash.signals.natives.NativeSignal;

	import flash.display.Sprite;
	import flash.events.Event;

	/**
	 * @author tomas.augustinovic
	 */
	public class Stage2DView extends BaseView implements IView, IStateDrivenView
	{
		private var _container:Sprite;
		private var _addedToStage:NativeSignal;
		
		private var _stateMachine:IStateMachine;

		/**
		 * Create ADDED_TO_STAGE event listener.
		 */
		public function Stage2DView(model:IModel, msgHandler:IMessageHandler)
		{
			super(model, msgHandler);
		}
		
		/**
		 * Create and initialize the view state handler. Then signal that the
		 * view is initialized.
		 * @param event
		 */
		private function onAddedToStage(event:Event):void
		{
			//	Dispose signal.
			_addedToStage.removeAll();
			_addedToStage = null;
			
			//	Dispatch signal indicating that view is ready.
			_initialized.dispatch();
		}
		
		public function initViewStates():void
		{
		}
		
		/**
		 * Add this view's container object as child to the game root object.
		 * @inheritDoc
		 */
		override protected function init():void
		{
			//	Create container sprite.
			_container = new Sprite();
			
			//	Attach stage listener.
			_addedToStage = new NativeSignal(_container, Event.ADDED_TO_STAGE, Event);
			_addedToStage.addOnce(onAddedToStage);
			
			//	Attach container display object to stage.
			stageObject.addChild(_container);
			
			//	Inject dependencies.
			injectStateMachine();
			injectAdditionalDependencies();
			
			//	Initialize view states.
			initViewStates();
		}
		
		protected function injectAdditionalDependencies():void
		{
			_injector.mapSingletonOf(IAssetLoader, BaseAssetLoader);
			_injector.mapSingletonOf(ISoundManager, BaseSoundManager);
		}
		
		protected function injectStateMachine():void
		{
			//	Create instance of state machine.
			_stateMachine = new InjectedStateMachine(_injector);
			_stateMachine.stateChanged.add(onStateChanged);
			
			//	Inject.
			_injector.mapValue(IStateMachine, _stateMachine);
		}

		/**
		 * Handles when a view state change happens. Add new view state display
		 * container to the display list, while removing the old one.
		 * @param newState Reference to the new view state
		 */
		override protected function onStateChanged(oldState:IState, newState:IState):void
		{
			//	Add the new state as a child.
			_container.addChildAt(IStage2DViewState(newState).container, 0);
			
			//	Remove the old state (if one is set).
			if (oldState != null)
			{
				_container.removeChild(IStage2DViewState(oldState).container);
			}
		}
	}
}
