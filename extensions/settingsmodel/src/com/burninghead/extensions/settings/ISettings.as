package com.burninghead.extensions.settings
{
	/**
	 * Implements a settings model part with common game settings.
	 * 
	 * @author BigZoulz
	 */
	public interface ISettings
	{
		function get soundEffects():Boolean;
		function get soundMusic():Boolean;
		function get fullScreen():Boolean;
		function get language():String;
		function get playerName():String;
	}
}
