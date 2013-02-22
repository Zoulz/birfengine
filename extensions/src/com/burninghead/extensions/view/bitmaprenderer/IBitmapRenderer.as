package com.burninghead.extensions.view.bitmaprenderer
{
	import com.burninghead.extensions.view.bitmaprenderer.renderables.DisplayObject;
	/**
	 * @author tomas.augustinovic
	 */
	public interface IBitmapRenderer
	{
		function addChild(renderable:DisplayObject):void;
		function removeChild(renderable:DisplayObject):void;
	}
}
