package com.burninghead.utils.math
{
	import com.burninghead.utils.ICloneable;
	import com.burninghead.utils.MathUtils;
	import com.burninghead.utils.ObjectUtils;
	/**
	 * Defines a polygon in 2D space.
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
	public class Polygon2D implements ICloneable
	{
		private var _points:Vector.<Vector2D>;
		private var _size:int;

		/**
		 * Constructor stores the list of points.
		 */
		public function Polygon2D(points:Vector.<Vector2D>)
		{
			_points = points;
			_size = points.length;
		}
		
		/**
		 * Return the list of points in the polygon.
		 * @return Vector.<Vector2D>
		 */
		public function get points():Vector.<Vector2D>
		{
			return _points;
		}
		
		/**
		 * Determines if the supplied 2D vector position is within the polygon.
		 * @param p Point to check.
		 * @return Boolean
		 */
		public function pointInside(p:Vector2D):Boolean
		{
			var cross:int = 0;
			for (var i:int = 0; i < _size; ++i)
			{
				var p1:Vector2D = _points[i];
				var p2:Vector2D = _points[(i + 1) % _size];
				var d:Number = (p.y - p1.y) * (p2.x - p1.x) - (p.x - p1.x) * (p2.y - p1.y);

				if ((p1.y >= p.y) != (p2.y >= p.y))
				{
					cross += int((p2.y - p1.y > 0)? d >= 0 : d <= 0);
				}
				if (d < MathUtils.EPSILON
					&& Math.min(p1.x, p2.x) <= p.x
					&& p.x <= Math.max(p1.x, p2.x)
					&& Math.min(p1.y, p2.y) <= p.y
					&& p.y <= Math.max(p1.y, p2.y))
				{
						return true;
				}
			}
			
			return (cross & 1) == 1;
		}

		/**
		 * Creates a deep clone of the polygon.
		 * @return *
		 */
		public function clone():*
		{
			return new Polygon2D(ObjectUtils.clone(_points) as Vector.<Vector2D>);
		}
	}
}
