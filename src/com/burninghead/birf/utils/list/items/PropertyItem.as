package com.burninghead.birf.utils.list.items
{
	import com.burninghead.birf.utils.list.IListItem;
	/**
	 * @author BigZoulz
	 */
	public class PropertyItem implements IListItem
	{
		private var _obj:Object;
		private var _prop:String;
		private var _val:*;
		
		public function PropertyItem(obj:Object, prop:String, value:*)
		{
			_obj = obj;
			_prop = prop;
			_val = value;
		}
		
		public function execute(callback:Function):void
		{
			_obj[_prop] = _val;
			
			callback();
		}

		public function abort():void
		{
		}
	}
}
