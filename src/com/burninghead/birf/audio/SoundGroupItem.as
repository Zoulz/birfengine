package com.burninghead.birf.audio
{
	import com.burninghead.birf.utils.ICloneable;
	import flash.media.SoundTransform;
	import flash.media.SoundChannel;
	/**
	 * Holds information about a specific item inside a sound group. Used to
	 * remember information about particular sounds when pausing/resuming.
	 * 
	 * @author tomas.augustinovic
	 */
	public class SoundGroupItem implements ICloneable
	{
		public var channel:SoundChannel = null;
		public var name:String = "";
		public var loops:uint = 0;
		public var sndTransform:SoundTransform = null;
		public var offset:Number = 0;
		
		/**
		 * Sets member values.
		 * @param id Identifier of this item.
		 * @param channel The actual sound channel instance of the sound.
		 * @param loops How many times the sound will loop.
		 * @param sndTransform Transformation used by the sound.
		 * @param offset Offset into sound.
		 */
		public function SoundGroupItem(id:String, channel:SoundChannel, loops:uint = 0, sndTransform:SoundTransform = null, offset:Number = 0)
		{
			this.name = id;
			this.channel = channel;
			this.loops = loops;
			this.sndTransform = sndTransform;
			this.offset = offset;
		}

		/**
		 * Creates an identical clone of this item.
		 * @return Clone of item.
		 */
		public function clone():*
		{
			return new SoundGroupItem(name, channel, loops, sndTransform, offset);
		}
	}
}
