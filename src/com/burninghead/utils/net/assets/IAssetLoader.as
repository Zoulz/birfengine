package com.burninghead.utils.net.assets
{
	import org.osflash.signals.ISignal;
	/**
	 * Describes a asset loader. Grants access to loading remote assets.
	 * 
	 * @author tomas.augustinovic
	 */
	public interface IAssetLoader
	{
		/**
		 * Load the supplied URLs.
		 * @param urls Vector containing all the URLs to load.
		 * @param flushContent Clear any existing assets before loading.
		 */
		function load(urls:Vector.<String>, flushContent:Boolean = false):void;
		/**
		 * Cancel the loader.
		 */
		function cancel():void;
		/**
		 * Get a loaded asset by it's URL.
		 * @param url URL of asset to get.
		 */
		function getAssetByUrl(url:String):IAsset;
		/**
		 * Get a loaded asset by it's name identifier.
		 * @param name Name.
		 */
		function getAssetByName(name:String):IAsset;
		/**
		 * Get signal that is dispatced when the loader has finished
		 * loading all the URLs.
		 */
		function get totalComplete():ISignal;
		/**
		 * Signal that is triggered when the total progress of the
		 * loader is updated.
		 */
		function get totalProgress():ISignal;
		/**
		 * Signal that is dispatched when a error occurs.
		 */
		function get totalError():ISignal;
		/**
		 * Signal is dispatched when an item is complete loading.
		 */
		function get itemComplete():ISignal;
		/**
		 * Signal dispatched when progress is made on loading a
		 * item.
		 */
		function get itemProgress():ISignal;
		/**
		 * Signal is invoked when a item failed to load.
		 */
		function get itemFailed():ISignal;
	}
}
