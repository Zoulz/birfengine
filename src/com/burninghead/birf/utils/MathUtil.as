package com.burninghead.birf.utils
{
	import flash.geom.Point;
	/**
	 * Collection of math-related static functions.
	 * 
	 * @author tomas.augustinovic
	 */
	public class MathUtil
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
		 * @return Number
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
		 * @return Boolean
		 */
		public static function isEven(num:Number):Boolean
		{
			return !(num % 2);
		}
		
		/**
		 * Return a random color 
		 * 
		 * @return uint
		 */
		public static function randomColor():uint
		{
			return Math.random() * 0xFFFFFF;
		}
		
		/**
		 * Round a number to specified precision of decimals.
		 * 
		 * @param num Number to round.
		 * @param precision Number of decimals.
		 * @return Number
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
		 * @param delta Delta point to get (0-1)
		 * @return Point
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
