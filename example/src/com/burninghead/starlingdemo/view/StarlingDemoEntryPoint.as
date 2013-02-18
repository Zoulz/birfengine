package com.burninghead.starlingdemo.view
{
	import starling.text.TextField;
	import starling.display.Sprite;
	/**
	 * @author tomas.augustinovic
	 */
	public class StarlingDemoEntryPoint extends Sprite
	{
		public function StarlingDemoEntryPoint()
		{
			var test:TextField = new TextField(200, 25, "Hello world!");
			addChild(test);
		}
	}
}
