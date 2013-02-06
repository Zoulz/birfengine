package com.burninghead.birf.utils.list.items
{
	import com.burninghead.birf.utils.list.IListItem;
	import com.greensock.core.TweenCore;
	/**
	 * @author tomas.augustinovic
	 */
	public class TweenItem implements IListItem
	{
		private var _tween:TweenCore;
		private var _callback:Function;
		
		/**
		 * Constructor. Save reference for the (greensock) tween.
		 */
		public function TweenItem(tween:TweenCore)
		{
			_tween = tween;
			_tween.paused = true;
		}
		
		/**
		 * Sets the onComplete event handler for the tween to the list
		 * callback function and then plays the tween.
		 * @param callback Callback from list.
		 */
		public function execute(callback:Function):void
		{
			_callback = callback;
			_tween.vars.onComplete = _callback;

			_tween.play();
		}

		/**
		 * Kills the tween and calls the list callback function.
		 */
		public function abort():void
		{
			_tween.kill();
			_callback();
		}
	}
}
