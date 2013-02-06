package com.burninghead.birf.messaging
{
	import org.osflash.signals.ISignal;
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
		/**
		 * Return the listener signal object.
		 * @return ISignal
		 */
		function get listener():ISignal;
	}
}
