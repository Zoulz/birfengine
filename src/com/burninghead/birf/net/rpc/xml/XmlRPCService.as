package com.burninghead.birf.net.rpc.xml
{
	import com.burninghead.birf.errors.AbstractMethodError;
	import com.burninghead.birf.net.rpc.BaseRPCService;
	import com.burninghead.birf.net.rpc.IRPCRequest;
	import com.burninghead.birf.net.rpc.IRPCResponse;
	import com.burninghead.birf.net.rpc.IRPCService;
	/**
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
			throw new AbstractMethodError();
		}
		
		override protected function createRequest(id:String, method:String, params:Array = null):IRPCRequest
		{
			throw new AbstractMethodError();
		}
		
		override protected function getRequestContentType():String
		{
			return "application/xml";
		}
		
		override protected function encode(obj:Object):String
		{
			return XML(obj).toXMLString();
		}
		
		override protected function parseResponse(resp:String):void
		{
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
