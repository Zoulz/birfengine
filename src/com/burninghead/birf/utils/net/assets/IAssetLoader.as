package com.burninghead.birf.utils.net.assets
{
	import org.osflash.signals.ISignal;
	/**
	 * @author tomas.augustinovic
	 */
	public interface IAssetLoader
	{
		/**
		 * Load the supplied URLs.
		 * @param urls Vector containing all the URLs to load
		 * @param flushContent Clear any existing assets before loading
		 */
		function load(urls:Vector.<String>, flushContent:Boolean = false):void;
		/**
		 * Cancel the loader.
		 */
		function cancel():void;
		/**
		 * Get a loaded asset by it's URL.
		 * @param url URL of asset to get
		 * @return IAsset
		 */
		function getAssetByUrl(url:String):IAsset;
		/**
		 * Get a loaded asset by it's name identifier.
		 * @param name Name
		 * @return IAsset
		 */
		function getAssetByName(name:String):IAsset;
		/**
		 * Get signal that is dispatced when the loader has finished
		 * loading all the URLs.
		 * @return ISignal
		 */
		function get totalComplete():ISignal;
		/**
		 * Signal that is triggered when the total progress of the
		 * loader is updated.
		 * @return ISignal
		 */
		function get totalProgress():ISignal;
		/**
		 * Signal that is dispatched when a error occurs.
		 * @return ISignal
		 */
		function get totalError():ISignal;
		/**
		 * Signal is dispatched when an item is complete loading.
		 * @return ISignal
		 */
		function get itemComplete():ISignal;
		/**
		 * Signal dispatched when progress is made on loading a
		 * item.
		 * @return ISignal
		 */
		function get itemProgress():ISignal;
		/**
		 * Signal is invoked when a item failed to load.
		 * @return ISignal
		 */
		function get itemFailed():ISignal;
	}
}
