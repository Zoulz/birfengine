package com.burninghead.extensions.view.stage2d.comps.ui
{
	import com.burninghead.extensions.audio.groups.IUISoundGroup;
	import com.greensock.OverwriteManager;
	import com.greensock.core.TweenCore;

	import flash.display.MovieClip;
	/**
	 * @author BigZoulz
	 */
	public class Stage2DTweenButton extends Stage2DButton implements IButton
	{
		private var _upAnim:TweenCore;
		private var _downAnim:TweenCore;
		private var _overAnim:TweenCore;
		private var _disabledAnim:TweenCore;
		
		public function Stage2DTweenButton(skin:MovieClip, sndGroup:IUISoundGroup = null)
		{
			super(skin, sndGroup);
			
			OverwriteManager.init();
		}
		
		override protected function setState(state:String):void
		{
			_state = state;
			
			switch (_state)
			{
				case UP_STATE:
				{
					if (_upAnim)
					{
						_upAnim.invalidate();
						_upAnim.restart();
					}
					break;
				}
				case OVER_STATE:
				{
					if (_overAnim)
					{
						_overAnim.invalidate();
						_overAnim.restart();
					}
					break;
				}
				case DOWN_STATE:
				{
					if (_downAnim)
					{
						_downAnim.invalidate();
						_downAnim.restart();
					}
					break;
				}
				case DISABLED_STATE:
				{
					if (_disabledAnim)
					{
						_disabledAnim.invalidate();
						_disabledAnim.restart();
					}
					break;
				}
			}
		}

		public function get upAnim():TweenCore
		{
			return _upAnim;
		}

		public function set upAnim(upAnim:TweenCore):void
		{
			_upAnim = upAnim;
			_upAnim.paused = true;
		}

		public function get downAnim():TweenCore
		{
			return _downAnim;
		}

		public function set downAnim(downAnim:TweenCore):void
		{
			_downAnim = downAnim;
			_downAnim.paused = true;
		}

		public function get overAnim():TweenCore
		{
			return _overAnim;
		}

		public function set overAnim(overAnim:TweenCore):void
		{
			_overAnim = overAnim;
			_overAnim.paused = true;
		}

		public function get disabledAnim():TweenCore
		{
			return _disabledAnim;
		}

		public function set disabledAnim(disabledAnim:TweenCore):void
		{
			_disabledAnim = disabledAnim;
			_disabledAnim.paused = true;
		}
	}
}
