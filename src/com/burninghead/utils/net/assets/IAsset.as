package com.burninghead.utils.net.assets
{
	/**
	 * Describes a loaded asset.
	 * 
	 * @author tomas.augustinovic
	 */
	public interface IAsset
	{
		/**
		 * URL to the asset.
		 */
		function get url():String;
		/**
		 * Size of asset in bytes.
		 */
		function get size():uint;
		/**
		 * Return the name identifier of the asset.
		 */
		function get name():String;
		/**
		 * Set the name identifier of the asset.
		 * @param value New name of the asset.
		 */
		function set name(value:String):void;
		/**
		 * Return the data contained in asset.
		 */
		function get data():*;
	}
}
