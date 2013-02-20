package com.burninghead.birf.messaging
{
	import flash.events.Event;
	/**
	 * @author tomas.augustinovic
	 */
	public class BirfMessageEvent extends Event
	{
		public static const BIRF_MESSAGE:String = "birfMessage";
		
		public var msg:IMessage;
		
		public function BirfMessageEvent(msg:IMessage)
		{
			super("birfMessage");
			
			this.msg = msg;
		}
	}
}
