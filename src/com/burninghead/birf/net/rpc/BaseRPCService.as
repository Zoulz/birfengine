package com.burninghead.birf.net.rpc
{
	import com.burninghead.birf.errors.AbstractMethodError;

	import org.osflash.signals.ISignal;
	import org.osflash.signals.Signal;

	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	/**
	 * @author tomas.augustinovic
	 */
	public class BaseRPCService implements IRPCService
	{
		protected var _url:String;
		protected var _requests:Vector.<Object>;
		protected  var _responses:Vector.<IRPCResponse>;
		
		private var _currentId:int = 0;
		private var _loader:URLLoader;
		private var _complete:Signal;
		
		public function BaseRPCService(url:String)
		{
			_url = url;
			_complete = new Signal();
			
			cleanUp();
		}
		
		protected function cleanUp():void
		{
			_currentId = 0;
			_responses = new Vector.<IRPCResponse>();
			_requests = new Vector.<Object>();
		}
		
		protected function getNextId():String
		{
			return (++_currentId).toString();
		}
		
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
		
		public function addMethodCall(method:String, params:Array = null, callback:Function = null):void
		{
			var req:IRPCRequest = createRequest(getNextId(), method, params);
			_requests.push({ request: req, callback: callback });
		}

		public function addNotification(method:String, params:Array = null):void
		{
			var req:IRPCRequest = createRequest(null, method, params);
			_requests.push({ request: req });
		}

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
			
				req.data = encode(batch); //JSON.stringify(batch);
			}
			else if (_requests.length == 1)
			{
				//	Only one request.
				req.data = encode(IRPCRequest(_requests[0].request).asObject()); //JSON.stringify(IRPCRequest(_requests[0].request).asObject());
			}
			else
			{
				//	No requests.
				return;
			}
			
			//	Populate URL request.
			req.method = URLRequestMethod.POST;
			req.contentType = getRequestContentType(); // "application/json";

			//	Setup URL loader and finally load.
			_loader = new URLLoader();
			_loader.addEventListener(Event.COMPLETE, onMethodCallComplete);
			_loader.addEventListener(IOErrorEvent.IO_ERROR, onMethodCallFailed);
			_loader.load(req);
		}
		
		private function onMethodCallFailed(event:IOErrorEvent):void
		{
			trace("onMethodCallFailed: " + event.errorID + ", " + event.text);

			cleanUp();
			
			_complete.dispatch(false);
		}
		
		private function onMethodCallComplete(event:Event):void
		{
			parseResponse(_loader.data as String);
			
			//	Loop through all the responses.
			for each (var resp:IRPCResponse in _responses)
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
		
		protected function createResponse(initializer:Object):IRPCResponse
		{
			throw new AbstractMethodError();
		}
		
		protected function createRequest(id:String, method:String, params:Array = null):IRPCRequest
		{
			throw new AbstractMethodError();
		}
		
		protected function getRequestContentType():String
		{
			throw new AbstractMethodError();
		}
		
		protected function encode(obj:Object):String
		{
			throw new AbstractMethodError();
		}
		
		protected function parseResponse(resp:String):void
		{
			throw new AbstractMethodError();
		}

		public function abort():void
		{
			if (_loader != null)
			{
				_loader.close();
			}
		}

		public function get complete():ISignal
		{
			return _complete;
		}
	}
}
