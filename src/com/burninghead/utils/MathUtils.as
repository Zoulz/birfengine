package com.burninghead.utils
{
	import flash.geom.Point;

	/**
	 * Collection of math-related static functions.
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
	public final class MathUtils
	{
		public static const EPSILON:Number = 0.0000000000001;
		public static const EPSILON_SQR:Number = EPSILON * EPSILON;
		public static const RADIANS_TO_DEGREE:Number = 180 / Math.PI;
		
		/**
		 * Returns a random number between min and max.
		 * 
		 * @param min The minimum threshold of the randomized number.
		 * @param max The maximum threshold of the randomized number.
		 * @return Number
		 */
		public static function randomNumber(min:Number, max:Number, rounded:Boolean = false):Number
		{
			var rnd:Number = (min + Math.random() * (max - min));
			
			return rounded ? Math.round(rnd) : rnd;
		}
		
		/**
		 * Constrain a number within the min and max range.
		 * 
		 * @param num Number to constrain.
		 * @param min Minimum constraint.
		 * @param max Maximum constraint.
		 * @return The resulting number.
		 */
		public static function constrain(num:Number, min:Number = 0, max:Number = 1):Number
		{
			if (num < min) return min;
			if (num > max) return max;
			
			return num;
		}
		
		/**
		 * Returns true if the supplied number is even.
		 * 
		 * @param num Number to check.
		 */
		public static function isEven(num:Number):Boolean
		{
			return (num & 1) == 0;
		}
		
		/**
		 * Return a random color.
		 */
		public static function randomColor():uint
		{
			return Math.random() * 0xFFFFFF;
		}
		
		/**
		 * Return the hexadecimal value of a integer color value.
		 * @param color The integer value to convert.
		 * @return Hexadecimal color value as a string.
		 */
		public static function hexColor(color:int):String
		{
			return "#" + color.toString(16);
		}
		
		/**
		 * Round a number to specified precision of decimals.
		 * 
		 * @param num Number to round.
		 * @param precision Number of decimals.
		 * @return The resulting number.
		 */
		public static function roundToPrecision(num:Number, precision:int = 0):Number
		{
			var decimalPlaces:Number = Math.pow(10, precision);
			return Math.round(decimalPlaces * num) / decimalPlaces;
		}
		
		/**
		 * Linear interpolation between two points.
		 * @param p1 Point one.
		 * @param p2 Point two.
		 * @param delta Delta point to get (0-1).
		 * @return Resulting point.
		 */
		public static function lerpPoint(p1:Point, p2:Point, delta:Number):Point
		{
			var ret:Point = new Point();
			ret.x = delta * (p1.x - p2.x) + p2.x;
			ret.y = delta * (p1.y - p2.y) + p2.y;
			
			return ret;
		}
	}
}
