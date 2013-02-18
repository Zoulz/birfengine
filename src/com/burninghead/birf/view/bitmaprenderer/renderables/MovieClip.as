package com.burninghead.birf.view.bitmaprenderer.renderables
{
	import com.burninghead.birf.view.bitmaprenderer.BitmapSheet;
	import com.burninghead.birf.view.bitmaprenderer.IBitmapRenderable;
	/**
	 * @author tomas.augustinovic
	 */
	public class MovieClip extends DisplayObject implements IBitmapRenderable
	{
		private var _sheet:BitmapSheet;
		
		public function MovieClip(sheet:BitmapSheet)
		{
			_sheet = sheet;
		}
		
		public function draw(time:int):void
		{
		}
	}
}
