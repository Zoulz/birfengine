package com.burninghead.birf.model.language
{
	import com.burninghead.birf.messaging.IMessage;
	import com.burninghead.birf.model.BaseModelMessageType;
	import com.burninghead.birf.model.BaseModelPart;

	import flash.utils.Dictionary;

	/**
	 * @author BigZoulz
	 */
	public class LanguageModel extends BaseModelPart implements ILanguageModel
	{
		private var _strings:Dictionary;
		private var _currentLanguage:String;
		
		override protected function init():void
		{
			_strings = new Dictionary();
			_currentLanguage = LanguageEnum.EN;
		}
		
		private function addString(id:String, lang:String, translation:String):void
		{
			if (_strings[id] != null)
			{
				var obj:Object = _strings[id];
				obj[lang] = translation;
			}
			else
			{
				var obj:Object = { };
				obj[lang] = translation;
				_strings[id] = obj;
			}
		}
		
		override public function dispose():void
		{
		}
		
		override protected function onMessageReceived(msg:IMessage):void
		{
			if (msg.type == LanguageModelMessageType.SET_STRINGS)
			{
				for each (var stringObj:Object in msg.payload.strings)
				{
					addString(stringObj.id, stringObj.lang, stringObj.translation);
				}
				_messenger.sendMessage(BaseModelMessageType.UPDATE);
			}
			if (msg.type == LanguageModelMessageType.SET_LANGUAGE)
			{
				_currentLanguage = msg.payload.lang;
				_messenger.sendMessage(BaseModelMessageType.UPDATE);
			}
		}

		public function getString(id:String):String
		{
			return _strings[id][_currentLanguage];
		}

		public function get currentLanguage():String
		{
			return _currentLanguage;
		}
	}
}
