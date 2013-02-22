package com.burninghead.extensions.utils.list.items
{
	import com.burninghead.birf.utils.list.IListItem;

	import org.osflash.signals.ISignal;
	/**
	 * @author tomas.augustinovic
	 */
	public class SignalItem implements IListItem
	{
		private var _signal:ISignal;
		private var _callback:Function;
		
		/**
		 * Constructor. Save the signal reference.
		 * @param signal Signal to listen for.
		 */
		public function SignalItem(signal:ISignal)
		{
			_signal = signal;
		}

		/**
		 * Adds a listener on the signal and when it fires we
		 * perform the list callback.
		 * @param callback Callback to list.
		 */
		public function execute(callback:Function):void
		{
			_callback = callback;
			_signal.addOnce(_callback);
		}

		/**
		 * Removes the listener from the signal and performs the
		 * list callback.
		 */
		public function abort():void
		{
			_signal.remove(_callback);
			_callback();
		}
	}
}
