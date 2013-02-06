package com.burninghead.birf.net.assets.types
{
	import com.burninghead.birf.net.assets.IAsset;
	import com.greensock.loading.BinaryDataLoader;

	import flash.utils.ByteArray;
	/**
	 * @author tomas.augustinovic
	 */
	public class BinaryAsset implements IAsset
	{
		private var _loader:BinaryDataLoader;
		private var _name:String;
		
		public function BinaryAsset(loader:BinaryDataLoader)
		{
			_name = loader.name;
			_loader = loader;
		}
		
		public function data():ByteArray
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
