package com.burninghead.birf.net.rpc.json
{
	import com.burninghead.birf.net.rpc.IRPCRequest;
	/*********************************************************
	 * Simple value object that holds infromation about
	 * a standard RPC request. Also holds reference to a
	 * callback method.
	 * 
	 * @author tomas.augustinovic
	 *********************************************************/
	public class JsonRPCRequest implements IRPCRequest
	{
		private var _id:String;
		private var _method:String;
		private var _params:Object;
		
		public function JsonRPCRequest(id:String, method:String, params:Array)
		{
			_id = id;
			_method = method;
			_params = params;
		}

		public function get params():Object
		{
			return _params;
		}

		public function get method():String
		{
			return _method;
		}

		public function get id():String
		{
			return _id;
		}
		
		public function asObject():Object
		{
			if (_id == null)
			{
				return { method: _method, params: _params, jsonrpc: "2.0" };
			}
			else
			{
				return { method:_method, params:_params, id:_id, jsonrpc: "2.0" };
			}
		}
	}
}
