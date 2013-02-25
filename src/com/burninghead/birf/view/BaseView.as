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

	import flash.display.DisplayObject;

	/**
	 * @author tomas.augustinovic
	 */
	public class BaseView implements IView, Slot1
	{
		protected var _initialized:Signal;
		protected var _isInit:Boolean;
		protected var _injector:Injector;
		
		private var _model:IModel;
		private var _stageObject:DisplayObject;
		private var _messageHandler:IMessageHandler;
		private var _logger:ILogger;
		
		/**
		 * Sets default member values.
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
		
		/**
		 * Handles received messages.
		 * @param msg Message
		 */
		protected function onMessageReceived(msg:IMessage):void
		{
		}
		
		/**
		 * Turbosignal message handler. Reroutes to the
		 * ordinary message handler method.
		 * @param arg Message
		 */
		public function onSignal1(arg:*):void
		{
			onMessageReceived(arg as IMessage);
		}

		/**
		 * Initializes the view after a stage object has been set. Must
		 * dispatch the initialized signal upon completion.
		 */
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
				_logger.log("Must implement 'IMediator' interface.", LogType.FATAL);
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

		/**
		 * @inheritDoc
		 */
		public function get stageObject():DisplayObject
		{
			return _stageObject;
		}

		/**
		 * Set reference to stage object. Maps all the dependencies to the injector
		 * and the runs the init()-method.
		 * @param value Reference to stage holder
		 */
		public function set stageObject(value:DisplayObject):void
		{
			if (_isInit == false)
			{
				_stageObject = value;
				
				//	Create dependency injector and add the standard dependencies.
				_injector.map(IView).toValue(this);
				_injector.map(IModel).toValue(_model);
				_injector.map(IMessageHandler).toValue(_messageHandler);
				_injector.map(ILogger).toValue(_logger);
				
				//	Perform any initialization.
				init();
				
				//	Flag that we are initialized.
				_isInit = true;
			}
			else
			{
				_logger.log("Cannot change stage instance. View is already initialized.", LogType.ERROR);
			}
		}
	}
}
