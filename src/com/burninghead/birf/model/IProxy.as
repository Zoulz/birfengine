package com.burninghead.birf.model
{
	import com.burninghead.utils.IDisposable;
	/**
	 * Describes a proxy implementation in birf. This interface is basically
	 * just to mark the class as a proxy. It does extend the disposable
	 * interface to allow the proxy implementation to clean up.
	 * 
	 * @see IDisposable
	 * @see IModel
	 * 
	 * @author tomas.augustinovic
	 */
	public interface IProxy extends IDisposable
	{
	}
}
