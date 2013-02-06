package com.burninghead.birf.audio
{
	import com.burninghead.birf.net.assets.types.SwfAsset;
	import com.burninghead.birf.utils.ReflectionUtil;

	import flash.events.Event;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import flash.utils.Dictionary;

	/**
	 * @author tomas.augustinovic
	 */
	public class BaseSoundGroup implements ISoundGroup
	{
		private var _asset:SwfAsset;
		private var _soundInstances:Dictionary;
		private var _mute:Boolean = false;
		private var _curIndex:uint = 0;
		private var _pausedSounds:Vector.<Object>;
		
		/**
		 * Constructor.
		 * @param asset Swf asset to use when creating the sounds.
		 */
		public function BaseSoundGroup(asset:SwfAsset = null)
		{
			_asset = asset;
			_soundInstances = new Dictionary(true);
		}
		
		/**
		 * Play sound by it's linkage id. Returns the index of the playing instance.
		 * @param id Linkage id of the sound to play.
		 */
		public function playSound(id:String, loops:uint = 0, sndTransform:SoundTransform = null, offset:Number = 0):int
		{
			if (_mute)
			{
				return -1;
			}
			
			var snd:Sound = null;
			
			if (_asset != null)
			{
				var clazz:Class = _asset.getClass(id);
				snd = new clazz() as Sound;
			}
			else
			{
				snd = ReflectionUtil.getInstanceByName(id) as Sound;
			}
			
			if (snd != null)
			{
				var index:uint = getNewIndex();
				var channel:SoundChannel = snd.play(offset, loops, sndTransform);
				channel.addEventListener(Event.SOUND_COMPLETE, onSoundPlayComplete);
				_soundInstances[index] = { channel: channel, name: id, loops: loops, sndTransform: sndTransform };
				return index;
			}
			
			return -1;
		}
		
		/**
		 * Return the playing sound instance with the specified index.
		 * @param index
		 * @return SoundChannel
		 */
		public function getPlayingSound(index:int):SoundChannel
		{
			var value:Object = _soundInstances[index];
			
			if (value != null)
			{
				return value.channel;
			}
			
			return null;
		}
		
		/**
		 * Stop a playing sound by it's index.
		 * @param index Index to stop.
		 */
		public function stopSound(index:int):void
		{
			var snd:SoundChannel = _soundInstances[index].channel;
			
			if (snd != null)
			{
				snd.removeEventListener(Event.SOUND_COMPLETE, onSoundPlayComplete);
				snd.stop();
			}
		}

		/**
		 * Event handler for when a sound has completed playing. Removes the instance
		 * from the list.
		 * @param event Event
		 */
		private function onSoundPlayComplete(event:Event):void
		{
			for each (var value:Object in _soundInstances)
			{
				if (value.channel == event.target)
				{
					value.channel.removeEventListener(Event.SOUND_COMPLETE, onSoundPlayComplete);
					value = null;
					break;
				}
			}
		}
		
		/**
		 * Stop all the playing sounds and flushes the list.
		 */
		public function stopAllSounds():void
		{
			for each (var value:Object in _soundInstances)
			{
				value.channel.removeEventListener(Event.SOUND_COMPLETE, onSoundPlayComplete);
				value.channel.stop();
			}
			
			_soundInstances = new Dictionary(true);
			_curIndex = 0;
		}

		/**
		 * Set mute flag on and off. If muted all the sounds will be
		 * stopped.
		 * @param value Flag.
		 */
		public function set isMute(value:Boolean):void
		{
			if (value == _mute)
			{
				return;
			}
			
			_mute = value;
			
			afterMuteAction();
		}
		
		protected function afterMuteAction():void
		{
			stopAllSounds();
		}

		/**
		 * Return the mute flag.
		 * @return Boolean
		 */
		public function get isMute():Boolean
		{
			return _mute;
		}
		
		/**
		 * Get a new sound index.
		 */
		private function getNewIndex():uint
		{
			return ++_curIndex;
		}

		public function pauseAllSounds():void
		{
			_pausedSounds = new Vector.<Object>();
			
			for each (var value:Object in _soundInstances)
			{
				_pausedSounds.push({ name: value.name, pos: value.channel.position, loops: value.loops, sndTransform: value.sndTransform });
			}
			
			stopAllSounds();
		}

		public function resumeAllSounds():void
		{
			for each (var value:Object in _pausedSounds)
			{
				playSound(value.name, value.loops, value.sndTransform, value.pos);
			}
			
			_pausedSounds = new Vector.<Object>();
		}
	}
}
