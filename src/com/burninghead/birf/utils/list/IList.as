package com.burninghead.birf.utils.list
{
	import org.osflash.signals.ISignal;
	/**
	 * Utility to help execute a chain of actions.
	 * 
	 * @author tomas.augustinovic
	 */
	public interface IList
	{
		/**
		 * Add a list item.
		 * @param item Item to add
		 */
		function addItem(item:IListItem):void;
		/**
		 * Remove a item from list.
		 * @param item Item to remove
		 */
		function removeItem(item:IListItem):void;
		/**
		 * Clear all items from list.
		 */
		function clear():void;
		/**
		 * Start executing the items in the list.
		 */
		function run():void;
		/**
		 * Stop the list execution.
		 */
		function stop():void;
		/**
		 * Signal that is dispatched when the list have completed running.
		 */
		function get complete():ISignal;
		/**
		 * Signal dispatched if the list execution is aborted.
		 */
		function get aborted():ISignal;
		/**
		 * Signal that is dispatched when an item in the list is complete.
		 */
		function get itemComplete():ISignal;
		/**
		 * Returns true if the list is currently running.
		 */
		function get isRunning():Boolean;
	}
}
