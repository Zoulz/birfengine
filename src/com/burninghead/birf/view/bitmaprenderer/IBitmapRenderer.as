package com.burninghead.birf.view.bitmaprenderer
{
	import com.burninghead.birf.view.bitmaprenderer.renderables.DisplayObject;
	/**
	 * @author tomas.augustinovic
	 */
	public interface IBitmapRenderer
	{
		function addChild(renderable:DisplayObject):void;
		function removeChild(renderable:DisplayObject):void;
	}
}
