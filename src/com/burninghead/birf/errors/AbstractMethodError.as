package com.burninghead.birf.errors
{
	/**
	 * @author tomas.augustinovic
	 */
	public class AbstractMethodError extends Error
	{
		function AbstractMethodError(message:* = "", id:* = 0)
		{
			super("[AbstractMethod] " + message, id);
		}
	}
}
