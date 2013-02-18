package com.burninghead.simplesphere.view.comps
{
	import flash.text.TextFormatAlign;
	import flash.text.TextFormat;
	import flash.text.TextField;
	import flash.display.Sprite;
	/**
	 * @author Zoulz
	 */
	public class SphereView extends Sprite
	{
		private var _tf:TextField;
		
		/**
		 * Constructor.
		 */
		public function SphereView()
		{
			//	Make this a button.
			mouseChildren = false;
			buttonMode = true;

			//	Init the text field for the counter.
			initTextField();
			
			//	Set color and text.
			setColor(0xff0000);
			setText("0");
		}

		/**
		 * Initialize the textfield.
		 */
		private function initTextField():void
		{
			//	Create a text format for the field.
			var fmt:TextFormat = new TextFormat("Verdana", 18, 0x000000);
			fmt.align = TextFormatAlign.CENTER;

			//	Create the textfield, apply format and add it to display list.
			_tf = new TextField();
			_tf.defaultTextFormat = fmt;
			_tf.setTextFormat(fmt);
			_tf.width = 50;
			_tf.x = -24;
			_tf.y = -13;
			addChild(_tf);
		}
		
		/**
		 * Set text of the textfield.
		 */
		public function setText(txt:String):void
		{
			_tf.text = txt;
		}
		
		/**
		 * Redraw the graphics using the supplied color.
		 */
		public function setColor(c:uint):void
		{
			this.graphics.clear();
			this.graphics.beginFill(c, 1);
			this.graphics.drawCircle(0, 0, 25);
			this.graphics.endFill();
		}
	}
}
