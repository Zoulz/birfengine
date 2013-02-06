package com.burninghead.birf.utils.list
{
	/**
	 * @author tomas.augustinovic
	 */
	public interface IListItem
	{
		function execute(callback:Function):void;
		function abort():void;
	}
}
