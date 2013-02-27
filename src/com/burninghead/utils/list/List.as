package com.burninghead.utils.list
{
	import org.osflash.signals.Signal;
	import org.osflash.signals.ISignal;

	/**
	 * Executes a list of items in sequential order.
	 * 
	 * @author tomas.augustinovic
	 */
	public class List implements IList
	{
		private var _list:Vector.<IListItem>;
		private var _currentIndex:uint;
		private var _isRunning:Boolean;
		private var _complete:Signal;
		private var _aborted:Signal;
		private var _itemComplete:Signal;
		
		/**
		 * Constructor. Reset variables.
		 */
		public function List()
		{
			_isRunning = false;
			_complete = new Signal();
			_aborted = new Signal();
			_itemComplete = new Signal();
			clear();
		}
		
		/**
		 * Adds a item to the list.
		 * @param item Item to add.
		 */
		public function addItem(item:IListItem):void
		{
			if (item != null)
			{
				_list.push(item);
			}
		}

		/**
		 * Remove item from the list.
		 * @param item Item to remove.
		 */
		public function removeItem(item:IListItem):void
		{
			for (var i:int = 0; i < _list.length; i++)
			{
				if (_list[i] == item)
				{
					_list.splice(i, 1);
					break;
				}
			}
		}

		/**
		 * Clear the list items.
		 */
		public function clear():void
		{
			_list = new Vector.<IListItem>();
		}

		/**
		 * Run the list and execute the items in sequence.
		 */
		public function run():void
		{
			_isRunning = true;
			_currentIndex = 0;
			_list[_currentIndex].execute(onItemComplete);
		}
		
		/**
		 * A list item is complete, so dispatch signals and check
		 * if we should continue or the list is done.
		 */
		private function onItemComplete():void
		{
			_itemComplete.dispatch();
			if (_isRunning == false)
			{
				_aborted.dispatch();
				return;
			}
			
			_currentIndex++;
			if (_currentIndex < _list.length)
			{
				_list[_currentIndex].execute(onItemComplete);
			}
			else
			{
				_isRunning = false;
				_complete.dispatch();
			}
		}

		/**
		 * Stop the list from executing.
		 */
		public function stop():void
		{
			_isRunning = false;
			_list[_currentIndex].abort();
			
		}

		/**
		 * Return the signal indicating when the list is complete.
		 * @return ISignal
		 */
		public function get complete():ISignal
		{
			return _complete;
		}

		/**
		 * Return the signal indicating a list item is complete.
		 * @return ISignal
		 */
		public function get itemComplete():ISignal
		{
			return _itemComplete;
		}

		/**
		 * Return if the list is currently running.
		 * @return Boolean
		 */
		public function get isRunning():Boolean
		{
			return _isRunning;
		}

		public function get aborted():ISignal
		{
			return _aborted;
		}
	}
}
