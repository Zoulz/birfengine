package com.burninghead.simplesphere.view.comps
{
	import flash.events.MouseEvent;
	import org.osflash.signals.natives.NativeSignal;
	import org.osflash.signals.ISignal;
	import flash.text.TextFormatAlign;
	import flash.text.TextFormat;
	import flash.text.TextField;
	import flash.display.Sprite;
	/**
	 * @author Zoulz
	 */
	public class SphereView extends Sprite implements ISphereView
	{
		private var _tf:TextField;
		private var _click:NativeSignal;
		
		/**
		 * Constructor.
		 */
		public function SphereView()
		{
			_click = new NativeSignal(this, MouseEvent.CLICK, MouseEvent);
			
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

		public function dispose():void
		{
		}

		public function get click():ISignal
		{
			return _click;
		}
	}
}
