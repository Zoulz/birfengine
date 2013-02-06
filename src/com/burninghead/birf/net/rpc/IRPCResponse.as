package com.burninghead.birf.net.rpc
{
	/**
	 * @author tomas.augustinovic
	 */
	public interface IRPCResponse
	{
		function get error():Object;
		function get errorCode():int;
		function get errorMessage():String;
		function get errorData():Object;
		function get result():Object;
		function get id():int;
	}
}
