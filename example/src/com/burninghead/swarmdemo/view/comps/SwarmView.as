package com.burninghead.swarmdemo.view.comps
{
	import com.burninghead.birf.utils.IDisposable;
	import com.burninghead.birf.view.bitmaprenderer.IBitmapRenderer;
	import com.burninghead.birf.view.bitmaprenderer.BitmapSheet;
	import com.burninghead.birf.view.bitmaprenderer.renderables.Sprite;
	import com.burninghead.swarmdemo.assets.RobinBitmapSheet;

	import flash.geom.Rectangle;
	/**
	 * @author tomas.augustinovic
	 */
	public class SwarmView implements IDisposable
	{
		private var _robins:Vector.<Sprite>;
		private var _sheet:BitmapSheet;
		private var _renderer:IBitmapRenderer;
		
		public function SwarmView(renderer:IBitmapRenderer)
		{
			_renderer = renderer;
			_robins = new Vector.<Sprite>();
			
			//	Create the frame definitions for the sheet.
			var frames:Vector.<Rectangle> = new Vector.<Rectangle>();
			for (var x:uint = 0; x < 5; x++)
			{
				for (var y:uint = 0; y < 5; y++)
				{
					frames.push(new Rectangle(x * 240, y * 314, 240, 314));
				}
			}
			
			//	Create bitmap sheet.
			_sheet = new BitmapSheet(new RobinBitmapSheet(), frames);
		}
		
		public function createRobins(num:uint = 20):void
		{
			for (var i:uint = 0; i < num; i++)
			{
				var robin:Sprite = new Sprite(_sheet);
				robin.x = i * 10;
				_renderer.addChild(robin);
			}
		}

		public function dispose():void
		{
		}
	}
}
