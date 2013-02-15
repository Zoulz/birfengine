package com.burninghead.birf.view.bitmaprenderer
{
	import com.burninghead.birf.view.bitmaprenderer.cutting.MovieClipCuttingResult;
	import flash.display.Sprite;
	import com.burninghead.birf.view.bitmaprenderer.cutting.IMovieClipCuttingStrategy;
	import com.burninghead.birf.view.bitmaprenderer.cutting.TileCutter;

	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	/**
	 * @author tomas.augustinovic
	 */
	public class BitmapSheet
	{
		private var _data:BitmapData;
		private var _frames:Vector.<Rectangle>;
		
		public function BitmapSheet(data:BitmapData = null, frames:Vector.<Rectangle> = null)
		{
			_data = data;
			_frames = frames;
			
			if (_frames == null)
			{
				_frames = new Vector.<Rectangle>();
			}
		}

		public function fromMovieClip(mc:MovieClip, strategy:IMovieClipCuttingStrategy = null):void
		{
			if (strategy == null)
			{
				//	Default to tile cutter (32x32).
				strategy = new TileCutter(new Rectangle(0, 0, 32, 32));
			}
			
			//	Perform cutting and set bitmap data and frame coordinates.
			var result:MovieClipCuttingResult = strategy.clip(mc);
			_data = result.bitmapData;
			_frames = result.frames;
		}
		
		public function fromSprite(spr:Sprite):void
		{
			//	Simply draw the sprite into bitmap data.
			_data = new BitmapData(spr.width, spr.height);
			_data.draw(spr);
			
			//	Add frame dimensions for the sprite.
			_frames.push(new Rectangle(0, 0, spr.width, spr.height));
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
