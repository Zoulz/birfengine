package com.burninghead.birf.view.bitmaprenderer
{
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.utils.getTimer;
	/**
	 * @author tomas.augustinovic
	 */
	public class BaseBitmapRenderer implements IBitmapRenderer
	{
		private var _renderables:Vector.<IBitmapRenderable>;
		private var _lastFrameTime:int = 0;
		private var _curFrameTime:int = 0;
		private var _container:DisplayObject;
		
		public function BaseBitmapRenderer(container:DisplayObject)
		{
			_container = container;
			_renderables = new Vector.<IBitmapRenderable>();
			
			_container.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onEnterFrame(event:Event):void
		{
			_curFrameTime = getTimer() - _lastFrameTime;
			_lastFrameTime = _curFrameTime;
			
			for each (var render:IBitmapRenderable in _renderables)
			{
				render.draw(_curFrameTime);
			}
		}
		
		public function get renderables():Vector.<IBitmapRenderable>
		{
			return _renderables;
		}
	}
}
