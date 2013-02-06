package com.burninghead.birf.utils.list.items
{
	import com.burninghead.birf.utils.list.IListItem;
	/**
	 * @author BigZoulz
	 */
	public class FunctionItem implements IListItem
	{
		private var _func:Function;
		private var _args:Array;
		
		/**
		 * Constructor. Save references to method and it's args.
		 * @param method Function to call.
		 * @param args Arguments for the function call.
		 */
		public function FunctionItem(method:Function, ...args)
		{
			_func = method;
			_args = args;
		}
		
		/**
		 * Call the function and then perform the callback to list.
		 * @param callback Callback function from list.
		 */
		public function execute(callback:Function):void
		{
			_func.apply(null, _args);
			
			callback();
		}

		/**
		 * Function calls can't be aborted by list.
		 */
		public function abort():void
		{
			//	No-op; Can't abort a running function.
		}
	}
}
