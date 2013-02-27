package com.burninghead.utils.math
{
	import com.burninghead.utils.ICloneable;
	import com.burninghead.utils.ObjectUtil;
	/**
	 * @author tomas.augustinovic
	 */
	public class Circle2D implements ICloneable
	{
		private var _pos:Vector2D;
		private var _radius:Number;
		
		public function Circle2D(pos:Vector2D, radius:Number)
		{
			_pos = pos;
			_radius = radius;
		}
		
		public function get pos():Vector2D
		{
			return _pos;
		}
		
		public function clone():*
		{
			return new Circle2D(_pos.clone() as Vector2D, ObjectUtil.clone(_radius) as Number);
		}

		public function get radius():Number
		{
			return _radius;
		}
	}
}
