package com.burninghead.birf.view.stage2d
{
	import com.burninghead.birf.states.IState;
	import com.burninghead.birf.states.IStateMachine;
	import com.burninghead.birf.view.BaseView;
	import com.burninghead.birf.view.IView;
	import com.burninghead.birf.view.stage2d.states.IStage2DViewState;
	import com.burninghead.birf.view.stage2d.states.Stage2DStateMachine;

	import org.osflash.signals.Signal;
	import org.osflash.signals.natives.NativeSignal;

	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;

	/**
	 * @author tomas.augustinovic
	 */
	public class Stage2DView extends BaseView implements IView
	{
		private var _container:Sprite;
		private var _addedToStage:NativeSignal;
		private var _stageObject:DisplayObject;
		
		protected var _stateMachine:Stage2DStateMachine;

		/**
		 * Create ADDED_TO_STAGE event listener.
		 */
		public function Stage2DView()
		{
			_container = new Sprite();
			_initialized = new Signal();
			
			//	Attach stage listener.
			_addedToStage = new NativeSignal(_container, Event.ADDED_TO_STAGE, Event);
			_addedToStage.addOnce(onAddedToStage);
		}
		
		override protected function initInjection():void
		{
			super.initInjection();
			
			//	Create instance of state machine.
			_stateMachine = new Stage2DStateMachine(_injector);
			_stateMachine.stateChanged.add(onStateChanged);
			
			//	Map state machine to injector.
			_injector.mapValue(IStateMachine, _stateMachine);
		}
		
		protected function initViewStates():void
		{
		}
		
		/**
		 * Add this view's container object as child to the game root object.
		 * @inheritDoc
		 */
		override public function init(stageObject:Sprite):void
		{
			_stageObject = stageObject;
			
			if (_isInit == false)
			{
				//	Flag that we are initialized.
				_isInit = true;

				//	Add this view to stage.
				stageObject.addChild(_container);
				
				//	Initialize view states.
				initViewStates();
			}
			else
			{
				throw new Error("View is already initialized.");
			}
		}

		/**
		 * Create and initialize the view state handler. Then signal that the
		 * view is initialized.
		 * @param event
		 */
		private function onAddedToStage(event:Event):void
		{
			//	Dispatch signal indicating that view is ready.
			_initialized.dispatch();
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
		
		override public function get stageObject():DisplayObject
		{
			return _stageObject;
		}
	}
}
