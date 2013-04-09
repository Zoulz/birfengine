package com.burninghead.extensions.displaylist.comps.ui
{
	import com.burninghead.utils.audio.groups.IUISoundGroup;
	import com.burninghead.utils.ui.ISkinnableButton;

	import org.osflash.signals.ISignal;
	import org.osflash.signals.Signal;

	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.text.TextField;

	/**
	 * @author tomas.augustinovic
	 */
	public class DisplayListButton implements ISkinnableButton
	{
		public static const UP_STATE:String = "up";
		public static const DOWN_STATE:String = "down";
		public static const OVER_STATE:String = "over";
		public static const DISABLED_STATE:String = "disabled";
		
		private var _skin:MovieClip;
		protected var _state:String;
		private var _caption:String;
		private var _click:Signal;
		private var _soundGroup:IUISoundGroup;
		
		public function DisplayListButton(skin:MovieClip, sndGroup:IUISoundGroup = null)
		{
			_click = new Signal();

			_soundGroup = sndGroup;
			
			if (skin != null)
			{
				this.skin = skin;
			}
		}
		
		public function dispose():void
		{
			removeMouseListeners();
			_click.removeAll();
		}
		
		private function removeMouseListeners():void
		{
			_skin.removeEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
			_skin.removeEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
			_skin.removeEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			_skin.removeEventListener(MouseEvent.MOUSE_UP, onMouseUp);
		}
		
		public function set enabled(value:Boolean):void
		{
			if (value)
			{
				_skin.mouseEnabled = true;
				setState(UP_STATE);
			}
			else
			{
				_skin.mouseEnabled = false;
				setState(DISABLED_STATE);
			}
		}

		private function onMouseUp(event:MouseEvent):void
		{
			_click.dispatch(this);
			
			var coords:Point = _skin.localToGlobal(new Point(_skin.mouseX, _skin.mouseY));
			
			if (_skin.hitTestPoint(coords.x, coords.y))
			{
				setState(OVER_STATE);
			}
			else
			{
				setState(UP_STATE);
			}
			
			if (_soundGroup != null)
			{
				_soundGroup.playButtonRelease();
			}
		}
		
		private function onMouseDown(event:MouseEvent):void
		{
			setState(DOWN_STATE);
			
			if (_soundGroup != null)
			{
				_soundGroup.playButtonClick();
			}
		}

		private function onMouseOut(event:MouseEvent):void
		{
			setState(UP_STATE);
			
			if (_soundGroup != null)
			{
				_soundGroup.playButtonOut();
			}
		}

		private function onMouseOver(event:MouseEvent):void
		{
			setState(OVER_STATE);
			
			if (_soundGroup != null)
			{
				_soundGroup.playButtonOver();
			}
		}
		
		protected function setState(state:String):void
		{
			_state = state;
			
			_skin.gotoAndStop(_state);
			updateCaption();
		}
		
		private function updateCaption():void
		{
			if (_skin["tfCaption"] != null && _caption != null)
			{
				TextField(_skin["tfCaption"]).text = _caption;
			}
		}

		public function get skin():*
		{
			return _skin;
		}

		public function set skin(value:*):void
		{
			removeMouseListeners();
			
			_skin = skin;
			_skin.mouseChildren = false;
			_skin.buttonMode = true;
			
			_skin.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
			_skin.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
			_skin.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			_skin.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			
			setState(UP_STATE);
			_caption = "";
		}
		
		public function set caption(value:String):void
		{
			_caption = value;
			updateCaption();
		}
		
		public function get caption():String
		{
			return _caption;
		}
		
		public function get click():ISignal
		{
			return _click;
		}

		public function set soundGroup(soundGroup:IUISoundGroup):void
		{
			_soundGroup = soundGroup;
		}

		public function get soundGroup():IUISoundGroup
		{
			return _soundGroup;
		}
	}
}
