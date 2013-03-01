package com.burninghead.extensions.displaylist.comps.console
{
	import com.burninghead.birf.Birf;
	import com.burninghead.birf.view.skinning.ISkinnable;
	import com.burninghead.extensions.console.IConsoleView;

	import org.osflash.signals.ISignal;
	import org.osflash.signals.natives.NativeSignal;

	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.text.TextField;
	/**
	 * This is a implementation of a console display list view component that can be mediated with the console mediator.
	 * 
	 * @author tomas.augustinovic
	 */
	public class DisplayListConsoleView extends Sprite implements IConsoleView, ISkinnable
	{
		private var _skin:Sprite;
		private var _keyPressed:NativeSignal;
		
		private static const MAX_LINES:uint = 5;
		
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
			
			print("DisplayListView Console<br />birfEngine version " + Birf.VERSION, "#F4FF55");
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
			
			tf.htmlText += "<font face=\"birfConsoleFont\" color=\"" + color + "\">" + msg + "</font><br />";
			tf.scrollV++;

			//	Truncate log.
			if (tf.numLines - 1 > MAX_LINES)
			{
				var start:int = tf.getLineOffset(0);
				var end:int = tf.getLineOffset(1) + 58;
				
				trace(tf.htmlText.slice(end));
				//tf.htmlText = tf.htmlText.slice(end);
				
				//trace(tf.getLineOffset(0) + " -> " + tf.getLineText(0));
			}
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
		
		public function truncateTextWithSuffix(textField:TextField, height:Number, suffix:String, content:String, ...replace):String
		{
			var replaceText:Function = function(content:String, replace:Array):String
			{
				var j:int = 0;
				var replaced:String = content;
				while(j < replace.length)
				{
					replaced = replaced.split(replace[j]).join(replace[j + 1]);
					j += 2;
				}
				
				return replaced;
			};
			
			if(!replace)
			{
				replace = [];
			}
			
			var titleString:String = replaceText(content, replace);
			var i:int = titleString.length;
			
			textField.htmlText = titleString;
			
			while(textField.height > height && i > 0)
			{
				titleString = titleString.substring(0, --i);
				
				while(titleString.charAt(titleString.length - 1) == ' ' && i > 0)
				{
					titleString = titleString.substring(0, --i);
				}
				textField.htmlText = replaceText(titleString + suffix, replace);
			}
			
			return textField.htmlText;
		}
	}
}
