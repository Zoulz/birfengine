package com.burninghead.birf.view.bitmaprenderer.cutting
{
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	/**
	 * @author tomas.augustinovic
	 */
	public class TileCutter implements IBitmapCuttingStrategy
	{
		private var _tileSize:Rectangle;
		
		public function TileCutter(tileSize:Rectangle)
		{
			_tileSize = tileSize;
		}
		
		public function clip(mc:MovieClip):BitmapData
		{
			var data:BitmapData = new BitmapData(mc.totalFrames * _tileSize.width, _tileSize.height);
			
			for (var i:uint = 0; i < mc.totalFrames; i++)
			{
				var mx:Matrix = new Matrix();
				mx.translate(i * _tileSize.width, 0);
				
				data.draw(mc, mx);
				mc.nextFrame();
			}
			
			return data;
		}
	}
}
