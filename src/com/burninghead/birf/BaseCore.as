package com.burninghead.birf
{
	import com.burninghead.birf.controller.BaseController;
	import com.burninghead.birf.controller.IController;
	import com.burninghead.birf.messaging.BaseMessageHandler;
	import com.burninghead.birf.messaging.IMessageHandler;
	import com.burninghead.birf.model.BaseModel;
	import com.burninghead.birf.model.IModel;
	import com.burninghead.birf.view.BaseView;
	import com.burninghead.birf.view.IView;
	import com.burninghead.utils.logger.BaseLogger;
	import com.burninghead.utils.logger.ILogger;
	import com.burninghead.utils.logger.TraceLoggerOutput;

	import flash.display.Sprite;
	import flash.events.Event;

	/**
	 * Base class for core implementation. Override the protected factory methods to add custom commands, mediators and models/services.
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
	 * @author tomas.augustinovic
	 */
	public class BaseCore extends Sprite implements ICore
	{
		private var _view:IView;
		private var _model:IModel;
		private var _controller:IController;
		private var _logger:ILogger;
		private var _messageHandler:IMessageHandler;
		
		/**
		 * If we already have a stage reference then we are already added to parent
		 * display object, so simply proceed to event handler for ADDED_TO_STAGE.
		 * Otherwise setup a event listener and wait for the event.
		 */
		public function BaseCore()
		{
			if (stage)
			{
				onGameAddedToStage(null);
			}
			else
			{
				addEventListener(Event.ADDED_TO_STAGE, onGameAddedToStage);
			}
		}
		
		/**
		 * ADDED_TO_STAGE event handler. Removes the listener and proceeds
		 * to initialize the game in three steps. First the preInit() method
		 * is deployed. Afterwards the MVC paradigm is setup which populates
		 * and registers everything. Lastly the postInit() method is executed.
		 */
		private function onGameAddedToStage(event:Event):void
		{
			//	Remove listener.
			if (hasEventListener(Event.ADDED_TO_STAGE))
			{
				removeEventListener(Event.ADDED_TO_STAGE, onGameAddedToStage);
			}

			preInit();
			
			initializeMVC();
			
			postInit();
		}
		
		/**
		 * Called when the game is ADDED_TO_STAGE before the MVC is initialized.
		 * Override to execute custom functionality.
		 */
		protected function preInit():void
		{
			//	No-op
		}
		
		/**
		 * Invoked after the MVC paradigm has been setup and all the mediators, commands
		 * and proxy models/services has been registered etc. Override to execute custom
		 * functionality.
		 */
		protected function postInit():void
		{
			//	No-op
		}
		
		/**
		 * Registers all the game commands. Override to add game specific commands.
		 */
		public function registerCommands():void
		{
			//	No-op
		}
		
		/**
		 * Registers all the game mediators. Override to add game specific mediators.
		 */
		public function registerMediators():void
		{
			//	No-op
		}
		
		/**
		 * Registers all the game models/services. Override to add game specific models/services.
		 */
		public function registerProxyModels():void
		{
			//	No-op
		}
		
		/**
		 * This is called after the view has been initialized.
		 */
		protected function viewInitialized():void
		{
			//	No-op
		}
		
		/**
		 * Signal handler for when the view is initialized.
		 */
		private function onViewInitialized():void
		{
			viewInitialized();
		}
		
		/**
		 * Initializes the MVC paradigm and registers all the game parts (commands, mediators, models/services).
		 * Afterwards, will proceed to initialize the view by setting it's stage reference.
		 */
		private function initializeMVC():void
		{
			//	Create MVC.
			_logger = createLogger();
			_messageHandler = createMessageHandler();
			_logger = createLogger();
			_model = createModel();
			_view = createView();
			_controller = createController();
			
			//	Register logger outputs.
			registerLoggerOutput();
			
			//	Register everything.
			registerCommands();
			registerMediators();
			registerProxyModels();

			//	Initialize view.
			_view.initialized.addOnce(onViewInitialized);
			_view.stageObject = this;
		}
		
		/**
		 * Factory method to create a logger instance.
		 * @return Instance of a logger that will be used throughout the game.
		 */
		protected function createLogger():ILogger
		{
			return new BaseLogger();
		}
		
		/**
		 * Registers logger output handlers. Override to add more output handlers.
		 */
		protected function registerLoggerOutput():void
		{
			_logger.registerOutput(new TraceLoggerOutput());
		}
		
		/**
		 * Factory method for creating a instance of the game controller.
		 */
		protected function createController():IController
		{
			return new BaseController(view, model, messageHandler, logger);
		}
		
		/**
		 * Factory method to create instance of game view.
		 */
		protected function createView():IView
		{
			return new BaseView(model, messageHandler, logger);
		}
		
		/**
		 * Factory method to create instance of game model.
		 */
		protected function createModel():IModel
		{
			return new BaseModel(messageHandler);
		}
		
		/**
		 * Factory method to create instance of message handler.
		 */
		protected function createMessageHandler():IMessageHandler
		{
			return new BaseMessageHandler();
		}
		
		/**
		 * Get reference of the controller.
		 */
		public function get controller():IController
		{
			return _controller;
		}
		
		/**
		 * Get reference of the view.
		 */
		public function get view():IView
		{
			return _view;
		}
		
		/**
		 * Get reference of the model.
		 */
		public function get model():IModel
		{
			return _model;
		}
		
		/**
		 * Get reference of the message handler.
		 */
		public function get messageHandler():IMessageHandler
		{
			return _messageHandler;
		}

		/**
		 * Return reference to logger.
		 */
		public function get logger():ILogger
		{
			return _logger;
		}
	}
}
