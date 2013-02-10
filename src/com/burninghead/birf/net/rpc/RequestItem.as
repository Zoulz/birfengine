package com.burninghead.birf.net.rpc
{
	/**
	 * @author Zoulz
	 */
	public class RequestItem
	{
		public var request:IRPCRequest;
		public var callback:Function;
		
		public function RequestItem(req:IRPCRequest, callback:Function = null)
		{
			this.request = req;
			this.callback = callback;
		}
	}
}
