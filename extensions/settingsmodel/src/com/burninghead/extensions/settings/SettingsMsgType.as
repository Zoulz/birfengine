package com.burninghead.extensions.settings
{
	/**
	 * Message types for communicating with a settings model.
	 * 
	 * @author BigZoulz
	 */
	public class SettingsMsgType
	{
		/**
		 * Initialize the settings model.
		 * 
		 * cookiename:String
		 */
		public static const INIT:String = "__SettingsMsgType_INIT";
		/**
		 * Change a setting.
		 * 
		 * effects:Boolean
		 * music:Boolean
		 * fullscreen:Boolean
		 */
		public static const SET_PLAYER_SETTING:String = "__SettingsMsgType_SET_PLAYER_SETTING";
	}
}
