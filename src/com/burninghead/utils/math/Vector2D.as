package com.burninghead.utils.math
{
	import com.burninghead.utils.ICloneable;
	import com.burninghead.utils.MathUtils;

	import flash.geom.Point;
	/**
	 * Implements a 2-dimentional vector.
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
	public class Vector2D implements ICloneable
	{
		public var x:Number = 0;
		public var y:Number = 0;
		
		/**
		 * Constructor sets the x and y.
		 */
		public function Vector2D(x:Number = 0, y:Number = 0)
		{
			this.x = x;
			this.y = y;
		}
		
		/**
		 * Static method to create a vector instance from a Point.
		 * @param value Point to convert into a vector.
		 * @return Vector2D
		 */
		public static function fromPoint(value:Point):Vector2D
		{
			return new Vector2D(value.x, value.y);
		}
		
		/**
		 * Return this vector as a Point.
		 * @return Point
		 */
		public function toPoint():Point
		{
			return new Point(this.x, this.y);
		}
		
		/**
		 * Add two vectors and return the result.
		 * @param vec2 Vector to add.
		 * @return Vector2D
		 */
		public function add(vec2:Vector2D):Vector2D
		{
			return new Vector2D(x + vec2.x, y + vec2.y);
		}
		
		/**
		 * Subtract two vectors and return result.
		 * @param vec2 Vector to subtract.
		 * @return Vector2D
		 */
		public function sub(vec2:Vector2D):Vector2D
		{
			return new Vector2D(x - vec2.x, y - vec2.y);
		}

		/**
		 * Multiply two vectors and return result.
		 * @param vec2 Vector to multiply with.
		 * @return Vector2D
		 */
		public function mul(vec2:Vector2D):Vector2D
		{
			return new Vector2D(x * vec2.x, y * vec2.y);
		}

		/**
		 * Divide two vectors and return the result.
		 * @param vec2 Vector to divide by.
		 * @return Vector2D
		 */
		public function div(vec2:Vector2D):Vector2D
		{
			return new Vector2D(x / vec2.x, y / vec2.y);
		}
		
		/**
		 * Add the current vector with another.
		 * @param vec2 Vector to add.
		 */
		public function addSelf(vec2:Vector2D):void
		{
			x += vec2.x;
			y += vec2.y;
		}
		
		/**
		 * Subtract the current vector with another.
		 * @param vec2 Vector to subtract.
		 */
		public function subSelf(vec2:Vector2D):void
		{
			x -= vec2.x;
			y -= vec2.y;
		}

		/**
		 * Multiply current vector with another.
		 * @param vec2 Vector to multiply with.
		 */
		public function mulSelf(vec2:Vector2D):void
		{
			x *= vec2.x;
			y *= vec2.y;
		}

		/**
		 * Divide current vector by another.
		 * @param vec2 Vector to divide by.
		 */
		public function divSelf(vec2:Vector2D):void
		{
			x /= vec2.x;
			y /= vec2.y;
		}
		
		/**
		 * 
		 */
		public function normalRight():Vector2D
		{
			return new Vector2D(-y, x);
		}
		
		/**
		 * 
		 */
		public function normalLeft():Vector2D
		{
			return new Vector2D(y, -x);
		}
		
		/**
		 * 
		 */
		public function normalRightSelf():void
		{
			const xt:Number = x;
			x = -y;
			y = xt;
		}
		
		/**
		 * 
		 */
		public function normalLeftSelf():void
		{
			const xt:Number = x;
			x = y;
			y = -xt;
		}
		
		/**
		 * Calculate dot product of two vectors.
		 * @param vec2 Secondary vector to use for calculation.
		 * @return Number
		 */
		public function dot(vec2:Vector2D):Number
		{
			return x * vec2.x + y * vec2.y;
		}
		
		/**
		 * Calculate cross product of two vectors.
		 * @param vec2 Second vector to use.
		 * @return Number
		 */
		public function crossDet(vec2:Vector2D):Number
		{
			return x * vec2.y - vec2.x * y;
		}
		
		/**
		 * Scale vector by amount.
		 * @param scale Amount to scale.
		 * @return Vector2D
		 */
		public function scale(scale:Number):Vector2D
		{
			return new Vector2D(x * scale, y * scale);
		}
		
		/**
		 * Scale this vector by the supplied value.
		 * @param scale Scale amount.
		 */
		public function scaleSelf(scale:Number):void
		{
			x *= scale;
			y *= scale;
		}
		
		/**
		 * Get length of vector.
		 * @return Number
		 */
		public function get length():Number
		{
			return Math.sqrt(x * x + y * y);
		}
		
		/**
		 * Get length of vector.
		 * @return Number
		 */
		public function get lengthSqr():Number
		{
			return x * x + y * y;
		}
		
		/**
		 * Get distance between two vectors.
		 * @param vec2 Second vector.
		 * @return Number
		 */
		public function distance(vec2:Vector2D):Number
		{
			const xDist:Number = x - vec2.x;
			const yDist:Number = y - vec2.y;
			return Math.sqrt(xDist * xDist + yDist * yDist);
		}
		
		/**
		 * Normalize vector.
		 * @return Vector2D
		 */
		public function normalize():Vector2D
		{
			const nf:Number = 1 / Math.sqrt(x * x + y * y);
			return new Vector2D(x * nf, y * nf);
		}
		
		/**
		 * Create a clone of this vector.
		 * @return Vector2D
		 */
		public function clone():*
		{
			return new Vector2D(x, y);
		}
		
		/**
		 * Copies the values of the supplied vector.
		 * @param vec2 Vector to copy.
		 */
		public function copy(vec2:Vector2D):void
		{
			x = vec2.x;
			y = vec2.y;
		}
		
		/**
		 * Rotate the vector.
		 * @param rad Radians to rotate.
		 * @return Vector2D
		 */
		public function rotate(rad:Number):Vector2D
		{
			const c:Number = Math.cos(rad);
			const s:Number = Math.sin(rad);
			
			return new Vector2D(
				c * x - s * y,
				s * x + c * y);
		}
		
		/**
		 * Linear interpolate between current and another vector.
		 * @param delta Delta (0-1)
		 * @param target The second vector.
		 * @return Vector2D
		 */
		public function lerp(target:Vector2D, delta:Number):Vector2D
		{
			return new Vector2D(
				x + (target.x - x) * delta,
				y + (target.y - y) * delta);
		}
		
		/**
		 * Spherical linear interpolation between this and another vector.
		 * @param delta 0-1
		 * @param target Second vector.
		 * @return Vector2D
		 */
		public function slerp(target:Vector2D, delta:Number):Vector2D
		{
			var dot:Number = dot(target);
			
			if (dot > 1 - MathUtils.EPSILON)
			{
				return target.clone();
			}
				
			if (dot < -1 + MathUtils.EPSILON)
			{
				return lerp(target, delta);
			}

		    const theta:Number = Math.abs(Math.acos(dot));
			const st:Number = Math.sin(theta);
			const c1:Number = Math.sin(theta * delta);
			const c2:Number = Math.sin((1 - delta) * theta);
			return new Vector2D(
				(x * c2 + target.x * c1) / st,
				(y * c2 + target.y * c1) / st);
		}
		
		/**
		 * Reflect the vector against wall vector.
		 * @param wall Vector representing wall.
		 * @return Vector2D
		 */
		public function reflect(wall:Vector2D):Vector2D
		{
			const wallNormalized:Vector2D = wall.normalize();
			const d:Number = dot(wallNormalized);
			return wallNormalized.scale(2 * d).sub(this);
	    }
		
		/**
		 * Get degrees between two vectors (clockwise).
		 * @param vec2 Second vector.
		 * @return Number
		 */
		public function degreesBetween(vec2:Vector2D):Number
		{
			return radiansBetween(vec2) * MathUtils.RADIANS_TO_DEGREE;
		}
		
		/**
		 * Get radians between two vectors (clockwise).
		 * @param vec2 Second vector.
		 * @return Number
		 */
		public function radiansBetween(vec2:Vector2D):Number
		{
			const radians:Number = Math.atan2(crossDet(vec2), dot(vec2));
			return radians >= 0 ? radians : 2 * Math.PI + radians;
		}
		
		/**
		 * Tests if the vector has the exact same values as another vector.
		 * @param vec2 To compare with.
		 * @return Boolean
		 */
		public function equals(vec2:Vector2D):Boolean
		{
			return x == vec2.x && y == vec2.y;
		}
	}
}
