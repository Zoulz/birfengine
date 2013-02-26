package com.burninghead.birf.view
{
	import com.burninghead.birf.utils.IDisposable;
	/**
	 * Describes a mediator. Allows the mediator to register with a view 
	 * component instance that it subsequently will use to operate upon.
	 * 
	 * @author tomas.augustinovic
	 */
	public interface IMediator extends IDisposable
	{
		/**
		 * Register view object which this mediator will operate on.
		 * @param value View component object.
		 */
		function registerView(value:*):void;
	}
}
