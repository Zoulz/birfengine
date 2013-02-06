package com.burninghead.birf.audio {
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	/**
	 * Sound groups allows for a specific set of sounds to be played.
	 * 
	 * @author tomas.augustinovic
	 */
	public interface ISoundGroup
	{
		/**
		 * Play a specific sound by it's id.
		 * @param id string identifier of the sound to play
		 * @param loops how many times will the sound be repeated
		 * @param sndTransform Custom transformation
		 * @param offset offset from start
		 */
		function playSound(id:String, loops:uint = 0, sndTransform:SoundTransform = null, offset:Number = 0):int;
		function getPlayingSound(index:int):SoundChannel;
		function stopSound(index:int):void;
		function stopAllSounds():void;
		function pauseAllSounds():void;
		function resumeAllSounds():void;
		function set isMute(value:Boolean):void;
		function get isMute():Boolean;
	}
}
