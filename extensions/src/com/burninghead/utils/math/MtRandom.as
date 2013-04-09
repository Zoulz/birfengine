package com.burninghead.utils.crypto
{
	import flash.utils.getTimer;
	/**
	 * Mersenne Twister implementation. Seeded pseudo random number sequence.
	 * 
	 * @author tomas.augustinovic
	 */
	public class MtRandom
	{
		private const MT:Vector.<uint> = new Vector.<uint>(624, true);
		private var index:int, _seed:int;
		private const yA1:uint = 2636928640, yA2:uint = 4022730752;
		private const a:uint = 2147483648, b:uint = 2147483647, c:uint = 2567483615, d:uint = 624, e:uint = 397;
		private static const I_MAX:uint = int.MAX_VALUE;
		private static const U_MAX:uint = uint.MAX_VALUE;
		private static const iDIV:Number = I_MAX + Number.MIN_VALUE + 1;
		private static const uDIV:Number = U_MAX + Number.MIN_VALUE;
		
		public function MtRandom(seed:int = undefined):void
		{
			if (seed == undefined)
			{
				this.seed = (new Date().getTime() & 0xFFFFFFFF) ^ getTimer();
			}
			else
			{
				this.seed = seed - 1;
			}
		}
		
		public function get seed():int
		{
			return _seed;
		}
		
		public function set seed(a:int):void
		{
			if (a != _seed)
			{
				_seed = a;
				var i:int, b:int = a;
				index = i;
				MT[i] = a;
				while (++i < 624)
				{
					b = (MT[i] = (1812433253 * Number(b ^ (b >>> 30)) + i) & 0xFFFFFFFF);
				}
			}
		}
		
		public function extractNumber():Number
		{
			var i:int = index, MT:Vector.<uint> = this.MT, y:uint = MT[i];
			index = (i + 1) % 624;
			var u:uint = (y & a) | (MT[index] & b);
			MT[i] = (MT[(i + e) % d] ^ (u >>> 1)) ^ (c & (-(u & 1)));
			y ^= y >>> 11;
			y ^= (y << 7) & yA1;
			y ^= (y << 15) & yA2;
			y ^= y >>> 18;
			return y / uDIV;
		}
		
		public function extractNumber2():Number
		{
			var i:int = index, MT:Vector.<uint> = this.MT, y:uint = MT[i];
			index = (i + 1) % 624;
			var u:uint = (y & a) | (MT[index] & b);
			MT[i] = (MT[(i + e) % d] ^ (u >>> 1)) ^ (c & (-(u & 1)));
			y ^= y >>> 11;
			y ^= (y << 7) & yA1;
			y ^= (y << 15) & yA2;
			return (y ^ (y >>> 18)) / iDIV;
		}
		
		public function extractNumber3():Number
		{
			var i:int = index, MT:Vector.<uint> = this.MT, y:uint = MT[i];
			index = (i + 1) % 624;
			var u:uint = (y & a) | (MT[index] & b);
			MT[i] = (MT[(i + e) % d] ^ (u >>> 1)) ^ (c & (-(u & 1)));
			y ^= y >>> 11;
			y ^= (y << 7) & yA1;
			y ^= (y << 15) & yA2;
			return int(y ^ (y >>> 18)) / uDIV;
		}
		
		public function extractUint():uint
		{
			var i:int = index, MT:Vector.<uint> = this.MT, y:uint = MT[i];
			index = (i + 1) % 624;
			var u:uint = (y & a) | (MT[index] & b);
			MT[i] = (MT[(i + e) % d] ^ (u >>> 1)) ^ (c & (-(u & 1)));
			y ^= y >>> 11;
			y ^= (y << 7) & yA1;
			y ^= (y << 15) & yA2;
			return (y ^ (y >>> 18));
		}
		
		public function extractBoundedUint(min:uint, max:uint):uint
		{
			var i:int = index, MT:Vector.<uint> = this.MT, y:uint = MT[i];
			index = (i + 1) % 624;
			var u:uint = (y & a) | (MT[index] & b);
			MT[i] = (MT[(i + e) % d] ^ (u >>> 1)) ^ (c & (-(u & 1)));
			y ^= y >>> 11;
			y ^= (y << 7) & yA1;
			y ^= (y << 15) & yA2;
			y ^= y >>> 18;
			
			if (max < min)
			{
				return (y % (min + 1 - max)) + max;
			}
			
			return (y % (max + 1 - min)) + min;
		}
	}
}
