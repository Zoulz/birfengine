package com.burninghead.birf.view.bitmaprenderer
{
	import com.burninghead.birf.view.bitmaprenderer.cutting.IBitmapCuttingStrategy;
	import com.burninghead.birf.view.bitmaprenderer.cutting.TileCutter;

	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	/**
	 * @author tomas.augustinovic
	 */
	public class BitmapSpriteSheet
	{
		private var _data:BitmapData;
		private var _frames:Vector.<Rectangle>;
		
		public function BitmapSpriteSheet(data:BitmapData = null)
		{
			_data = data;
			_frames = new Vector.<Rectangle>();
		}

		public function fromMovieClip(mc:MovieClip, strategy:IBitmapCuttingStrategy = null):void
		{
			if (strategy == null)
			{
				//	Default to tile cutter (32x32).
				strategy = new TileCutter(new Rectangle(0, 0, 32, 32));
			}
			
			_data = strategy.clip(mc);
		}
		
		public function getFrame(index:uint):BitmapData
		{
			var frame:Rectangle = _frames[index];
			var bmp:BitmapData = new BitmapData(frame.width, frame.height);
			bmp.copyPixels(_data, frame, new Point(0, 0));
			
			return bmp;
		}

		public function get frames():Vector.<Rectangle>
		{
			return _frames;
		}

		public function get data():BitmapData
		{
			return _data;
		}
	}
}
