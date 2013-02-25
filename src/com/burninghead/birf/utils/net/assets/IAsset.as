package com.burninghead.birf.utils.net.assets
{
	/**
	 * @author tomas.augustinovic
	 */
	public interface IAsset
	{
		/**
		 * URL to the asset.
		 * @return String
		 */
		function get url():String;
		/**
		 * Size of asset in bytes.
		 * @return uint
		 */
		function get size():uint;
		/**
		 * Return the name identifier of the asset.
		 * @return String
		 */
		function get name():String;
		/**
		 * Set the name identifier of the asset.
		 * @param value Name
		 */
		function set name(value:String):void;
		/**
		 * Return the data contained in asset.
		 * @return Data
		 */
		function get data():*;
	}
}
