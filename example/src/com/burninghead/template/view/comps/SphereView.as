package com.burninghead.template.view.comps
{
	import flash.text.TextFieldAutoSize;
	import flash.text.TextField;
	import flash.display.Sprite;
	/**
	 * @author tomas.augustinovic
	 */
	public class SphereView extends Sprite
	{
		private var _tf:TextField;
		
		public function SphereView()
		{
			mouseChildren = false;
			buttonMode = true;
			
			this.graphics.beginFill(0xff0000, 1);
			this.graphics.drawCircle(0, 0, 25);
			this.graphics.endFill();
			
			_tf = new TextField();
			_tf.y = 0;
			_tf.x = -10;
			_tf.width = 30;
			_tf.autoSize = TextFieldAutoSize.CENTER;
			_tf.text = "0";
			addChild(_tf);
		}
		
		public function setNum(num:uint):void
		{
			_tf.text = num.toString();
		}
	}
}
