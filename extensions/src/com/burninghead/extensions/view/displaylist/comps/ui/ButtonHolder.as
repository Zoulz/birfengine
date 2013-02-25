package com.burninghead.extensions.view.displaylist.comps.ui
{
	import com.burninghead.birf.utils.DisplayObjectUtil;
	import com.burninghead.birf.utils.IDisposable;
	import com.burninghead.extensions.audio.groups.IUISoundGroup;

	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.geom.Point;
	/**
	 * @author BigZoulz
	 */
	public class ButtonHolder extends Sprite implements IDisposable
	{
		private var _buttons:Vector.<IButton>;
		private var _uiSoundGroup:IUISoundGroup;
		
		public function ButtonHolder(uiSoundGroup:IUISoundGroup = null):void
		{
			_buttons = new Vector.<IButton>();
			_uiSoundGroup = uiSoundGroup;
		}
		
		public function createButtons(captions:Vector.<String>, ids:Vector.<String>, SkinClass:Class, pos:Point = null, spacing:Number = 10):void
		{
			pos = (pos == null) ? new Point(0, 0) : pos;
			
			for (var i:uint = 0; i < captions.length; i++)
			{
				var skin:MovieClip = new SkinClass();
				skin.name = ids[i];
				skin.x = pos.x;
				skin.y = pos.y + (i * skin.height + spacing);
				addChild(skin);

				var btn:IButton = new DisplayListButton(skin, _uiSoundGroup);
				btn.caption = captions[i];
				_buttons.push(btn);
			}
		}
		
		public function clearButtons():void
		{
			for each (var b:IButton in _buttons)
			{
				b.dispose();
			}
			
			DisplayObjectUtil.removeAllChildren(this);
			
			_buttons = new Vector.<IButton>();
		}

		public function get buttons():Vector.<IButton>
		{
			return _buttons;
		}

		public function get uiSoundGroup():IUISoundGroup
		{
			return _uiSoundGroup;
		}

		public function set uiSoundGroup(uiSoundGroup:IUISoundGroup):void
		{
			_uiSoundGroup = uiSoundGroup;
		}

		public function dispose():void
		{
			for each (var b:IButton in _buttons)
			{
				b.dispose();
			}
		}
	}
}
