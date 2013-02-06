package com.burninghead.birf.utils
{
	import com.greensock.TweenLite;
	import com.greensock.easing.Linear;

	import org.osflash.signals.ISignal;
	import org.osflash.signals.Signal;
	/**
	 * @author BigZoulz
	 */
	public class Counter implements IDisposable
	{
		private var _value:Number;
		private var _complete:Signal;
		private var _update:Signal;
		
		public function Counter(initialValue:Number)
		{
			_complete = new Signal();
			_update = new Signal();
			_value = initialValue;
		}
		
		public function countTo(newValue:Number, seconds:Number = 1, easing:Object = null):void
		{
			TweenLite.to(this, seconds, { ease: easing == null ? Linear.easeNone : easing, value: newValue, overwrite: 1, onComplete: _complete.dispatch, onUpdate: _update.dispatch });
		}
		
		public function get value():Number
		{
			return _value;
		}
		
		public function set value(num:Number):void
		{
			_value = num;
		}

		public function get complete():ISignal
		{
			return _complete;
		}

		public function get update():ISignal
		{
			return _update;
		}

		public function dispose():void
		{
			TweenLite.killTweensOf(this);
			_complete.removeAll();
			_update.removeAll();
		}
	}
}
