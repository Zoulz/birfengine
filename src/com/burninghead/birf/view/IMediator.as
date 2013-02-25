package com.burninghead.birf.view
{
	import com.burninghead.birf.utils.IDisposable;
	/**
	 * @author tomas.augustinovic
	 */
	public interface IMediator extends IDisposable
	{
		/**
		 * Register view object which this mediator will operate on.
		 * @param value View object
		 */
		function registerView(value:*):void;
	}
}
