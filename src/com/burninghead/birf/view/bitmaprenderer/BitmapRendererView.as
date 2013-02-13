package com.burninghead.birf.view.bitmaprenderer
{
	import com.burninghead.birf.messaging.IMessageHandler;
	import com.burninghead.birf.model.IModel;
	import com.burninghead.birf.states.BaseStateMachine;
	import com.burninghead.birf.states.IStateMachine;
	import com.burninghead.birf.view.BaseView;
	import com.burninghead.birf.view.IView;

	import org.osflash.signals.natives.NativeSignal;

	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;
	/**
	 * @author tomas.augustinovic
	 */
	public class BitmapRendererView extends BaseView implements IView
	{
		private var _container:Bitmap;
		private var _bmpData:BitmapData;
		private var _addedToStage:NativeSignal;
		private var _stageObject:DisplayObject;
		
		protected var _renderer:IBitmapRenderer;
		protected var _stateMachine:IStateMachine;
		
		public function BitmapRendererView(model:IModel, msgHandler:IMessageHandler):void
		{
			super(model, msgHandler);

			_bmpData = new BitmapData(_stageObject.stage.stageWidth, _stageObject.stage.stageHeight);
			_container = new Bitmap(_bmpData);
			
			//	Attach stage listener.
			_addedToStage = new NativeSignal(_container, Event.ADDED_TO_STAGE, Event);
			_addedToStage.addOnce(onAddedToStage);
		}
		
		private function onAddedToStage(event:Event):void
		{
			DisplayObjectContainer(_stageObject).addChild(_container);
			
			//	Dispatch signal indicating that view is ready.
			_initialized.dispatch();
		}
		
		override protected function initInjection():void
		{
			super.initInjection();
			
			//	Create instance of state machine.
			_stateMachine = new BaseStateMachine();
			_stateMachine.stateChanged.add(onStateChanged);
			
			//	Create renderer.
			_renderer = new BaseBitmapRenderer(_container);
			
			//	Map to injector.
			_injector.mapValue(IStateMachine, _stateMachine);
			_injector.mapValue(IBitmapRenderer, _renderer);
		}
		
		override public function get stageObject():DisplayObject
		{
			return _stageObject;
		}
	}
}
