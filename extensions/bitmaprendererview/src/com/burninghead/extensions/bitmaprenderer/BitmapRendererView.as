package com.burninghead.extensions.bitmaprenderer
{
	import com.burninghead.birf.messaging.IMessageHandler;
	import com.burninghead.birf.model.IModel;
	import com.burninghead.birf.states.IStateMachine;
	import com.burninghead.birf.states.InjectedStateMachine;
	import com.burninghead.birf.view.BaseView;
	import com.burninghead.birf.view.IStateMachineDrivenView;
	import com.burninghead.birf.view.IView;
	import com.burninghead.utils.assets.MaxAssetLoader;
	import com.burninghead.utils.assets.IAssetLoader;
	import com.burninghead.utils.audio.BaseSoundManager;
	import com.burninghead.utils.audio.ISoundManager;

	import org.osflash.signals.natives.NativeSignal;

	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;
	/**
	 * @author tomas.augustinovic
	 */
	public class BitmapRendererView extends BaseView implements IView, IStateMachineDrivenView
	{
		private var _container:Bitmap;
		private var _bmpData:BitmapData;
		private var _addedToStage:NativeSignal;
		private var _renderer:IBitmapRenderer;
		private var _stateMachine:IStateMachine;
		
		public function BitmapRendererView(model:IModel, msgHandler:IMessageHandler):void
		{
			super(model, msgHandler);
		}
		
		private function onAddedToStage(event:Event):void
		{
			//	Dispatch signal indicating that view is ready.
			_initialized.dispatch();
		}
		
		override protected function init():void
		{
			//	Create bitmap rendering container.
			_bmpData = new BitmapData(stageObject.stage.stageWidth, stageObject.stage.stageHeight, false, getRenderClearColor());
			_container = new Bitmap(_bmpData);
			
			//	Attach stage listener.
			_addedToStage = new NativeSignal(_container, Event.ADDED_TO_STAGE, Event);
			_addedToStage.addOnce(onAddedToStage);
			
			//	Attach renderer bitmap to stage.
			(stageObject as DisplayObjectContainer).addChild(_container);
			
			//	Inject dependencies.
			injectStateMachine();
			injectRenderer();
			injectAdditionalDependencies();
			
			//	Initialize view states.
			initStateMachine();
		}
		
		override public function dispose():void
		{
			super.dispose();
			
			_addedToStage.removeAll();
			(stageObject as DisplayObjectContainer).removeChild(_container);
		}
		
		protected function getRenderClearColor():uint
		{
			return 0x49af00;
		}
		
		public function initStateMachine():void
		{
		}
		
		protected function injectAdditionalDependencies():void
		{
			_injector.map(IAssetLoader).toSingleton(MaxAssetLoader);
			_injector.map(ISoundManager).toSingleton(BaseSoundManager);
		}

		protected function injectRenderer():void
		{
			//	Create renderer.
			_renderer = new BaseBitmapRenderer(_container, getRenderClearColor());
			
			//	Inject.
			_injector.map(IBitmapRenderer).toValue(_renderer);
		}

		protected function injectStateMachine():void
		{
			//	Create instance of state machine.
			_stateMachine = new InjectedStateMachine(_injector);
			_stateMachine.stateChanged.add(onStateChanged);
			
			//	Inject.
			_injector.map(IStateMachine).toValue(_stateMachine);
		}
	}
}
