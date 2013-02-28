package com.burninghead.utils.list
{
	import org.osflash.signals.ISignal;
	import org.osflash.signals.Signal;

	/**
	 * A list that executes all the items at once and is done when all the items have completed.
	 * 
	 * <pre>
	 * -----------------------------------------------------------------------------------------------------------------------------------------
	 * 
	 * Copyright (c) Tomas Augustinovic 2012-2013
	 *
	 * Licence Agreement (The MIT License)
	 *
	 * Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files
	 * (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge,
	 * publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do
	 * so, subject to the following conditions:
	 *
	 * The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
	 *
	 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
	 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE
	 * FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
	 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
	 * 
	 * -----------------------------------------------------------------------------------------------------------------------------------------
	 * </pre>
	 * 
	 * @author tomas.augustinovic
	 */
	public class ConcurrentList implements IList
	{
		private var _list:Vector.<IListItem>;
		private var _itemsCompleteCount:uint;
		private var _isRunning:Boolean;
		private var _complete:Signal;
		private var _aborted:Signal;
		private var _itemComplete:Signal;
		
		/**
		 * Constructor. Reset variables.
		 */
		public function ConcurrentList()
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
			_itemsCompleteCount = 0;
			
			for each (var item:IListItem in _list)
			{
				item.execute(onItemComplete);
			}
		}
		
		/**
		 * A list item is complete, so dispatch signals and check
		 * if we should continue or the list is done.
		 */
		private function onItemComplete():void
		{
			_itemsCompleteCount++;
			
			_itemComplete.dispatch();
			
			if (_itemsCompleteCount == _list.length || _isRunning == false)
			{
				if (_isRunning == false)
				{
					_aborted.dispatch();
				}
				else
				{
					_complete.dispatch();
				}
			}
		}

		/**
		 * Stop the list from executing.
		 */
		public function stop():void
		{
			_isRunning = false;
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
