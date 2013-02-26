package com.burninghead.birf.audio
{
	/**
	 * Base class implementation of sound manager. Contains a list of
	 * all the registered sound groups.
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
