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

		public static function fromMovieClip(mc:MovieClip, strategy:IMovieClipCuttingStrategy = null):BitmapSheet
		{
			var ret:BitmapSheet = new BitmapSheet();
			
			if (strategy == null)
			{
				//	Default to tile cutter (32x32).
				strategy = new TileCutter(new Rectangle(0, 0, 32, 32));
			}
			
			//	Perform cutting and set bitmap data and frame coordinates.
			var result:MovieClipCuttingResult = strategy.clip(mc);
			ret.data = result.bitmapData;
			ret.frames = result.frames;
			
			return ret;
		}
		
		public static function fromSprite(spr:Sprite):BitmapSheet
		{
			var ret:BitmapSheet = new BitmapSheet();
			
			//	Simply draw the sprite into bitmap data.
			ret.data = new BitmapData(spr.width, spr.height);
			ret.data.draw(spr);
			
			//	Add frame dimensions for the sprite.
			ret.frames.push(new Rectangle(0, 0, spr.width, spr.height));
			
			return ret;
		}
		
		public static function fromBitmapData(bmd:BitmapData, xml:XML):BitmapSheet
		{
			var ret:BitmapSheet = new BitmapSheet();
			
			ret.data = bmd;
			for each (var frame:XML in xml)
			{
				ret.frames.push(new Rectangle(parseInt(frame.frame.@x), parseInt(frame.frame.@y), parseInt(frame.frame.@width), parseInt(frame.frame.@height)));
			}
			
			return ret;
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

		public function set data(data:BitmapData):void
		{
			_data = data;
		}

		public function set frames(frames:Vector.<Rectangle>):void
		{
			_frames = frames;
		}
	}
}
