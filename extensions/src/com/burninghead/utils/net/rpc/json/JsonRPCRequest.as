package com.burninghead.utils.net.rpc.json
{
	import com.burninghead.utils.net.rpc.BaseRPCRequest;
	import com.burninghead.utils.net.rpc.IRPCRequest;

	/*********************************************************
	 * Simple value object that holds infromation about
	 * a standard RPC request. Also holds reference to a
	 * callback method.
	 * 
	 * @author tomas.augustinovic
	 *********************************************************/
	public class JsonRPCRequest extends BaseRPCRequest implements IRPCRequest
	{
		public function JsonRPCRequest(id:String, method:String, params:Array)
		{
			super(id, method, params);
		}
		
		override public function asObject():Object
		{
			var obj:Object = super.asObject();
			obj.jsonrpc = "2.0";

			return obj;
		}
	}
}
