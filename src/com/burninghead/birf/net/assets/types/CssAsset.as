package com.burninghead.birf.net.assets.types
{
	import com.burninghead.birf.net.assets.IAsset;
	import com.greensock.loading.CSSLoader;

	import flash.text.StyleSheet;
	/**
	 * @author tomas.augustinovic
	 */
	public class CssAsset implements IAsset
	{
		private var _loader:CSSLoader;
		private var _name:String;
		
		public function CssAsset(loader:CSSLoader)
		{
			_name = loader.name;
			_loader = loader;
		}
		
		public function styleSheet():StyleSheet
		{
			return _loader.content;
		}
		
		public function get url():String
		{
			return _loader.url;
		}

		public function get name():String
		{
			return _name;
		}

		public function set name(value:String):void
		{
			_name = value;
		}
		
		public function get size():uint
		{
			return _loader.bytesTotal;
		}
	}
}
