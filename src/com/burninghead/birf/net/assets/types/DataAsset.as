package com.burninghead.birf.net.assets.types
{
	import com.burninghead.birf.net.assets.IAsset;
	import com.greensock.loading.DataLoader;
	/**
	 * @author tomas.augustinovic
	 */
	public class DataAsset implements IAsset
	{
		private var _loader:DataLoader;
		private var _name:String;
		
		public function DataAsset(loader:DataLoader)
		{
			_name = loader.name;
			_loader = loader;
		}
		
		public function get data():String
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
