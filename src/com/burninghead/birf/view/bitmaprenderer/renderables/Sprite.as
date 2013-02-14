package com.burninghead.birf.view.bitmaprenderer.renderables
{
	import flash.geom.Point;
	import com.burninghead.birf.view.bitmaprenderer.BitmapSpriteSheet;
	import flash.display.BitmapData;
	import com.burninghead.birf.view.bitmaprenderer.IBitmapRenderable;
	/**
	 * @author tomas.augustinovic
	 */
	public class Sprite implements IBitmapRenderable
	{
		private var _renderData:BitmapData;
		private var _sheet:BitmapSpriteSheet;
		private var _pos:Point;
		
		public function Sprite(sheet:BitmapSpriteSheet)
		{
			_sheet = sheet;
		}
		
		public function draw(time:int):void
		{
			_renderData.copyPixels(_sheet.data, _sheet.frames[0], _pos);
		}

		public function set renderData(value:BitmapData):void
		{
			_renderData = value;
		}
		
		public function get x():int
		{
			return _pos.x;
		}
		
		public function set x(value:int):void
		{
			_pos.x = value;
		}
		
		public function get y():int
		{
			return _pos.y;
		}
		
		public function set y(value:int):void
		{
			_pos.y = value;
		}
	}
}
