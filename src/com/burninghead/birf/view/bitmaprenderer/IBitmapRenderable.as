package com.burninghead.birf.view.bitmaprenderer
{
	import flash.display.BitmapData;
	/**
	 * @author tomas.augustinovic
	 */
	public interface IBitmapRenderable
	{
		function draw(time:int):void;
		function set renderData(value:BitmapData):void;
	}
}
