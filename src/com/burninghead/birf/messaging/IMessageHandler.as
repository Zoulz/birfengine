package com.burninghead.birf.messaging
{
	/**
	 * Describes a message handler. Message handlers utilize the observer pattern to
	 * allow listening objects to receive and process messages.
	 * 
	 * @author tomas.augustinovic
	 */
	public interface IMessageHandler
	{
		/**
		 * Send message to all the listeners.
		 * @param msg Message instance.
		 */
		function send(msg:IMessage):void;
		/**
		 * Register object as a listener which will receive messages
		 * as they are sent.
		 * @param listener Object instance that will listen for messages.
		 */
		function addListener(listener:*):void;
		/**
		 * Remove a listening object.
		 * @param listener Object instance to remove.
		 */
		function removeListener(listener:*):void;
		/**
		 * Clear all listening objects.
		 */
		function clearListeners():void;
	}
}
