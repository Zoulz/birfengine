package com.burninghead.birf.audio {
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	/**
	 * Sound groups are used by the sound manager to bundle sounds together to
	 * make logical distinctions between certain sounds. For instance, a group
	 * dedicated to all UI sound effects, or one for all the music.
	 * 
	 * @see ISoundManager
	 * 
	 * @author tomas.augustinovic
	 */
	public interface ISoundGroup
	{
		/**
		 * Play a specific sound by it's id (probably library linkage id).
		 * @param id string identifier of the sound to play.
		 * @param loops how many times will the sound be repeated.
		 * @param sndTransform Custom transformation.
		 * @param offset offset from start.
		 * @return index of the playing sound.
		 */
		function playSound(id:String, loops:uint = 0, sndTransform:SoundTransform = null, offset:Number = 0):int;
		/**
		 * Get a playing sound by it's index.
		 * @param index index of sound to get.
		 * @return SoundChannel instance of playing sound.
		 */
		function getPlayingSound(index:int):SoundChannel;
		/**
		 * Stop a playing sound by it's index.
		 * @param index index of sound to stop.
		 */
		function stopSound(index:int):void;
		/**
		 * Stop all playing sounds in this group.
		 */
		function stopAllSounds():void;
		/**
		 * Pause all playing sounds (remembering their current play positions).
		 */
		function pauseAllSounds():void;
		/**
		 * Resume paused sounds (at the position they were paused).
		 */
		function resumeAllSounds():void;
		/**
		 * Set mute flag.
		 * @param value if true then the group is muted and won't make any sound.
		 */
		function set isMute(value:Boolean):void;
		/**
		 * Return if the group is currently muted or not.
		 * @return True if sound group is muted.
		 */
		function get isMute():Boolean;
	}
}
