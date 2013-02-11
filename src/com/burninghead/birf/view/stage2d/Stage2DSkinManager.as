package com.burninghead.birf.view.stage2d
{
	import com.burninghead.birf.view.skinning.ISkinManager;
	import com.burninghead.birf.view.skinning.ISkinnable;
	/**
	 * @author tomas.augustinovic
	 */
	public class Stage2DSkinManager implements ISkinManager
	{
		private var _skinnables:Vector.<ISkinnable>;
		
		public function Stage2DSkinManager()
		{
			_skinnables = new Vector.<ISkinnable>();
		}

		public function registerSkinnable(skinnable:ISkinnable):void
		{
			if (skinnable != null)
			{
				_skinnables.push(skinnable);
			}
		}

		public function unregisterSkinnable(skinnable:ISkinnable):void
		{
			for (var i:uint = 0; i < _skinnables.length; i++)
			{
				if (_skinnables[i] == skinnable)
				{
					_skinnables = _skinnables.splice(i, 1);
					return;
				}
			}
		}

		public function setSkin(skin:*, applyTo:Class):void
		{
			for each (var skinnable:ISkinnable in _skinnables)
			{
				if (skinnable is applyTo)
				{
					skinnable.skin = skin;
				}
			}
		}
	}
}
