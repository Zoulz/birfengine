package com.burninghead.utils.net.assets
{
	import org.osflash.signals.ISignal;
	/**
	 * Describes a asset loader. Grants access to loading remote assets.
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
