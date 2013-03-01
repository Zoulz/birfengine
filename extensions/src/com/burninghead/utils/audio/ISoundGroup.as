package com.burninghead.utils.audio {
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	/**
	 * Sound groups are used by the sound manager to bundle sounds together to make logical distinctions between certain sounds. For instance,
	 * a group dedicated to all UI sound effects, or one for all the music.
	 * 
	 * <pre>
	 * -----------------------------------------------------------------------------------------------------------------------------------------
	 * 
	 * Copyright (c) Tomas Augustinovic 2012-2013
	 *
	 * Licence Agreement (The MIT License)
	 *
	 * Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files
	 * (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge,
	 * publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do
	 * so, subject to the following conditions:
	 *
	 * The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
	 *
	 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
	 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE
	 * FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
	 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
	 * 
	 * -----------------------------------------------------------------------------------------------------------------------------------------
	 * </pre>
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
