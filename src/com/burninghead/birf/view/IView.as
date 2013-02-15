package com.burninghead.birf.view
{
	import org.osflash.signals.ISignal;

	import flash.display.DisplayObject;
	import flash.display.Sprite;

	/**
	 * @author tomas.augustinovic
	 */
	public interface IView
	{
		/**
		 * Register a mediator with this view.
		 * @param mediator Class of the mediator (must implement IMediator)
		 * @param name String identifer for mediator
		 */
		function registerMediator(mediator:Class, name:String = ""):void;
		/**
		 * Unregister mediator from this view.
		 * @param mediator Mediator class (must implement IMediator)
		 * @param name String identifer for mediator
		 */
		function unregisterMediator(mediator:Class, name:String = ""):void;
		/**
		 * Return instance of the specified mediator.
		 * @param mediator Class of the mediator
		 * @param name String identifier of the mediator
		 * @return IMediator
		 */
		function getMediator(mediator:Class, name:String = ""):IMediator;
		/**
		 * Return flag indicating if the view is initialized.
		 * @return Boolean
		 */
		function get isInitialized():Boolean;
		/**
		 * Get signal dispatcher for when the view is initialized.
		 * @return ISignal
		 */
		function get initialized():ISignal;
		/**
		 * Get the actual game root stage display object.
		 */
		function get stageObject():Sprite;
		/**
		 * Set the actual game root stage display object.
		 */
		function set stageObject(value:Sprite):void;
	}
}
