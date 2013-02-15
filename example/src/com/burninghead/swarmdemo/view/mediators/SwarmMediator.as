package com.burninghead.swarmdemo.view.mediators
{
	import com.burninghead.birf.messaging.IMessage;
	import com.burninghead.birf.view.BaseMediator;
	import com.burninghead.birf.view.IMediator;
	import com.burninghead.swarmdemo.view.comps.SwarmView;
	/**
	 * @author tomas.augustinovic
	 */
	public class SwarmMediator extends BaseMediator implements IMediator
	{
		private var _swarm:SwarmView;
		
		override protected function init():void
		{
		}
		
		override protected function onMessageReceived(msg:IMessage):void
		{
			switch (msg.type)
			{
				
			}
		}
		
		override public function registerView(value:*):void
		{
			_swarm = value;
		}

		override public function dispose():void
		{
		}
	}
}
