package com.burninghead.birf.model
{
	/**
	 * Describes a model implementation in birf. A model contains models and/or
	 * services. A model typically holds data and a service (as the name suggests)
	 * performs a certain service for the application.
	 * 
	 * @see IProxy
	 * 
	 * @author tomas.augustinovic
	 */
	public interface IModel
	{
		/**
		 * Register model/service proxy.
		 * @param proxy Proxy interface.
		 * @param impl Class implementation of proxy.
		 * @param name For multiple proxies sharing one interface, a name handle can be used.
		 */
		function registerProxy(proxy:Class, impl:Class, name:String = ""):void;
		/**
		 * Remove model/service proxy.
		 * @param proxy Proxy interface.
		 * @param name For shared interfaces a name can be given to indentify a specific proxy.
		 */
		function unregisterProxy(proxy:Class, name:String = ""):void;
		/**
		 * Return model/service of the given proxy interface and name.
		 * @param proxy Proxy interface.
		 * @param name For shared interfaces a name can be given to indentify a specific proxy.
		 * @return Model/service
		 */
		function getProxy(proxy:Class, name:String = ""):IProxy;
	}
}
