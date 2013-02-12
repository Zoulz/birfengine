package com.burninghead.birf.view.stage2d.comps.console
{
	import com.burninghead.birf.utils.IDisposable;
	import com.burninghead.birf.view.skinning.ISkinnable;

	import flash.display.Sprite;
	import flash.text.TextField;
	/**
	 * @author Zoulz
	 */
	public class Stage2DConsoleView extends Sprite implements ISkinnable, IDisposable
	{
		private var _skin:Sprite;
		private var _categories:Vector.<Object>;
		private var _filters:Vector.<String>;
		private var _lineNum:uint = 0;
		
		private static const MAX_LINES:uint = 100;
		
		public function Stage2DConsoleView(skin:Sprite = null)
		{
			_filters = new Vector.<String>();
			
			_categories = new Vector.<Object>();
			_categories.push({ id: "warn", color: "#F7D85C" });
			_categories.push({ id: "error", color: "#FF0000" });
			_categories.push({ id: "command", color: "#A3FFAF" });
			
			if (skin != null)
			{
				this.skin = skin;
			}
		}
		
		public function get skin():*
		{
			return _skin;
		}

		public function dispose():void
		{
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

		public function print(msg:String, category:String = ""):void
		{
			//	Check if message should be filtered away.
			if (_filters.indexOf(category) != -1)
			{
				return;
			}
			
			var tf:TextField = TextField(_skin["outputField"]);
			
			if (category != "")
			{
				tf.htmlText += "<font face=\"birfConsoleFont\" color=\"" + getColorByCategory(category) + "\">" + msg + "</font>";
			}
			else
			{
				tf.htmlText += msg;
			}
			
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
		
		private function getColorByCategory(category:String):String
		{
			for each (var cat:Object in _categories)
			{
				if (cat.id == category)
				{
					return cat.color;
				}
			}
			
			return "#FFFFFF";
		}
		
		public function clearOutput():void
		{
			TextField(_skin["outputField"]).text = "";
		}
		
		public function set categoryFilter(filters:Vector.<String>):void
		{
			_filters = filters;
		}
		
		public function getInputString():String
		{
			var tf:TextField = TextField(_skin["inputField"]);
			var ret:String = tf.text;
			tf.text = "";
			
			return ret;
		}

		public function get isActive():Boolean
		{
			return _skin.visible;
		}
	}
}
