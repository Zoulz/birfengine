package com.burninghead.utils
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.geom.Matrix;

	/**
	 * Utility methods for manipulating display objects and containers.
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
	public final class DisplayObjectUtils
	{
		/**
		 * Remove all the children of the supplied container object.
		 * @param doc Container to remove children from.
		 */
		public static function removeAllChildren(doc:DisplayObjectContainer):void
		{
			while (doc.numChildren > 0)
			{
				doc.removeChildAt(0);
			}
		}
		
		/**
		 * Flips a display object horizontally by applying a transform matrix.
		 * @param obj DisplayObject to apply to.
		 */
		public static function flipHorizontal(obj:DisplayObject):void
		{
			var mx:Matrix = obj.transform.matrix;
			mx.a = -1;
			mx.tx = obj.width + obj.x;
			obj.transform.matrix = mx;
		}
		
		/**
		 * Flips a display object vertically by applying a transform matrix.
		 * @param obj DisplayObject to apply to.
		 */
		public static function flipVertical(obj:DisplayObject):void
		{
			var mx:Matrix = obj.transform.matrix;
			mx.d = -1;
			mx.ty = obj.height + obj.y;
			obj.transform.matrix = mx;
		}
	}
}
