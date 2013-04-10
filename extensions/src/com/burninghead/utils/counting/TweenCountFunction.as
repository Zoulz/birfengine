package com.burninghead.utils.counting
{
	/**
	 * @author tomas.augustinovic
	 */
	public class TweenCountFunction implements ICountFunction
	{
		private var _complete:Signal;
		private var _update:Signal;
		private var _easing:Object;
		
		public function TweenCountFunction(easing:Object = null)
		{
			_easing = easing;
			_complete = new Signal();
			_update = new Signal();
		}
		
		function count(newValue:Number, seconds:Number):void
		{
			TweenLite.to(this, seconds, { ease: _easing == null ? Linear.easeNone : _easing, value: newValue, overwrite: 1, onComplete: _complete.dispatch, onUpdate: _update.dispatch });
		}
		
		function abort():void
		{
			TweenLite.killTweensOf(this);
		}
		
		function get step():ISignal
		{
			return _update;
		}
		
		function get complete():ISignal
		{
			return _complete;
		}
	}
}
