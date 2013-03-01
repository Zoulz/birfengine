package com.burninghead.extensions.bitmaprenderer
{
	import com.burninghead.extensions.bitmaprenderer.renderables.DisplayObject;
	/**
	 * @author tomas.augustinovic
	 */
	public interface IBitmapRenderer
	{
		function addChild(renderable:DisplayObject):void;
		function removeChild(renderable:DisplayObject):void;
	}
}
