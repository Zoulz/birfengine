package com.burninghead.birf.view.bitmaprenderer
{
	/**
	 * @author tomas.augustinovic
	 */
	public interface IBitmapRenderer
	{
		function registerRenderable(renderable:IBitmapRenderable):void;
		function unregisterRenderable(renderable:IBitmapRenderable):void;
	}
}
