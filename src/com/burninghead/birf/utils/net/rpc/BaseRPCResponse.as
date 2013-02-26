package com.burninghead.birf.utils.net.rpc
{
	/**
	 * Value object holding information about a standard RPC
	 * response.
	 * 
	 * @author tomas.augustinovic
	 */
	public class BaseRPCResponse implements IRPCResponse
	{
		private var _id:int;
		private var _result:Object;
		private var _error:Object;
		
		/**
		 * Parses the id, result and error data from the
		 * supplied initializer object.
		 * @param data Holds raw data that will be parsed.
		 */
		public function BaseRPCResponse(data:Object)
		{
			_id = data.id;
			_result = data.result;
			_error = data.error;
		}

		/**
		 * @inheritDoc
		 */
		public function get error():Object
		{
			return _error;
		}
		
		/**
		 * @inheritDoc
		 */
		public function get errorCode():int
		{
			return _error.code;
		}
		
		/**
		 * @inheritDoc
		 */
		public function get errorMessage():String
		{
			return _error.message;
		}

		/**
		 * @inheritDoc
		 */
		public function get errorData():Object
		{
			return _error.data;
		}

		/**
		 * @inheritDoc
		 */
		public function get result():Object
		{
			return _result;
		}

		/**
		 * @inheritDoc
		 */
		public function get id():int
		{
			return _id;
		}
	}
}
