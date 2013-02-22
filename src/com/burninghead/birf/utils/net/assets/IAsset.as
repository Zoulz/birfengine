package com.burninghead.birf.utils.net.assets
{
	/**
	 * @author tomas.augustinovic
	 */
	public interface IAsset
	{
		function get url():String;
		function get size():uint;
		function get name():String;
		function set name(value:String):void;
		function get data():*;
	}
}
