package com.burninghead.birf.view.skinning
{
	/**
	 * Base implementation of skin manager. Keeps references to all the registered skinnables.
	 * 
	 * <pre>
	 * -----------------------------------------------------------------------------------------------------------------------------------------
	 * 
	 * Copyright (c) Tomas Augustinovic 2012-2013
	 *
	 * Licence Agreement (The MIT License)
	 *
	 * Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files
	 * (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge,
	 * publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do
	 * so, subject to the following conditions:
	 *
	 * The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
	 *
	 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
	 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE
	 * FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
	 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
	 * 
	 * -----------------------------------------------------------------------------------------------------------------------------------------
	 * </pre>
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
