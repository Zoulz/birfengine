package com.burninghead.birf.view.skinning
{
	/**
	 * Base implementation of skin manager. Keeps references to all the 
	 * registered skinnables.
	 * 
	 * @see ISkinnable
	 * 
	 * @author tomas.augustinovic
	 */
	public class BaseSkinManager implements ISkinManager
	{
		private var _skinnables:Vector.<ISkinnable>;
		
		/**
		 * Sets default member values.
		 */
		public function BaseSkinManager()
		{
			_skinnables = new Vector.<ISkinnable>();
		}

		/**
		 * @inheritDoc
		 */
		public function registerSkinnable(skinnable:ISkinnable):void
		{
			if (skinnable != null)
			{
				_skinnables.push(skinnable);
			}
		}

		/**
		 * @inheritDoc
		 */
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

		/**
		 * @inheritDoc
		 */
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
