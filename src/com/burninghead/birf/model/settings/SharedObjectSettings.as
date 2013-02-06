package com.burninghead.birf.model.settings
{
	import com.burninghead.birf.messaging.IMessage;
	import com.burninghead.birf.model.BaseModelMessageType;
	import com.burninghead.birf.model.BaseModelPart;
	import com.burninghead.birf.model.language.LanguageEnum;

	import flash.net.SharedObject;

	/**
	 * @author BigZoulz
	 */
	public class SharedObjectSettings extends BaseModelPart implements ISettings
	{
		private var _sharedObject:SharedObject;
		
		override protected function init():void
		{
		}
		
		override public function dispose():void
		{
			_sharedObject.flush();
		}
		
		override protected function onMessageReceived(msg:IMessage):void
		{
			switch (msg.type)
			{
				case SettingsMessageType.SET_PLAYER_SETTING:
				{
					if (msg.payload.effects != null)
					{
						_sharedObject.data.soundEffects = msg.payload.effects;
					}
					else if (msg.payload.music != null)
					{
						_sharedObject.data.soundMusic = msg.payload.music;
					}
					else if (msg.payload.fullscreen != null)
					{
						_sharedObject.data.fullScreen = msg.payload.fullscreen;
					}
					else if (msg.payload.lang != null)
					{
						_sharedObject.data.lang = msg.payload.lang;
					}

					update();
					break;
				}
				case SettingsMessageType.INIT:
				{
					if (msg.payload.cookiename != null)
					{
						//	Get flash cookie for settings.
						_sharedObject = SharedObject.getLocal("BurningHeadGames_" + msg.payload.cookiename + "_Settings");
					}
					
					update();
					break;
				}
			}
		}
		
		private function update():void
		{
			_sharedObject.flush();
			
			_messenger.sendMessage(BaseModelMessageType.UPDATE);
		}
		
		public function get soundEffects():Boolean
		{
			return _sharedObject.data.soundEffects == null ? false : _sharedObject.data.soundEffects;
		}

		public function get soundMusic():Boolean
		{
			return _sharedObject.data.soundMusic == null ? false : _sharedObject.data.soundMusic;
		}

		public function get fullScreen():Boolean
		{
			return _sharedObject.data.fullScreen == null ? false : _sharedObject.data.fullScreen;
		}

		public function get playerName():String
		{
			return _sharedObject.data.playerName == null ? "" : _sharedObject.data.playerName;
		}

		public function get language():String
		{
			return _sharedObject.data.lang == null ? LanguageEnum.EN : _sharedObject.data.lang;
		}
	}
}
