package com.burninghead.birf.model
{
	/**
	 * @author tomas.augustinovic
	 */
	public interface IModel
	{
		/**
		 * Register model part proxy.
		 * @param proxy Proxy interface
		 * @param impl Class implementation of proxy
		 * @param name For multiple proxies sharing one interface, a name handle can be used
		 */
		function registerProxy(proxy:Class, impl:Class, name:String = ""):void;
		/**
		 * Remove model part proxy.
		 * @param proxy Proxy interface
		 * @param name For shared interfaces a name can be given to indentify a specific proxy
		 */
		function unregisterProxy(proxy:Class, name:String = ""):void;
		/**
		 * Return proxy of the given interface and name.
		 * @param proxy Proxy interface
		 * @param name For shared interfaces a name can be given to indentify a specific proxy
		 * @return IProxy
		 */
		function getProxy(proxy:Class, name:String = ""):IProxy;
	}
}
