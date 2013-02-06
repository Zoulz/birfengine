package com.burninghead.birf.net.assets.types
{
	import com.burninghead.birf.net.assets.IAsset;
	import com.greensock.loading.XMLLoader;
	/**
	 * @author tomas.augustinovic
	 */
	public class XmlAsset implements IAsset
	{
		private var _loader:XMLLoader;
		private var _name:String;
		
		public function XmlAsset(loader:XMLLoader)
		{
			_loader = loader;
			_name = _loader.name;
		}
		
		public function get data():XML
		{
			return _loader.content;
		}
		
		public function get url():String
		{
			return _loader.url;
		}

		public function get size():uint
		{
			return _loader.bytesTotal;
		}

		public function get name():String
		{
			return _name;
		}

		public function set name(value:String):void
		{
			_name = value;
		}
	}
}
