package com.burninghead.extensions.utils.list.items
{
	import com.burninghead.birf.utils.list.IListItem;

	import flash.display.DisplayObjectContainer;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.net.URLRequest;
	/**
	 * @author BigZoulz
	 */
	public class LoaderItem implements IListItem
	{
		private var _url:URLRequest;
		private var _loader:Loader;
		private var _completeCallback:Function;
		private var _target:DisplayObjectContainer;
		private var _callback:Function;
		
		public function LoaderItem(url:String, target:DisplayObjectContainer = null, completeCallback:Function = null)
		{
			_completeCallback = completeCallback;
			_target = target;
			
			_loader = new Loader();
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoaderComplete);
			_url = new URLRequest(url);
			
			if (_target != null)
			{
				_target.addChild(_loader);
			}
		}

		private function onLoaderComplete(event:Event):void
		{
			event.target.loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, onLoaderComplete);
			
			_completeCallback(event.target);
			
			_callback();
		}
		
		public function execute(callback:Function):void
		{
			_callback = callback;
			_loader.load(_url);
		}

		public function abort():void
		{
			_loader.close();
			if (_target != null)
			{
				_target.removeChild(_loader);
			}
			
			_callback();
		}
	}
}
