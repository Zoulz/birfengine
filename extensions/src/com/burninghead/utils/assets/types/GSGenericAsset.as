package com.burninghead.utils.assets.types
{
	import com.burninghead.utils.assets.IAsset;
	import com.greensock.loading.core.LoaderItem;
	/**
	 * @author tomas.augustinovic
	 */
	public class GSGenericAsset implements IAsset
	{
		protected var _loader:LoaderItem;
		private var _name:String;
		
		public function GSGenericAsset(loader:LoaderItem)
		{
			_name = loader.name;
			_loader = loader;
		}
		
		public function get data():*
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
