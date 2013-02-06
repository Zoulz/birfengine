package com.burninghead.template.model
{
	import com.burninghead.birf.messaging.IMessage;
	import com.burninghead.birf.model.BaseModelPart;
	import com.burninghead.birf.model.IProxy;
	import com.burninghead.template.MessageType;
	/**
	 * @author tomas.augustinovic
	 */
	public class TemplateModelPart extends BaseModelPart implements IProxy, ITemplateModelPart
	{
		private var _numClicks:uint = 0;
		
		public function TemplateModelPart()
		{
		}
		
		override protected function onMessageReceived(msg:IMessage):void
		{
			switch (msg.type)
			{
				case MessageType.INCREASE_CLICK_COUNT:
				{
					_numClicks++;
					_messenger.sendMessage(ModelMessageType.UPDATE);
					break;
				}
			}
		}

		public function get numClicks():uint
		{
			return _numClicks;
		}
	}
}
