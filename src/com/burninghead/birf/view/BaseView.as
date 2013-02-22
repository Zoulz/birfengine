package com.burninghead.birf.view
{
	import com.burninghead.birf.messaging.IMessage;
	import com.burninghead.birf.messaging.IMessageHandler;
	import com.burninghead.birf.model.IModel;
	import com.burninghead.birf.states.IState;
	import com.burninghead.birf.utils.ReflectionUtil;
	import com.burninghead.birf.utils.logger.ILogger;
	import com.burninghead.birf.utils.logger.LogType;
	import com.jacksondunstan.signals.Slot1;

	import org.osflash.signals.ISignal;
	import org.osflash.signals.Signal;
	import org.swiftsuspenders.Injector;

	import flash.display.Sprite;

	/**
	 * @author tomas.augustinovic
	 */
	public class BaseView implements IView, Slot1
	{
		protected var _initialized:Signal;
		protected var _isInit:Boolean;
		protected var _injector:Injector;
		
		private var _model:IModel;
		private var _stageObject:Sprite;
		private var _messageHandler:IMessageHandler;
		private var _logger:ILogger;
		
		/**
		 * Maps injections for the mediators.
		 */
		public function BaseView(model:IModel, msgHandler:IMessageHandler, logger:ILogger = null):void
		{
			_model = model;
			_messageHandler = msgHandler;
			_messageHandler.addListener(onMessageReceived);
			_logger = logger;
			
			_stageObject = null;
			_initialized = new Signal();
			_injector = new Injector();
			_isInit = false;
		}
		
		protected function onMessageReceived(msg:IMessage):void
		{
		}
		
		public function onSignal1(arg:*):void
		{
			onMessageReceived(arg as IMessage);
		}

		protected function init():void
		{
			_initialized.dispatch();
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
				_logger.log("Mediator is missing. Have you registered it?", LogType.WARN);
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
				_injector.map(mediator, name).asSingleton();
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
			if (_isInit == false)
			{
				_stageObject = value;
				
				//	Create dependency injector and add the standard dependencies.
				_injector.map(IView).toValue(this);
				_injector.map(IModel).toValue(_model);
				_injector.map(IMessageHandler).toValue(_messageHandler);
				_injector.map(ILogger).toValue(_logger);
				
				//	Flag that we are initialized.
				_isInit = true;
				
				//	Perform any initialization.
				init();
			}
			else
			{
				throw new Error("Cannot change stage instance. View is already initialized.");
			}
		}
	}
}
