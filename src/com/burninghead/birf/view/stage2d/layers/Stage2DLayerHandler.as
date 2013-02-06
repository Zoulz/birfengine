package com.burninghead.birf.view.stage2d.layers
{
	import com.burninghead.birf.view.layers.ILayerHandler;

	import flash.display.Sprite;

	/**
	 * @author BigZoulz
	 */
	public class Stage2DLayerHandler implements ILayerHandler
	{
		private var _layers:Vector.<Sprite>;
		
		public function Stage2DLayerHandler()
		{
			_layers = new Vector.<Sprite>();
		}

		public function getLayer(index:uint):void
		{
		}
	}
}
