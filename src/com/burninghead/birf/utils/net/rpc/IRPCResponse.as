package com.burninghead.birf.utils.net.rpc
{
	/**
	 * Describes a RPC remote call response.
	 * 
	 * @author tomas.augustinovic
	 */
	public interface IRPCResponse
	{
		/**
		 * Contains data structure retrieved upon error.
		 */
		function get error():Object;
		/**
		 * If a error occurs a code is supplied.
		 */
		function get errorCode():int;
		/**
		 * Message if a error occurs.
		 */
		function get errorMessage():String;
		/**
		 * Data structure containing error data.
		 */
		function get errorData():Object;
		/**
		 * Data that resulted of the call.
		 */
		function get result():Object;
		/**
		 * Message identifier. Each call has a unique id.
		 */
		function get id():int;
	}
}
