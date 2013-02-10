package com.burninghead.birf.utils.misc
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	/**
	 * @author Zoulz
	 */
	public class DelayedFunction
	{
		private var _timer:Timer;
		private var _func:Function;
		
		public function DelayedFunction(delayMillisecs:uint, func:Function)
		{
			_timer = new Timer(delayMillisecs);
			_timer.addEventListener(TimerEvent.TIMER, onDelayComplete);
			_timer.start();
			
			_func = func;
		}

		private function onDelayComplete(event:TimerEvent):void
		{
			_timer.removeEventListener(TimerEvent.TIMER, onDelayComplete);
			_timer.stop();
			
			_func();
		}
	}
}
