package com.burninghead.birf.net.rpc
{
	/**
	 * @author tomas.augustinovic
	 */
	public interface IRPCRequest
	{
		function get id():String;
		function get method():String;
		function get params():Object;
		function asObject():Object;
	}
}
