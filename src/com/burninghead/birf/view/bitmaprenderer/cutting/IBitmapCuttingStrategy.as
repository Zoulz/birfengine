package com.burninghead.birf.view.bitmaprenderer.cutting
{
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	/**
	 * @author tomas.augustinovic
	 */
	public interface IBitmapCuttingStrategy
	{
		function clip(mc:MovieClip):BitmapData;
	}
}
