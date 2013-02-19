package com.burninghead.birf.view.starling
{
	import starling.core.Starling;
	import starling.events.Event;

	import com.burninghead.birf.audio.BaseSoundManager;
	import com.burninghead.birf.audio.ISoundManager;
	import com.burninghead.birf.errors.AbstractMethodError;
	import com.burninghead.birf.messaging.IMessageHandler;
	import com.burninghead.birf.model.IModel;
	import com.burninghead.birf.net.assets.BaseAssetLoader;
	import com.burninghead.birf.net.assets.IAssetLoader;
	import com.burninghead.birf.states.IStateMachine;
	import com.burninghead.birf.states.InjectedStateMachine;
	import com.burninghead.birf.view.BaseView;
	import com.burninghead.birf.view.IView;
	/**
	 * @author tomas.augustinovic
	 */
	public class StarlingView extends BaseView implements IView
	{
		private var _starling:Starling;
		private var _stateMachine:IStateMachine;
		
		public function StarlingView(model:IModel, msgHandler:IMessageHandler)
		{
			super(model, msgHandler);
		}
		
		override protected function init():void
		{
			//	Create the starling context.
			_starling = new Starling(injectStarlingEntryClass(), stageObject.stage);
			_starling.addEventListener(Event.ROOT_CREATED, onRootCreated);
			_starling.start();
			
			//	Inject dependencies.
			injectStateMachine();
			injectAdditionalDependencies();
			
			//	Initialize view states.
			initViewStates();
		}
		
		protected function injectStarlingEntryClass():Class
		{
			throw new AbstractMethodError();
		}

		private function onRootCreated(event:Event):void
		{
			//	Dispose signal.
			_starling.removeEventListener(Event.ROOT_CREATED, onRootCreated);
			
			//	Dispatch signal indicating that view is ready.
			_initialized.dispatch();
		}
		
		protected function injectAdditionalDependencies():void
		{
			_injector.map(Starling).toValue(_starling);
			_injector.map(IAssetLoader).toSingleton(BaseAssetLoader);
			_injector.map(ISoundManager).toSingleton(BaseSoundManager);
		}
		
		protected function injectStateMachine():void
		{
			//	Create instance of state machine.
			_stateMachine = new InjectedStateMachine(_injector);
			_stateMachine.stateChanged.add(onStateChanged);
			
			//	Inject.
			_injector.map(IStateMachine).toValue(_stateMachine);
		}
		
		public function initViewStates():void
		{
		}
	}
}
