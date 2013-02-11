package com.burninghead.birf.audio
{
	import com.burninghead.birf.utils.ICloneable;
	import flash.media.SoundTransform;
	import flash.media.SoundChannel;
	/**
	 * @author tomas.augustinovic
	 */
	public class SoundGroupItem implements ICloneable
	{
		public var channel:SoundChannel = null;
		public var name:String = "";
		public var loops:uint = 0;
		public var sndTransform:SoundTransform = null;
		public var offset:Number = 0;
		
		public function SoundGroupItem(id:String, channel:SoundChannel, loops:uint = 0, sndTransform:SoundTransform = null, offset:Number = 0)
		{
			this.name = id;
			this.channel = channel;
			this.loops = loops;
			this.sndTransform = sndTransform;
			this.offset = offset;
		}

		public function clone():*
		{
			return new SoundGroupItem(name, channel, loops, sndTransform, offset);
		}
	}
}
