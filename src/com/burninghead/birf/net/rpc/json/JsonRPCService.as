package com.burninghead.birf.net.rpc.json
{
	import com.burninghead.birf.net.rpc.IRPCRequest;
	import com.burninghead.birf.net.rpc.IRPCResponse;
	import com.burninghead.birf.net.rpc.IRPCService;

	import org.osflash.signals.ISignal;
	import org.osflash.signals.Signal;

	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;


	/*********************************************************
	 * Service that performs the RPC calls. Batch together
	 * any number of requests and send them in one call.
	 * Each request can have it's own callback method.
	 * 
	 * @author tomas.augustinovic
	 * @see com.warden.net.rpc.IRPCService
	 * @see com.warden.net.rpc.json.JsonRPCRequest
	 * @see com.warden.net.rpc.json.JsonRPCResponse
	 *********************************************************/
	public class JsonRPCService implements IRPCService
	{
		private var _url:String;
		private var _requests:Vector.<Object>;
		private var _responses:Vector.<IRPCResponse>;
		private var _currentId:int = 0;
		private var _loader:URLLoader;
		private var _complete:Signal;

		/**
		 * Constructor. Initializes some private members.
		 * 
		 * @param url Where to make calls.
		 */
		public function JsonRPCService(url:String)
		{
			_url = url;
			_complete = new Signal();
			
			cleanUp();
		}

		/**
		 * Add a RPC method call to the pool.
		 * 
		 * @param method The name of the method to call.
		 * @param params Parameters for the method.
		 * @param callback Callback will be invoked when the response arrives.
		 * Once for each message inside the response.
		 */
		public function addMethodCall(method:String, params:Array = null, callback:Function = null):void
		{
			var req:JsonRPCRequest = new JsonRPCRequest(getNextId(), method, params);
			_requests.push({ request: req, callback: callback });
		}
		
		/**
		 * Add a notification call to the pool. Notifications do not expect any
		 * responses, so no callback.
		 * 
		 * @param method The name of the method to call.
		 * @param params Parameters for the method.
		 */
		public function addNotification(method:String, params:Array = null):void
		{
			var req:JsonRPCRequest = new JsonRPCRequest(null, method, params);
			_requests.push({ request: req });
		}
		
		/**
		 * Flushes the pipe of batched calls. Actually makes the request to the
		 * server.
		 */
		public function flush():void
		{
			var req:URLRequest = new URLRequest(_url);
			
			if (_requests.length > 1)
			{
				//	More than one request, so make a bundled request.
				var batch:Array = [];
				
				//	Populate array of RPC requests.
				for each (var reqObj:Object in _requests)
				{
					batch.push(IRPCRequest(reqObj.request).asObject());
				}
			
				req.data = JSON.stringify(batch);
			}
			else if (_requests.length == 1)
			{
				//	Only one request.
				req.data = JSON.stringify(IRPCRequest(_requests[0].request).asObject());
			}
			else
			{
				//	No requests.
				return;
			}
			
			//	Populate URL request.
			req.method = URLRequestMethod.POST;
			req.contentType = "application/json";

			//	Setup URL loader and finally load.
			_loader = new URLLoader();
			_loader.addEventListener(Event.COMPLETE, onMethodCallComplete);
			_loader.addEventListener(IOErrorEvent.IO_ERROR, onMethodCallFailed);
			_loader.load(req);
		}
		
		public function abort():void
		{
			if (_loader != null)
			{
				_loader.close();
			}
		}

		/**
		 * Event handler: If the URLLoader fails for some reason. Simply reports
		 * it in debugger and cleans up.
		 * 
		 * @param event IOErrorEvent
		 */
		private function onMethodCallFailed(event:IOErrorEvent):void
		{
			//MonsterDebugger.trace(this, "onMethodCallFailed: " + event.errorID + ", " + event.text);
			trace("onMethodCallFailed: " + event.errorID + ", " + event.text);

			cleanUp();
			
			_complete.dispatch(false);
		}

		/**
		 * Event handler: When the URLLoader is complete and has data for us.
		 * Parses all the seperate response messages and matches them against
		 * requests (by their ID). Invokes the appropriate callback for each
		 * of the responses. The callback will be invoked once for every response
		 * that carries the given ID (which means it can be invoked multiple times).
		 * 
		 * @param event Event
		 */
		private function onMethodCallComplete(event:Event):void
		{
			var rawObject:Object = JSON.parse(_loader.data as String);
			
			//	Parse responses.
			if (rawObject is Array)
			{
				for each (var obj:Object in rawObject)
				{
					_responses.push(new JsonRPCResponse(obj));
				}
			}
			else
			{
				_responses.push(new JsonRPCResponse(rawObject));
			}
			
			//	Loop through all the responses.
			for each (var resp:JsonRPCResponse in _responses)
			{
				var reqObj:Object = findRequestById(resp.id);
				var retObj:Object;
				
				if (resp.result != null)
				{
					//	We got a proper result.
					retObj = resp.result;
				}
				else
				{
					//	Error occured.
					retObj = resp.error;
				}
				
				if (reqObj)
				{
					reqObj.callback(retObj);
				}
			}
			
			cleanUp();
			
			_complete.dispatch(true);
		}
		
		/**
		 * Get the request object associated with the supplied id.
		 * 
		 * @param id ID of the request to find.
		 * @return Object { request, callback }
		 */
		private function findRequestById(id:int):Object
		{
			for each (var reqObj:Object in _requests)
			{
				if (reqObj.request.id == id)
				{
					return reqObj;
				}
			}
			
			return null;
		}
		
		/**
		 * Clears the request/response arrays and resets the id counter.
		 */
		private function cleanUp():void
		{
			_currentId = 0;
			_responses = new Vector.<IRPCResponse>();
			_requests = new Vector.<Object>();
		}
		
		/**
		 * Generates a new ID (by simple incrementation).
		 * 
		 * @return Generated ID as a string.
		 */
		private function getNextId():String
		{
			return (++_currentId).toString();
		}

		public function get complete():ISignal
		{
			return _complete;
		}
	}
}
