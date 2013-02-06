package com.burninghead.birf.model
{
	/**
	 * @author tomas.augustinovic
	 */
	public interface IModel
	{
		function registerProxy(proxy:Class, impl:Class, name:String = ""):void;
		function unregisterProxy(proxy:Class, name:String = ""):void;
		function getModelPart(proxy:Class, name:String = ""):IProxy;
	}
}
