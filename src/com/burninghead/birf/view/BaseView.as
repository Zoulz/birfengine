package com.burninghead.birf.view
{
	import com.burninghead.birf.messaging.IMessage;
	import com.burninghead.birf.messaging.IMessageHandler;
	import com.burninghead.birf.model.IModel;
	import com.burninghead.birf.states.IState;
	import com.burninghead.utils.ReflectionUtil;
	import com.burninghead.utils.logger.ILogger;
	import com.burninghead.utils.logger.LogType;

	import org.osflash.signals.ISignal;
	import org.osflash.signals.Signal;
	import org.swiftsuspenders.Injector;

	import flash.display.DisplayObject;

	/**
	 * Base implementation of View. Handles injection of mediators.
	 * 
	 * @see IView
	 * @see IMediator
	 * 
	 * @author tomas.augustinovic
	 */
	public class BaseView implements IView
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
		 * @param model Reference to model.
		 * @param msgHandler Reference to message handler.
		 * @param logger Reference to logger.
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
		 * Override to handle received messages.
		 * @param msg Message.
		 */
		protected function onMessageReceived(msg:IMessage):void
		{
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
		 * @param value Reference to stage holder.
		 */
		public function set stageObject(value:DisplayObject):void
		{
			if (_isInit == false)
			{
				_stageObject = value;
				
				//	Flag that we are initialized.
				_isInit = true;
				
				//	Create dependency injector and add the standard dependencies.
				_injector.map(IView).toValue(this);
				_injector.map(IModel).toValue(_model);
				_injector.map(IMessageHandler).toValue(_messageHandler);
				_injector.map(ILogger).toValue(_logger);
				
				//	Perform any initialization.
				init();
			}
			else
			{
				_logger.log("Cannot change stage instance. View is already initialized.", LogType.ERROR);
			}
		}
	}
}
