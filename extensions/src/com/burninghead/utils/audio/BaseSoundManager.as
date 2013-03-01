package com.burninghead.utils.audio
{
	/**
	 * Base class implementation of sound manager. Contains a list of all the registered sound groups.
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
	 * @author tomas.augustinovic
	 */
	public class BaseSoundManager implements ISoundManager
	{
		private var _soundGroups:Vector.<ISoundGroup>;

		/**
		 * Set default member values.
		 */
		public function BaseSoundManager()
		{
			_soundGroups = new Vector.<ISoundGroup>();
		}
		
		/**
		 * @inheritDoc
		 */
		public function registerSoundGroup(soundGroup:ISoundGroup):void
		{
			_soundGroups.push(soundGroup);
		}
		
		/**
		 * @inheritDoc
		 */
		public function unregisterSoundGroup(soundGroup:ISoundGroup):void
		{
			for (var i:int = 0; i < _soundGroups.length; i++)
			{
				if (_soundGroups[i] == soundGroup)
				{
					_soundGroups.splice(i, 1);
					break;
				}
			}
		}
		
		/**
		 * @inheritDoc
		 */
		public function getSoundGroupByIndex(index:uint):ISoundGroup
		{
			return _soundGroups[index];
		}
		
		/**
		 * @inheritDoc
		 */
		public function getSoundGroupByInterface(interFace:Class):ISoundGroup
		{
			for each (var grp:ISoundGroup in _soundGroups)
			{
				if (grp is interFace)
				{
					return grp;
				}
			}
			
			return null;
		}
		
		/**
		 * @inheritDoc
		 */
		public function stopAllSounds():void
		{
			for each (var grp:ISoundGroup in _soundGroups)
			{
				grp.stopAllSounds();
			}
		}

		/**
		 * @inheritDoc
		 */
		public function set isMute(value:Boolean):void
		{
			for each (var grp:ISoundGroup in _soundGroups)
			{
				grp.isMute = value;
			}
		}

		/**
		 * @inheritDoc
		 */		
		public function get isMute():Boolean
		{
			for each (var grp:ISoundGroup in _soundGroups)
			{
				if (grp.isMute == false)
				{
					return false;
				}
			}
			
			return true;
		}
	}
}
