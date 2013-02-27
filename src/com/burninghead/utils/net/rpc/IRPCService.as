package com.burninghead.utils.net.rpc
{
	import org.osflash.signals.ISignal;
	/**
	 * Describes a RFC service. Supports the basics of caching method/notification calls
	 * and then flushing it to the desired RPC web service that hopefully will reply
	 * with the result.
	 * 
	 * @author tomas.augustinovic
	 */
	public interface IRPCService
	{
		/**
		 * Cache a RPC method call.
		 * @param method Name of the method.
		 * @param params Parameters to the method call.
		 * @param callback A function that will be called when the result of the method has come back.
		 */
		function addMethodCall(method:String, params:Array = null, callback:Function = null):void;
		/**
		 * Cache a RPC notification method call. Notifications do not get any reply back. They simply
		 * serve to notify the web service of something.
		 * @param method Notification method name.
		 * @param params Parameters for the method call.
		 */
		function addNotification(method:String, params:Array = null):void;
		/**
		 * Flushes the cache of method calls which means a remote call to the web service will be
		 * made at this point. When the web service responds the callback function will be invoked
		 * for each method call.
		 */
		function flush():void;
		/**
		 * Aborts the flush operation.
		 */
		function abort():void;
		/**
		 * Signal that dispatches when the flush is complete.
		 */
		function get complete():ISignal;
	}
}
