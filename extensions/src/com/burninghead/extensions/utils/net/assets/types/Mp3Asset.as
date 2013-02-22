package com.burninghead.extensions.utils.net.assets.types
{
	import com.burninghead.birf.utils.net.assets.IAsset;
	import com.greensock.loading.MP3Loader;

	import flash.media.SoundChannel;
	/**
	 * @author tomas.augustinovic
	 */
	public class Mp3Asset implements IAsset
	{
		private var _loader:MP3Loader;
		private var _name:String;
		
		public function Mp3Asset(loader:MP3Loader)
		{
			_loader = loader;
			_name = loader.name;
		}
		
		public function play():SoundChannel
		{
			return _loader.playSound();
		}
		
		public function paused():Boolean
		{
			return _loader.soundPaused;
		}
		
		public function get playProgress():Number
		{
			return _loader.playProgress;
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

		public function get data():*
		{
			return _loader.content;
		}
	}
}
