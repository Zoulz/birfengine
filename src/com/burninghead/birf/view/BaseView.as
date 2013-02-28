package com.burninghead.birf.view
{
	import com.burninghead.birf.messaging.IMessage;
	import com.burninghead.birf.messaging.IMessageHandler;
	import com.burninghead.birf.model.IModel;
	import com.burninghead.birf.states.IState;
	import com.burninghead.utils.ReflectionUtils;
	import com.burninghead.utils.logger.ILogger;
	import com.burninghead.utils.logger.LogType;

	import org.osflash.signals.ISignal;
	import org.osflash.signals.Signal;
	import org.swiftsuspenders.Injector;

	import flash.display.DisplayObject;

	/**
	 * Base implementation of View. Handles injection of mediators.
	 * 
	 * <pre>
	 * -----------------------------------------------------------------------------------------------------------------------------------------
	 * 
	 * Copyright (c) Tomas Augustinovic 2012-2013
	 *
	 * Licence Agreement (The MIT License)
	 *
	 * Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files
	 * (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge,
	 * publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do
	 * so, subject to the following conditions:
	 *
	 * The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
	 *
	 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
	 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE
	 * FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
	 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
	 * 
	 * -----------------------------------------------------------------------------------------------------------------------------------------
	 * </pre>
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
		 * Clean up everything that the view has done. This is called when a new
		 * stage object has been set. Cleans up the injector.
		 */
		public function dispose():void
		{
			_initialized.removeAll();
			
			_injector.teardown();
			
			_injector = new Injector();
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
			if (ReflectionUtils.isType(mediator, IMediator))
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
			//	If already initialized, dispose and clean up first.
			if (_isInit)
			{
				_isInit = false;
				dispose();
			}
			
			//	Set reference.
			_stageObject = value;
			
			//	Unless reference is null, initialize the view.
			if (_stageObject != null)
			{
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
		}
	}
}
