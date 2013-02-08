package com.burninghead.birf.errors
{
	/**
	 * @author tomas.augustinovic
	 */
	public class AbstractMethodError extends Error
	{
		function AbstractMethodError(message:* = "", id:* = 0)
		{
			super("Abstract method must be implemented in subclass.", id);
		}
	}
}
