package com.burninghead.utils.random
{
	/**
	 * @author tomas.augustinovic
	 */
	public class WellRandom
	{
		private var _state:Array;
		private var _index:uint = 0;
		
		public function WellRandom()
		{
			_state = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
		}
		
		public function getRandomNumber():Number
		{
			var a:Number;
			var b:Number;
			var c:Number;
			var d:Number;
			
			a = _state[_index];
			c = _state[(_index + 13) & 15];
			b = a ^ c ^ (a << 16) ^ (c << 15);
			c = _state[(_index + 9) & 15];
			c ^= (c >> 11);
			a = _state[_index] = b ^ c;
			d = a ^ ((a << 5) & 0xDA442D24UL);
			index = (index + 15)&15;
			a = state[index];
			state[index] = a ^ b ^ d ^ (a << 2) ^ (b << 18) ^ (c << 28);
			
			return _state[index];
		}
	}
}
