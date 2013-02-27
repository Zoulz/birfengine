package com.burninghead.extensions.view.bitmaprenderer.cutting
{
	import flash.display.MovieClip;
	/**
	 * @author tomas.augustinovic
	 */
	public interface IMovieClipCuttingStrategy
	{
		function clip(mc:MovieClip):MovieClipCuttingResult;
	}
}
