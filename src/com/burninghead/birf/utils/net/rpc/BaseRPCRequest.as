package com.burninghead.birf.utils.net.rpc
{
	/**
	 * @author Zoulz
	 */
	public class BaseRPCRequest implements IRPCRequest
	{
		private var _id:String;
		private var _method:String;
		private var _params:Object;
		
		public function BaseRPCRequest(id:String, method:String, params:Array)
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
				return { method: _method, params: _params };
			}
			else
			{
				return { method:_method, params:_params, id:_id };
			}
		}
	}
}
