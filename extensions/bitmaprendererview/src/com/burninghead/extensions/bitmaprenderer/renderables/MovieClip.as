package com.burninghead.extensions.bitmaprenderer.renderables
{
	import com.burninghead.extensions.bitmaprenderer.BitmapSheet;
	import com.burninghead.extensions.bitmaprenderer.IBitmapRenderable;
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
