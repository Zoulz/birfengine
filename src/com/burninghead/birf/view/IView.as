package com.burninghead.birf.view
{
	import com.burninghead.birf.utils.console.IConsole;
	import com.burninghead.birf.view.layers.ILayerHandler;
	import com.burninghead.birf.view.states.IViewStateHandler;
	import com.burninghead.birf.view.states.ViewStateDefinition;

	import org.osflash.signals.ISignal;

	import flash.display.DisplayObject;
	import flash.display.Sprite;

	/**
	 * @author tomas.augustinovic
	 */
	public interface IView
	{
		/**
		 * Perform the initialization of the view. Will signal when completed.
		 * @param stageObject The root game display object
		 */
		function init(stageObject:Sprite):void;
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
		 * Create a view state definition that can be registered with the view state
		 * handler.
		 * @param viewStateIndex Index position of the view state inside the handler
		 * @param viewState Class used for the view state (must implement IViewState)
		 * @return ViewStateDefinition
		 */
		function createViewStateDefinition(viewStateIndex:uint, viewState:Class):ViewStateDefinition;
		/**
		 * Get instance of the view state handler used.
		 * @return IViewStateHandler
		 */
		function get stateHandler():IViewStateHandler;
		/**
		 * Get the actual game root stage display object.
		 */
		function get stageObject():DisplayObject;
		
		function get layerHandler():ILayerHandler;
		
		function get console():IConsole;
	}
}
