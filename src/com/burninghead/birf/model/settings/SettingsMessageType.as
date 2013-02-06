package com.burninghead.birf.model.settings
{
	/**
	 * Message types for communicating with a settings model.
	 * 
	 * @author BigZoulz
	 */
	public class SettingsMessageType
	{
		/**
		 * Initialize the settings model.
		 * 
		 * cookiename:String
		 */
		public static const INIT:String = "settings_init";
		/**
		 * Change a setting.
		 * 
		 * effects:Boolean
		 * music:Boolean
		 * fullscreen:Boolean
		 */
		public static const SET_PLAYER_SETTING:String = "settings_set_player_setting";
	}
}
