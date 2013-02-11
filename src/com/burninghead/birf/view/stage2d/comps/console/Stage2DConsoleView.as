package com.burninghead.birf.view.stage2d.comps.console
{
	import com.burninghead.birf.utils.StringUtil;
	import com.burninghead.birf.utils.IDisposable;
	import com.burninghead.birf.view.skinning.ISkinnable;

	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	/**
	 * @author Zoulz
	 */
	public class Stage2DConsoleView extends Sprite implements ISkinnable, IDisposable
	{
		private var _skin:Sprite;
		private var _categories:Vector.<Object>;
		private var _filters:Vector.<String>;
		
		public function Stage2DConsoleView(skin:Sprite = null)
		{
			_filters = new Vector.<String>();
			
			_categories = new Vector.<Object>();
			_categories.push({ id: "warn", color: 0xff9900 });
			_categories.push({ id: "error", color: 0xff0000 });
			_categories.push({ id: "command", color: 0xa3ffaf });
			
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
			
			tf.appendText(msg);
			tf.appendText("\n");
			
			if (category != "")
			{
				var fmt:TextFormat = new TextFormat();
				fmt.color = getColorByCategory(category);
				tf.setTextFormat(fmt, tf.length - (msg.length + 1), tf.length);
			}
		}
		
		private function getColorByCategory(category:String):uint
		{
			for each (var cat:Object in _categories)
			{
				if (cat.id == category)
				{
					return cat.color;
				}
			}
			
			return 0xffffff;
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
