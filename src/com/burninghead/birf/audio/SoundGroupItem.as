package com.burninghead.birf.audio
{
	import com.burninghead.utils.ICloneable;

	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	/**
	 * Holds information about a specific item inside a sound group. Used to remember information about particular sounds when
	 * pausing/resuming.
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
