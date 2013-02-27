package com.burninghead.utils.net.assets.types
{
	import com.burninghead.utils.net.assets.IAsset;
	import com.greensock.loading.SWFLoader;

	import flash.display.DisplayObject;

	/**
	 * @author tomas.augustinovic
	 */
	public class GSSwfAsset implements IAsset
	{
		private var _loader:SWFLoader;
		private var _name:String;
		
		public function GSSwfAsset(loader:SWFLoader)
		{
			_name = loader.name;
			_loader = loader;
		}
		
		public function getClass(name:String):Class
		{
			return _loader.getClass(name);
		}
		
		public function getDisplayObject():DisplayObject
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

		public function get data():*
		{
			return _loader.content;
		}
	}
}
