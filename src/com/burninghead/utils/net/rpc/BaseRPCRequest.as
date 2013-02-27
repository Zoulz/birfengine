package com.burninghead.utils.net.rpc
{
	/**
	 * Base class implementation of a RPC request.
	 * 
	 * @author tomas.augustinovic
	 */
	public class BaseRPCRequest implements IRPCRequest
	{
		private var _id:String;
		private var _method:String;
		private var _params:Object;
		
		/**
		 * Sets the member values based on parameters.
		 * @param id Id of the request.
		 * @param method Method name.
		 * @param params Parameters for the method call.
		 */
		public function BaseRPCRequest(id:String, method:String, params:Array)
		{
			_id = id;
			_method = method;
			_params = params;
		}
		
		/**
		 * @inheritDoc
		 */
		public function get params():Object
		{
			return _params;
		}

		/**
		 * @inheritDoc
		 */
		public function get method():String
		{
			return _method;
		}

		/**
		 * @inheritDoc
		 */
		public function get id():String
		{
			return _id;
		}

		/**
		 * @inheritDoc
		 */
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
