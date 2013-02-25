package com.burninghead.simplesphere.model
{
	import com.burninghead.birf.model.BaseModelMsgType;
	import com.burninghead.birf.messaging.IMessage;
	import com.burninghead.birf.model.BaseProxyImpl;
	import com.burninghead.birf.model.IProxy;
	/**
	 * @author Zoulz
	 */
	public class SphereModel extends BaseProxyImpl implements IProxy, ISphereModel
	{
		private var _color:uint = 0xff0000;
		private var _numClicks:uint = 0;
		
		/**
		 * Handle received messages.
		 */
		override protected function onMessageReceived(msg:IMessage):void
		{
			var pl:Object = msg.payload;
			
			switch (msg.type)
			{
				case SimpleSphereModelMsgType.SET_SPHERE_COLOR:
				{
					//	Change color and increment click count.
					_color = pl.color;
					_numClicks++;
					
					//	Dispatch message indicating that model has been updated.
					_messenger.sendMessage(BaseModelMsgType.UPDATE);
					break;
				}
			}
		}

		/**
		 * @inheritDoc
		 */
		public function get color():uint
		{
			return _color;
		}

		/**
		 * @inheritDoc
		 */
		public function get numClicks():uint
		{
			return _numClicks;
		}
	}
}
