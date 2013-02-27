package com.burninghead.utils.list
{
	/**
	 * @author tomas.augustinovic
	 */
	public interface IListItem
	{
		/**
		 * Execute the functionality for this list item.
		 * @param callback Callback function for when the item is complete
		 */
		function execute(callback:Function):void;
		/**
		 * Abort the item functionality.
		 */
		function abort():void;
	}
}
