package com.burninghead.birf.audio
{
	/**
	 * Manages sound groups, allowing the user to mute all sounds at once or get references to individual sound groups.
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
	 * @see ISoundGroup
	 * 
	 * @author tomas.augustinovic
	 */
	public interface ISoundManager
	{
		/**
		 * Register a sound group with the manager.
		 * @param soundGroup group to register.
		 */
		function registerSoundGroup(soundGroup:ISoundGroup):void;
		/**
		 * Removes a sound group from the manager.
		 * @param soundGroup group to remove.
		 */
		function unregisterSoundGroup(soundGroup:ISoundGroup):void;
		/**
		 * Return a sound group by it's registered index.
		 * @param index index of sound group to get.
		 * @return Sound group of the specified index.
		 */
		function getSoundGroupByIndex(index:uint):ISoundGroup;
		/**
		 * Return a sound group that matches the supplied interface.
		 * @param interFace interface definition to match.
		 * @return First sound group implementing the specified interface.
		 */
		function getSoundGroupByInterface(interFace:Class):ISoundGroup;
		/**
		 * Stops all sound groups from playing.
		 */
		function stopAllSounds():void;
		/**
		 * Sets the mute status of all managed sound groups.
		 * @param value true if mute.
		 */
		function set isMute(value:Boolean):void;
		/**
		 * Return the mute status of the manager, and subsequently all the managed sound groups.
		 * @return True if all managed sound groups are muted.
		 */
		function get isMute():Boolean;
	}
}
