package com.burninghead.birf.utils.list.items
{
	import com.burninghead.birf.utils.list.IList;
	import com.burninghead.birf.utils.list.IListItem;
	/**
	 * @author BigZoulz
	 */
	public class NestedListItem implements IListItem
	{
		private var _list:IList;
		private var _callback:Function;
		
		public function NestedListItem(list:IList)
		{
			_list = list;
		}
		
		public function execute(callback:Function):void
		{
			_callback = callback;
			_list.complete.addOnce(_callback);
			_list.run();
		}

		public function abort():void
		{
			_list.stop();
		}
	}
}
