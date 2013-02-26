package com.burninghead.birf.errors
{
	/**
	 * Error thrown on methods that are suppose to be marked as abstract.
	 * Since AS3 does not support real abstract methods.
	 * 
	 * @author tomas.augustinovic
	 */
	public class AbstractMethodError extends Error
	{
		/**
		 * Supply constructor with a fixed error message.
		 * @param message Ignored.
		 * @param id Id of error.
		 */
		function AbstractMethodError(message:* = "", id:* = 0)
		{
			super("Abstract method must be implemented in subclass.", id);
		}
	}
}
