package com.burninghead.birf.audio
{
	/**
	 * @author tomas.augustinovic
	 */
	public class BaseSoundManager implements ISoundManager
	{
		private var _soundGroups:Vector.<ISoundGroup>;

		public function BaseSoundManager()
		{
			_soundGroups = new Vector.<ISoundGroup>();
		}
		
		/**
		 * Register a new sound group with the manager.
		 * @param soundGroup Sound group to register.
		 */
		public function registerSoundGroup(soundGroup:ISoundGroup):void
		{
			_soundGroups.push(soundGroup);
		}
		
		/**
		 * Remove a sound group from the manager.
		 * @param soundGroup Sound group to remove.
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
		 * Return sound group by it's index.
		 * @param index
		 * @return ISoundGroup
		 */
		public function getSoundGroupByIndex(index:uint):ISoundGroup
		{
			return _soundGroups[index];
		}
		
		/**
		 * Stop all the playing sounds in all the groups.
		 */
		public function stopAllSounds():void
		{
			for each (var grp:ISoundGroup in _soundGroups)
			{
				grp.stopAllSounds();
			}
		}

		/**
		 * Set mute flag on all the groups.
		 * @param value If manager is muted or not.
		 */
		public function set isMute(value:Boolean):void
		{
			for each (var grp:ISoundGroup in _soundGroups)
			{
				grp.isMute = value;
			}
		}
		
		/**
		 * Return the mute status of the manager. If any group is unmuted this
		 * will return false, otherwise it will return true.
		 * @return Boolean
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
	}
}
