package com.burninghead.birf.utils.list.items
{
	import com.burninghead.birf.utils.list.IListItem;

	import flash.events.TimerEvent;
	import flash.utils.Timer;
	/**
	 * @author tomas.augustinovic
	 */
	public class PauseItem implements IListItem
	{
		private var _tm:Timer;
		private var _callback:Function;
		
		/**
		 * Constructor. Sets the amount of milliseconds to pause.
		 */
		public function PauseItem(milliseconds:uint)
		{
			_tm = new Timer(milliseconds, 1);
			_tm.addEventListener(TimerEvent.TIMER, onTimerComplete);
		}

		/**
		 * Event handler for when the timer is complete. Stops and removes
		 * the timer and then performs the list callback.
		 * @param event TimerEvent
		 */
		private function onTimerComplete(event:TimerEvent):void
		{
			_tm.removeEventListener(TimerEvent.TIMER, onTimerComplete);
			_tm.stop();
			
			_callback();
		}
		
		/**
		 * Simply starts the timer.
		 */
		public function execute(callback:Function):void
		{
			_callback = callback;
			_tm.start();
		}

		/**
		 * Stops the timer and performs the callback to list.
		 */
		public function abort():void
		{
			_tm.removeEventListener(TimerEvent.TIMER, onTimerComplete);
			_tm.stop();
			
			_callback();
		}
	}
}
