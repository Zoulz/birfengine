package com.burninghead.birf.utils.net.rpc
{
	/*********************************************************
	 * Value object holding information about a standard RPC
	 * response.
	 * 
	 * @author tomas.augustinovic
	 * @see com.warden.net.rpc.IRPCResponse
	 * @see com.warden.net.rpc.json.JsonRPCService
	 *********************************************************/
	public class BaseRPCResponse implements IRPCResponse
	{
		private var _id:int;
		private var _result:Object;
		private var _error:Object;
		
		public function BaseRPCResponse(data:Object)
		{
			_id = data.id;
			_result = data.result;
			_error = data.error;
		}

		public function get error():Object
		{
			return _error;
		}
		
		public function get errorCode():int
		{
			return _error.code;
		}
		
		public function get errorMessage():String
		{
			return _error.message;
		}
		
		public function get errorData():Object
		{
			return _error.data;
		}

		public function get result():Object
		{
			return _result;
		}

		public function get id():int
		{
			return _id;
		}
	}
}
