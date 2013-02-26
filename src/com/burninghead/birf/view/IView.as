package com.burninghead.birf.view
{
	import org.osflash.signals.ISignal;

	import flash.display.DisplayObject;

	/**
	 * Describes a BiRF view. Allows the registration and retrieval of mediators. Initialized
	 * by the holder passing it's stage display object reference.
	 * 
	 * @see BaseGame
	 * 
	 * @author tomas.augustinovic
	 */
	public interface IView
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
