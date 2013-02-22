package com.burninghead.extensions.utils.list.items
{
	import com.burninghead.birf.utils.list.IListItem;
	/**
	 * @author BigZoulz
	 */
	public class CallbackItem implements IListItem
	{
		private var _func:Function;
		private var _args:Array;
		private var _callback:Function;
		
		public function CallbackItem(method:Function, ...args)
		{
			_func = method;
			_args = args;
		}
		
		public function execute(callback:Function):void
		{
			_callback = callback;
			
			//	Add callback as first argument.
			_args.unshift(_callback);
			
			//	Execute function.
			_func.apply(null, _args);
		}

		public function abort():void
		{
			_callback();
			
			_callback = null;
		}
	}
}
