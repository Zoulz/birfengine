package com.burninghead.birf.model.settings
{
	import com.burninghead.birf.messaging.IMessage;
	import com.burninghead.birf.model.BaseModelMsgType;
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
			var pl:Object = msg.payload;
			
			switch (msg.type)
			{
				case SettingsMsgType.SET_PLAYER_SETTING:
				{
					if (pl.effects != null)
					{
						_sharedObject.data.soundEffects = pl.effects;
					}
					else if (pl.music != null)
					{
						_sharedObject.data.soundMusic = pl.music;
					}
					else if (pl.fullscreen != null)
					{
						_sharedObject.data.fullScreen = pl.fullscreen;
					}
					else if (pl.lang != null)
					{
						_sharedObject.data.lang = pl.lang;
					}

					update();
					break;
				}
				case SettingsMsgType.INIT:
				{
					if (pl.cookiename != null)
					{
						//	Get flash cookie for settings.
						_sharedObject = SharedObject.getLocal("BurningHeadGames_" + pl.cookiename + "_Settings");
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
