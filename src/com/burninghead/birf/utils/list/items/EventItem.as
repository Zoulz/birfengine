package com.burninghead.birf.utils.list.items
{
	import com.burninghead.birf.utils.list.IListItem;

	import flash.events.Event;
	import flash.events.IEventDispatcher;
	/**
	 * @author BigZoulz
	 */
	public class EventItem implements IListItem
	{
		private var _dispatcher:IEventDispatcher;
		private var _type:String;
		private var _callback:Function;
		
		public function EventItem(dispatcher:IEventDispatcher, type:String)
		{
			_dispatcher = dispatcher;
			_type = type;
		}
		
		public function execute(callback:Function):void
		{
			_callback = callback;
			_dispatcher.addEventListener(_type, onEventDispatched);
		}

		private function onEventDispatched(event:Event):void
		{
			_dispatcher.removeEventListener(_type, onEventDispatched);
			_callback();
		}

		public function abort():void
		{
			onEventDispatched(null);
		}
	}
}
