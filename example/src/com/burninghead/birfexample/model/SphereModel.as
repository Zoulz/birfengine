package com.burninghead.birfexample.model
{
	import com.burninghead.birf.model.BaseModelMessageType;
	import com.burninghead.birf.messaging.IMessage;
	import com.burninghead.birf.model.BaseModelPart;
	import com.burninghead.birf.model.IProxy;
	/**
	 * @author Zoulz
	 */
	public class SphereModel extends BaseModelPart implements IProxy, ISphereModel
	{
		private var _color:uint = 0xff0000;
		
		public function SphereModel()
		{
		}
		
		override protected function init():void
		{
		}
		
		override protected function onMessageReceived(msg:IMessage):void
		{
			switch (msg.type)
			{
				case BirfExampleModelMessageType.SET_SPHERE_COLOR:
				{
					_color = msg.payload.color;
					_messenger.sendMessage(BaseModelMessageType.UPDATE);
					break;
				}
			}
		}

		public function get color():uint
		{
			return _color;
		}
	}
}
