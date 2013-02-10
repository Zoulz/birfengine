package com.burninghead.birf.net.rpc.json
{
	import com.burninghead.birf.net.rpc.BaseRPCResponse;
	import com.burninghead.birf.net.rpc.BaseRPCService;
	import com.burninghead.birf.net.rpc.IRPCRequest;
	import com.burninghead.birf.net.rpc.IRPCResponse;
	import com.burninghead.birf.net.rpc.IRPCService;

	/*********************************************************
	 * JSON-RPC implementation of service.
	 * 
	 * @author tomas.augustinovic
	 *********************************************************/
	public class JsonRPCService extends BaseRPCService implements IRPCService
	{
		public function JsonRPCService(url:String)
		{
			super(url);
		}
		
		override protected function createResponse(initializer:Object):IRPCResponse
		{
			return new BaseRPCResponse(initializer);
		}
		
		override protected function createRequest(id:String, method:String, params:Array = null):IRPCRequest
		{
			return new JsonRPCRequest(id, method, params);
		}
		
		override protected function getRequestContentType():String
		{
			return "application/json";
		}
		
		override protected function encodeRequests(reqs:Array):String
		{
			var enc:Object;
			
			if (reqs.length == 1)
			{
				enc = IRPCRequest(reqs[0]).asObject();
			}
			else
			{
				enc = [ ];
				for each (var req:IRPCRequest in reqs)
				{
					Array(enc).push(req.asObject());
				}
			}
			
			return JSON.stringify(enc);
		}
		
		override protected function parseResponse(resp:String):void
		{
			var data:Object = JSON.parse(resp);
			
			if (data is Array)
			{
				for each (var obj:Object in data)
				{
					_responses.push(createResponse(obj));
				}
			}
			else
			{
				_responses.push(createResponse(data));
			}
		}
	}
}
