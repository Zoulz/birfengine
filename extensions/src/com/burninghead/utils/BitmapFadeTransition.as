package com.burninghead.utils
{
	import com.greensock.TweenLite;

	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	/**
	 * @author tomas.augustinovic
	 */
	public class BitmapFadeTransition
	{
		/**
		 * Fade in a display object by drawing it to a bitmap and hiding the object while the bitmap
		 * is alpha blended into view.
		 * @param obj Display object to fade in.
		 * @param callback Function to call when complete.
		 * @param animVars Object containing parameters for the greensock tween used when fading.
		 * @param callbackArgs Arguments for the callback function.
		 * @param delay The time for the fade tween to take.
		 * @return Bitmap
		 */
		public static function fadeIn(obj:DisplayObject, callback:Function, animVars:Object = null, callbackArgs:Array = null, delay:Number = 1):Bitmap
		{
			var bmp:Bitmap = new Bitmap(new BitmapData(obj.width, obj.height));
			bmp.bitmapData.draw(obj);
			
			obj.parent.addChild(bmp);
			obj.visible = false;
			
			var vars:Object = { alpha: 0, onComplete: fadeComplete, onCompleteParams: [ bmp, obj, callback, callbackArgs ] };
			if (animVars == null)
			{
				animVars = { };
			}

			TweenLite.from(bmp, delay, ObjectUtils.mergeObjects(vars, animVars));
			
			return bmp;
		}
		
		/**
		 * Fade out a display object by drawing it to a bitmap and hiding the object while the bitmap
		 * is alpha blended out of view.
		 * @param obj Display object to fade out.
		 * @param callback Function to call when complete.
		 * @param animVars Object containing parameters for the greensock tween used when fading.
		 * @param callbackArgs Arguments for the callback function.
		 * @param delay The time for the fade tween to take.
		 * @return Bitmap
		 */
		public static function fadeOut(obj:DisplayObject, callback:Function, animVars:Object = null, callbackArgs:Array = null, delay:Number = 1):Bitmap
		{
			var bmp:Bitmap = new Bitmap(new BitmapData(obj.width, obj.height));
			bmp.bitmapData.draw(obj);
			
			obj.parent.addChild(bmp);
			obj.visible = false;
			
			var vars:Object = { alpha: 0, onComplete: fadeComplete, onCompleteParams: [ bmp, obj, callback, callbackArgs ] };
			if (animVars == null)
			{
				animVars = { };
			}
			
			TweenLite.to(bmp, delay, ObjectUtils.mergeObjects(vars, animVars));
			
			return bmp;
		}
		
		/**
		 * Function call for when a fade in and out is complete. Restores the visibility of the display object and removes
		 * the generated bitmap.
		 */
		private static function fadeComplete(bmp:Bitmap, obj:DisplayObject, callback:Function, callbackArgs:Array):void
		{
			bmp.parent.removeChild(bmp);
			obj.visible = true;
			
			if (callback != null)
			{
				if (callbackArgs != null)
				{
					callback.apply(null, callbackArgs);
				}
				else
				{
					callback();
				}
			}
		}
	}
}
