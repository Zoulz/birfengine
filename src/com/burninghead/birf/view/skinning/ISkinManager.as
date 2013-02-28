package com.burninghead.birf.view.skinning
{
	/**
	 * Describes a skin manager. Allows the registration and removal of skinnable objects. Can also trigger a re-skinning of the contained
	 * objects.
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
	 * @author tomas.augustinovic
	 */
	public interface ISkinManager
	{
		/**
		 * Register a skinnable object with the manager.
		 * @param skinnable Object to be skinned.
		 */
		function registerSkinnable(skinnable:ISkinnable):void;
		/**
		 * Remove skinnable object from manager.
		 * @param skinnable Object to be removed.
		 */
		function unregisterSkinnable(skinnable:ISkinnable):void;
		/**
		 * Apply skin to all the objects of a certain class.
		 * @param skin Skin to apply.
		 * @param applyTo Apply to classes of this type.
		 */
		function setSkin(skin:*, applyTo:Class):void;
	}
}
