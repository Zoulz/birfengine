package com.burninghead.birf.utils
{
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	
	/**
	 * @author BigZoulz
	 */
	public final class NetUtil
	{
		public static function openURL(url:String):void
		{
			navigateToURL(new URLRequest(url), "_blank");
		}
	}
}
