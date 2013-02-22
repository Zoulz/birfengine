package com.burninghead.extensions.view.bitmaprenderer.cutting
{
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	/**
	 * @author tomas.augustinovic
	 */
	public class TileCutter implements IMovieClipCuttingStrategy
	{
		private var _tileSize:Rectangle;
		
		public function TileCutter(tileSize:Rectangle)
		{
			_tileSize = tileSize;
		}
		
		public function clip(mc:MovieClip):MovieClipCuttingResult
		{
			var result:MovieClipCuttingResult = new MovieClipCuttingResult();
			var mx:Matrix = new Matrix();

			result.bitmapData = new BitmapData(mc.totalFrames * _tileSize.width, _tileSize.height);
			result.frames = new Vector.<Rectangle>();
			
			for (var i:uint = 0; i < mc.totalFrames; i++)
			{
				//	Translate matrix to next position.
				mx.translate(i * _tileSize.width, 0);
				
				//	Draw movieclip frame to bitmap.
				result.bitmapData.draw(mc, mx);
				
				//	Push frame position and size.
				result.frames.push(new Rectangle(i * _tileSize.width, 0, _tileSize.width, _tileSize.height));
				
				//	Move to next movieclip frame.
				mc.nextFrame();
			}
			
			return result;
		}
	}
}
