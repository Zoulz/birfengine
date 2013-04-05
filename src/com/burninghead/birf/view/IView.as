package com.burninghead.birf.view
{
	import com.burninghead.utils.IDisposable;
	import org.osflash.signals.ISignal;

	import flash.display.DisplayObject;

	/**
	 * Describes a birf view. Allows the registration and retrieval of mediators. Initialized by the holder passing it's stage display
	 * object reference.
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
	 * @see BaseGame
	 * 
	 * @author tomas.augustinovic
	 */
	public interface IView extends IDisposable
	{
		/**
		 * Register a mediator with this view.
		 * @param mediator Class of the mediator (must implement IMediator).
		 * @param name String identifer for mediator.
		 */
		function registerMediator(mediator:Class, name:String = ""):void;
		/**
		 * Unregister mediator from this view.
		 * @param mediator Mediator class (must implement IMediator).
		 * @param name String identifer for mediator.
		 */
		function unregisterMediator(mediator:Class, name:String = ""):void;
		/**
		 * Return instance of the specified mediator.
		 * @param mediator Class of the mediator.
		 * @param name String identifier of the mediator.
		 * @return Requested mediator instance.
		 */
		function getMediator(mediator:Class, name:String = ""):IMediator;
		/**
		 * Return flag indicating if the view is initialized.
		 * @return True if the view has been initialized successfully.
		 */
		function get isInitialized():Boolean;
		/**
		 * Get signal dispatcher for when the view is initialized.
		 * @return Signal that is dispatched.
		 */
		function get initialized():ISignal;
		/**
		 * Get the actual game stage display object. Typically the entry point object (BaseGame).
		 * @return Display object containing stage reference.
		 */
		function get stageObject():DisplayObject;
		/**
		 * Set the game stage display object. This will also attempt to initialize the view.
		 * @param value Display object containing the stage reference.
		 */
		function set stageObject(value:DisplayObject):void;
	}
}
