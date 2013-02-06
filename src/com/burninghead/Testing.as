package com.burninghead
{
	import com.burninghead.birf.utils.Counter;
	import com.greensock.easing.Quad;

	import flash.display.Sprite;
	import flash.text.TextField;
	/**
	 * @author BigZoulz
	 */
	public class Testing extends Sprite
	{
		public var tfText:TextField;
		private var _counter:Counter;
		
		public function Testing()
		{
			tfText = new TextField();
			addChild(tfText);
			
			_counter = new Counter(0);
			_counter.update.add(onCount);
			
			_counter.countTo(16820, 2, Quad.easeIn);
		}
		
		private function onCount():void
		{
			tfText.text = Math.round(_counter.value).toString();
		}
	}
}
