package com.burninghead.birf.view
{
	import com.burninghead.birf.messaging.BaseMessage;
	import com.burninghead.birf.messaging.IMessage;
	import com.burninghead.birf.messaging.IMessageHandler;
	import com.burninghead.birf.model.IModel;
	import com.burninghead.birf.states.IState;
	import com.burninghead.birf.utils.ReflectionUtil;
	import com.burninghead.birf.view.stage2d.mediators.ConsoleMediatorMsgType;

	import org.osflash.signals.ISignal;
	import org.osflash.signals.Signal;
	import org.swiftsuspenders.Injector;

	import flash.display.Sprite;

	/**
	 * @author tomas.augustinovic
	 */
	public class BaseView implements IView
	{
		protected var _initialized:Signal;
		protected var _isInit:Boolean;
		protected var _injector:Injector;
		
		private var _model:IModel;
		private var _stageObject:Sprite;
		private var _messageHandler:IMessageHandler;
		
		/**
		 * Maps injections for the mediators.
		 */
		public function BaseView(model:IModel, msgHandler:IMessageHandler):void
		{
			_model = model;
			_messageHandler = msgHandler;
			_messageHandler.listener.add(onMessageReceived);
			
			_stageObject = null;
			_initialized = new Signal();
			_injector = new Injector();
			_isInit = false;
		}
		
		protected function onMessageReceived(msg:IMessage):void
		{
		}

		protected function init():void
		{
		}
		
		/**
		 * @inheritDoc
		 */
		public function getMediator(mediator:Class, name:String = ""):IMediator
		{
			if (_injector.hasMapping(mediator))
			{
				return _injector.getInstance(mediator, name);
			}
			else
			{
				_messageHandler.send(new BaseMessage(ConsoleMediatorMsgType.PRINT_MESSAGE, this, { msg: "Mediator is missing. Have you registered it?", category: "warn" }));
				return null;
			}
		}
		
		/**
		 * Handles when a view state change has occured.
		 */
		protected function onStateChanged(oldState:IState, newState:IState):void
		{
			//	No-op
		}
		
		/**
		 * @inheritDoc
		 */
		public function registerMediator(mediator:Class, name:String = ""):void
		{
			if (ReflectionUtil.isType(mediator, IMediator))
			{
				_injector.mapSingleton(mediator, name);
			}
			else
			{
				throw new Error("Must implement IMediator interface.");
			}
		}
		
		/**
		 * @inheritDoc
		 */
		public function unregisterMediator(mediator:Class, name:String = ""):void
		{
			IMediator(_injector.getInstance(mediator)).dispose();
			
			_injector.unmap(mediator);
		}

		/**
		 * @inheritDoc
		 */		
		public function get initialized():ISignal
		{
			return _initialized;
		}

		/**
		 * @inheritDoc
		 */
		public function get isInitialized():Boolean
		{
			return _isInit;
		}

		public function get stageObject():Sprite
		{
			return _stageObject;
		}

		public function set stageObject(value:Sprite):void
		{
			_stageObject = value;
			
			if (_isInit == false)
			{
				//	Flag that we are initialized.
				_isInit = true;
				
				//	Create dependency injector and add the standard dependencies.
				_injector.mapValue(IView, this);
				_injector.mapValue(IModel, _model);
				_injector.mapValue(IMessageHandler, _messageHandler);
				
				//	Perform any initialization.
				init();
			}
			else
			{
				throw new Error("View is already initialized.");
			}
		}
	}
}
