package com.burninghead.utils.net.rpc
{
	/**
	 * Describes a RPC remote request.
	 * 
	 * @author tomas.augustinovic
	 */
	public interface IRPCRequest
	{
		/**
		 * Unique identifier of this request.
		 */
		function get id():String;
		/**
		 * Call to be invoked on the remote service.
		 */
		function get method():String;
		/**
		 * Parameters for the method call.
		 */
		function get params():Object;
		/**
		 * Return this request as a generic object.
		 */
		function asObject():Object;
	}
}
