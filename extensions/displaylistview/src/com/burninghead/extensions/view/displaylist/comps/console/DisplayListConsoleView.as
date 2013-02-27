package com.burninghead.extensions.view.displaylist.comps.console
{
	import flash.events.Event;
	import com.burninghead.birf.view.skinning.ISkinnable;
	import com.burninghead.extensions.console.IConsoleView;

	import org.osflash.signals.ISignal;
	import org.osflash.signals.natives.NativeSignal;

	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	import flash.text.TextField;
	/**
	 * @author Zoulz
	 */
	public class DisplayListConsoleView extends Sprite implements IConsoleView, ISkinnable
	{
		private var _skin:Sprite;
		private var _lineNum:uint = 0;
		private var _keyPressed:NativeSignal;
		
		private static const MAX_LINES:uint = 100;
		
		public function DisplayListConsoleView(skin:Sprite = null)
		{
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
			if (skin != null)
			{
				this.skin = skin;
			}
		}

		private function onAddedToStage(event:Event):void
		{
			if (_keyPressed != null)
			{
				_keyPressed.removeAll();
			}
			
			_keyPressed = new NativeSignal(stage, KeyboardEvent.KEY_UP, KeyboardEvent);
		}
		
		public function dispose():void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		public function get skin():*
		{
			return _skin;
		}

		public function set skin(value:*):void
		{
			_skin = value;
			
			addChild(_skin);
			
			_skin.visible = false;
		}

		public function activate():void
		{
			_skin.visible = true;
			parent.setChildIndex(this, parent.numChildren - 1);
			stage.focus = TextField(_skin["inputField"]);
		}

		public function deactivate():void
		{
			_skin.visible = false;
		}

		public function print(msg:String, color:String = "#FFFFFF"):void
		{
			var tf:TextField = TextField(_skin["outputField"]);
			
			tf.htmlText += "<font face=\"birfConsoleFont\" color=\"" + color + "\">" + msg + "</font>";
			tf.htmlText += "<br/>";
			
			_lineNum++;
			tf.scrollV++;

			//	Truncate log.
			/*if (_lineNum > MAX_LINES)
			{
				var offset:int = tf.getLineOffset(MAX_LINES);
				var newText:String = tf.text.slice(offset);
				tf.text = newText;
				_lineNum = MAX_LINES;
			}*/
		}
		
		public function clearOutput():void
		{
			TextField(_skin["outputField"]).text = "";
		}

		public function get isActive():Boolean
		{
			return _skin.visible;
		}

		public function get inputString():String
		{
			var tf:TextField = TextField(_skin["inputField"]);
			var ret:String = tf.text;
			tf.text = "";
			
			return ret;
		}

		public function get keyPressed():ISignal
		{
			return _keyPressed;
		}
	}
}
