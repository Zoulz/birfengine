package com.burninghead.birf.model.statcollector {
	import com.burninghead.birf.messaging.IMessage;
	import com.burninghead.birf.model.BaseModelMessageType;
	import com.burninghead.birf.model.BaseModelPart;
	import com.burninghead.birf.utils.misc.KeyValuePair;
	import com.burninghead.birf.utils.security.AntiCheatNumber;

	import flash.utils.Dictionary;
	/**
	 * @author BigZoulz
	 */
	public class BaseStatCollector extends BaseModelPart implements IStatCollector
	{
		protected var _stats:Dictionary;
		
		override protected function init():void
		{
			_stats = new Dictionary();
		}
		
		public function getStat(key:String):Number
		{
			if (_stats[key] != null)
			{
				return _stats[key].value;
			}
			
			return 0;
		}
		
		override public function dispose():void
		{
			super.dispose();
		}
		
		override protected function onMessageReceived(msg:IMessage):void
		{
			if (msg.type == StatCollectorMessageType.SUBMIT)
			{
				var submitted:KeyValuePair = msg.payload.value;
				
				setStat(submitted.key, submitted.value, msg.payload.multiInstance == null ? true : msg.payload.multiInstance);
				
				_messenger.sendMessage(BaseModelMessageType.UPDATE);
			}
		}
		
		protected function setStat(key:String, value:Number, multiInstance:Boolean = true):void
		{
			if (_stats[key] == null)
			{
				_stats[key] = new AntiCheatNumber(value, multiInstance);
			}
			else
			{
				_stats[key].value = value;
			}
		}
	}
}
