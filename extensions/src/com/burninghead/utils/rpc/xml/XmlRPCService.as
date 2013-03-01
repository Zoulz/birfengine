package com.burninghead.utils.rpc.xml
{
	import com.burninghead.utils.rpc.BaseRPCRequest;
	import com.burninghead.utils.rpc.BaseRPCResponse;
	import com.burninghead.utils.rpc.BaseRPCService;
	import com.burninghead.utils.rpc.IRPCRequest;
	import com.burninghead.utils.rpc.IRPCResponse;
	import com.burninghead.utils.rpc.IRPCService;
	/**
	 * XML-RPC implementation of service.
	 * 
	 * @author tomas.augustinovic
	 */
	public class XmlRPCService extends BaseRPCService implements IRPCService
	{
		public function XmlRPCService(url:String)
		{
			super(url);
		}
		
		override protected function createResponse(initializer:Object):IRPCResponse
		{
			return new BaseRPCResponse(initializer);
		}
		
		override protected function createRequest(id:String, method:String, params:Array = null):IRPCRequest
		{
			return new BaseRPCRequest(id, method, params);
		}
		
		override protected function getRequestContentType():String
		{
			return "application/xml";
		}
		
		override protected function encodeRequests(reqs:Array):String
		{
			//	TODO implement.
			
			for each (var req:IRPCRequest in reqs)
			{
				
			}
			
			return XML(reqs).toXMLString();
		}
		
		override protected function parseResponse(resp:String):void
		{
			//	TODO implement.
			
			var data:XML = new XML(resp);
			/*
			if (rawObject is Array)
			{
				for each (var obj:Object in rawObject)
				{
					_responses.push(createResponse(obj));
				}
			}
			else
			{
				_responses.push(createResponse(rawObject));
			}*/
		}
	}
}
