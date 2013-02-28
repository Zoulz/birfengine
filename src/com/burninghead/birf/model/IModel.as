package com.burninghead.birf.model
{
	/**
	 * Describes a model implementation in birf. A model contains models and/or services. A model typically holds data and a service
	 * (as the name suggests) performs a certain service for the application.
	 * 
	 * <pre>
	 * -----------------------------------------------------------------------------------------------------------------------------------------
	 * 
	 * Copyright (c) Tomas Augustinovic 2012-2013
	 *
	 * Licence Agreement (The MIT License)
	 *
	 * Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files
	 * (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge,
	 * publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do
	 * so, subject to the following conditions:
	 *
	 * The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
	 *
	 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
	 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE
	 * FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
	 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
	 * 
	 * -----------------------------------------------------------------------------------------------------------------------------------------
	 * </pre>
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
