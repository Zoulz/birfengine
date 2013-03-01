package com.burninghead.extensions.settings
{
	import com.burninghead.birf.messaging.IMessage;
	import com.burninghead.birf.model.BaseModelMsgType;
	import com.burninghead.birf.model.BaseProxyImpl;
	import com.burninghead.extensions.language.LanguageEnum;

	import flash.net.SharedObject;

	/**
	 * @author BigZoulz
	 */
	public class SharedObjectSettings extends BaseProxyImpl implements ISettings
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
			var pl:SharedObjectSettingsPayload = msg.payload as SharedObjectSettingsPayload;
			
			switch (msg.type)
			{
				case SettingsMsgType.SET_PLAYER_SETTING:
				{
					if (pl.soundEffects != null)
					{
						_sharedObject.data.soundEffects = pl.soundEffects;
					}
					else if (pl.music != null)
					{
						_sharedObject.data.soundMusic = pl.music;
					}
					else if (pl.fullscreen != null)
					{
						_sharedObject.data.fullScreen = pl.fullscreen;
					}
					else if (pl.langCode != null)
					{
						_sharedObject.data.lang = pl.langCode;
					}

					update();
					break;
				}
				
				case SettingsMsgType.INIT:
				{
					if (pl.cookieName != null)
					{
						//	Get flash cookie for settings.
						_sharedObject = SharedObject.getLocal(pl.cookieName);
					}
					
					update();
					break;
				}
			}
		}
		
		private function update():void
		{
			_sharedObject.flush();
			
			_messenger.sendMessage(BaseModelMsgType.UPDATE);
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
