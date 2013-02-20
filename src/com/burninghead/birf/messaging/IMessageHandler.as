package com.burninghead.birf.messaging
{
	/**
	 * @author tomas.augustinovic
	 */
	public interface IMessageHandler
	{
		/**
		 * Send message to all the listeners.
		 * @param msg Message instance
		 */
		function send(msg:IMessage):void;

		function addListener(listener:*):void;
		function removeListener(listener:*):void;
		function clearListeners():void;
	}
}
