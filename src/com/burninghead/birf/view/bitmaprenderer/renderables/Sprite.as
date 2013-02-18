package com.burninghead.birf.view.bitmaprenderer.renderables
{
	import com.burninghead.birf.view.bitmaprenderer.BitmapSheet;
	import com.burninghead.birf.view.bitmaprenderer.IBitmapRenderable;

	import flash.geom.Point;
	/**
	 * @author tomas.augustinovic
	 */
	public class Sprite extends DisplayObject implements IBitmapRenderable
	{
		private var _sheet:BitmapSheet;
		
		public function Sprite(sheet:BitmapSheet)
		{
			_sheet = sheet;
			width = _sheet.frames[0].width;
			height = _sheet.frames[0].height;
			anchorPoint = new Point(width / 2, height / 2);
		}
		
		public function draw(time:int):void
		{
			_renderData.copyPixels(_sheet.data, _sheet.frames[0], _position.subtract(anchorPoint));
		}
	}
}
