package com.burninghead.utils
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.geom.Matrix;

	/**
	 * Utility methods for manipulating display objects and containers.
	 * 
	 * @author BigZoulz
	 */
	public final class DisplayObjectUtil
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
