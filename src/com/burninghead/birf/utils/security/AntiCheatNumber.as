package com.burninghead.birf.utils.security
{
	import com.burninghead.birf.utils.MathUtil;
	/**
	 * This class is used to counter memory sniff cheating. It's not perfect, but it makes it
	 * a bit harder. Should only be used for critical numbers since it added a bit of memory and
	 * processing overhead.
	 * 
	 * @author BigZoulz
	 */
	public class AntiCheatNumber
	{
		private var _offset:Number;
		private var _num:Vector.<Number>;
		
		/**
		 * Constructor. Randomizes a offset value used to alter the stored value.
		 * @param num The real number to be stored.
		 * @param multiInstance Indicates if we should hold multiple instances. Takes more memory and adds a bit of overhead, but is a bit harder to crack.
		 */
		public function AntiCheatNumber(num:Number, multiInstance:Boolean = true)
		{
			_offset = MathUtil.randomNumber(-1000, 1000, true);
			_num = new Vector.<Number>();
			var instances:uint = multiInstance ? 1 : MathUtil.randomNumber(2, 6);
			for (var i:int = 0; i < instances; i++)
			{
				_num.push(num + _offset + 43);	//	Magic (salt) number = 43 ;)
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
					//	TODO Someone has altered memory. Someone is cheating!
					trace("CHEATER!");
				}
				
				_num[i] = value + _offset + 43;
			}
		}
		
		/**
		 * Return the actual value.
		 * @return Number
		 */
		public function get value():Number
		{
			return _num[Math.floor(_num.length / 2)] - _offset - 43;
		}
	}
}
