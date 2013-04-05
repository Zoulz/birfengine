package com.burninghead.extensions.displaylist.comps.ui
{
	import com.burninghead.utils.DisplayObjectUtils;
	import com.burninghead.utils.IDisposable;
	import com.burninghead.utils.audio.groups.IUISoundGroup;
	import com.burninghead.utils.ui.ISkinnableButton;

	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.geom.Point;
	/**
	 * @author BigZoulz
	 */
	public class ButtonHolder extends Sprite implements IDisposable
	{
		private var _buttons:Vector.<ISkinnableButton>;
		private var _uiSoundGroup:IUISoundGroup;
		
		public function ButtonHolder(uiSoundGroup:IUISoundGroup = null):void
		{
			_buttons = new Vector.<ISkinnableButton>();
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

				var btn:ISkinnableButton = new DisplayListButton(skin, _uiSoundGroup);
				btn.caption = captions[i];
				_buttons.push(btn);
			}
		}
		
		public function clearButtons():void
		{
			for each (var b:ISkinnableButton in _buttons)
			{
				//b.dispose();
			}
			
			DisplayObjectUtils.removeAllChildren(this);
			
			_buttons = new Vector.<ISkinnableButton>();
		}

		public function get buttons():Vector.<ISkinnableButton>
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
			for each (var b:ISkinnableButton in _buttons)
			{
				//b.dispose();
			}
		}
	}
}
