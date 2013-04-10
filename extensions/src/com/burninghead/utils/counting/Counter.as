package com.burninghead.utils.counting
{
	import com.greensock.TweenLite;
	import com.greensock.easing.Linear;

	import org.osflash.signals.ISignal;
	import org.osflash.signals.Signal;
	/**
	 * @author tomas.augustinovic
	 */
	public class Counter implements IDisposable
	{
		private var _value:Number;
		private var _func:ICountFunction;
		
		public function Counter(initialValue:Number, func:ICountFunction = null)
		{
			_value = initialValue;

			if (func)
			{
				_func = func;
			}
			else
			{
				_func = new TweenCountFunction();
			}
			
			_func.step.add(onCountStep);
			_func.complete.add(OnCountComplete);
		}
		
		public function countTo(newValue:Number, seconds:Number = 1):void
		{
			_func.count(newValue, seconds);
		}
		
		public function abort():void
		{
			_func.abort();
		}
		
		public function get value():Number
		{
			return _value;
		}
		
		public function set value(num:Number):void
		{
			_value = num;
		}

		public function dispose():void
		{
			_func.abort();
		}
	}
}
