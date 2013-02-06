package com.burninghead.birf.audio
{
	/**
	 * Manages sound groups, allowing the user to mute all sounds at once
	 * or get references to individual sound groups.
	 * 
	 * @author tomas.augustinovic
	 */
	public interface ISoundManager
	{
		/**
		 * Register a sound group with the manager.
		 * @param soundGroup group to register
		 */
		function registerSoundGroup(soundGroup:ISoundGroup):void;
		/**
		 * Removes a sound group from the manager.
		 * @param soundGroup group to remove
		 */
		function unregisterSoundGroup(soundGroup:ISoundGroup):void;
		/**
		 * Return a sound group by it's registered index.
		 * @param index index of sound group to get
		 * @return ISoundGroup
		 */
		function getSoundGroupByIndex(index:uint):ISoundGroup;
		/**
		 * Return a sound group that matches the supplied interface.
		 * @param interFace interface definition to match
		 */
		function getSoundGroupByInterface(interFace:Class):ISoundGroup;
		/**
		 * Stops all sound groups from playing.
		 */
		function stopAllSounds():void;
		/**
		 * Sets the mute status of all managed sound groups.
		 * @param value true if mute
		 */
		function set isMute(value:Boolean):void;
		/**
		 * Return the mute status of the manager, and subsequently all the managed sound groups.
		 * @return Boolean
		 */
		function get isMute():Boolean;
	}
}
