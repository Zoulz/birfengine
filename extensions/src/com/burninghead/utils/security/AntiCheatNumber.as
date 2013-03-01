package com.burninghead.utils.security
{
	import com.burninghead.utils.MathUtils;

	import org.osflash.signals.ISignal;
	import org.osflash.signals.Signal;

	/**
	 * This class is used to counter memory sniff cheating. It's not perfect, but it makes it a bit harder. Should only be used for
	 * critical numbers since it adds a bit of memory and processing overhead.
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
	public class AntiCheatNumber
	{
		/**
		 * A salt constant used to spice up the obfuscation.
		 */
		private static const SALT:uint = 526;
		
		private var _offset:Number;
		private var _num:Vector.<Number>;
		private var _cheatSignal:Signal;
		
		/**
		 * Randomizes a offset value used to alter the stored value.
		 * @param num The real number to be stored.
		 * @param multiInstance Indicates if we should hold multiple instances. Takes more memory and adds a bit of overhead, but is a bit harder to crack.
		 */
		public function AntiCheatNumber(num:Number, multiInstance:Boolean = true)
		{
			_cheatSignal = new Signal();
			
			_offset = MathUtils.randomNumber(-1000, 1000, true);
			
			_num = new Vector.<Number>();
			var instances:uint = multiInstance ? 1 : MathUtils.randomNumber(2, 6);
			for (var i:int = 0; i < instances; i++)
			{
				_num.push(num + _offset + SALT);
			}
		}
		
		/**
		 * Assign a new value.
		 * @param value The new value to set.
		 */
		public function set value(value:Number):void
		{
			var ref:Number = _num[Math.floor(_num.length / 2)];
			
			for (var i:int = 0; i < _num.length; i++)
			{
				if (_num[i] != ref)
				{
					_cheatSignal.dispatch();
				}
				
				_num[i] = value + _offset + SALT;
			}
		}
		
		/**
		 * Return the actual value.
		 * @return The stored number.
		 */
		public function get value():Number
		{
			return _num[Math.floor(_num.length / 2)] - _offset - SALT;
		}

		/**
		 * Signal is dispatched if a cheater is detected.
		 * @return Signal for cheaters.
		 */
		public function get cheater():ISignal
		{
			return _cheatSignal;
		}
	}
}
