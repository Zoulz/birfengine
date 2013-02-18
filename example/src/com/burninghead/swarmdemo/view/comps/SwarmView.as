package com.burninghead.swarmdemo.view.comps
{
	import com.burninghead.birf.utils.IDisposable;
	import com.burninghead.birf.utils.MathUtil;
	import com.burninghead.birf.view.bitmaprenderer.BitmapSheet;
	import com.burninghead.birf.view.bitmaprenderer.IBitmapRenderer;
	import com.burninghead.birf.view.bitmaprenderer.renderables.Sprite;
	import com.burninghead.swarmdemo.assets.RobinBitmapSheet;
	/**
	 * @author tomas.augustinovic
	 */
	public class SwarmView implements IDisposable
	{
		private var _robins:Vector.<RobinView>;
		private var _sheet:BitmapSheet;
		private var _renderer:IBitmapRenderer;
		
		public function SwarmView(renderer:IBitmapRenderer)
		{
			_renderer = renderer;
			_robins = new Vector.<RobinView>();
			
			//	Create the frame definitions for the sheet.
//			var frames:Vector.<Rectangle> = new Vector.<Rectangle>();
//			for (var x:uint = 0; x < 5; x++)
//			{
//				for (var y:uint = 0; y < 5; y++)
//				{
//					frames.push(new Rectangle(x * 240, y * 314, 240, 314));
//				}
//			}
			
			//	Create bitmap sheet.
			_sheet = BitmapSheet.fromBitmapData(new RobinBitmapSheet(), <frames><frame x="0" y="0" width="240" height="314" /></frames>);
		}
		
		public function createRobins(num:uint = 20):void
		{
			for (var i:uint = 0; i < num; i++)
			{
				var robin:Sprite = new Sprite(_sheet);
				robin.x = MathUtil.randomNumber(0, 400, true);
				robin.y = MathUtil.randomNumber(0, 300, true);
				_renderer.addChild(robin);
			}
		}

		public function dispose():void
		{
		}
	}
}
