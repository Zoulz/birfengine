package com.burninghead.utils
{
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	
	/**
	 * Utility class for the manipulation of objects.
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
	public final class ObjectUtils
	{
		/**
		 * Merge together two objects.
		 * @param obj1 First object to be merged
		 * @param obj2 Second object to be merged
		 * @return Object
		 */
		public static function mergeObjects(obj1:Object, obj2:Object):Object
		{
			var result:Object = { };
            var prop:String;
			
            for (prop in obj2)
			{
				result[prop] = obj2[prop];
            }
			
            for (prop in obj1)
			{
				result[prop] = obj1[prop];
            }
			
            return result;
		}

		/**
		 * Convert a iterable object into a array.
		 * @param iterable Object that can be iterated, like: Vector, Dictionary, Object
		 * @return Array
		 */		
		public static function toArray(iterable:*):Array
		{
			var ret:Array = [];
			
			if (iterable is Object || iterable is Array || iterable is Vector || iterable is Dictionary)
			{
				for each (var elem:* in iterable)
				{
					ret.push(elem);
				}
			}
			
			return ret;
		}
		
		/**
		 * Return a random index in a index-based iterable object (Array, Vector). A list of
		 * index exceptions can be supplied and will be ignored.
		 * @param iterable Iterable object to get random index from
		 * @param exceptions List of index exceptions to take into account for randomization
		 * @return uint
 		 */
		public static function getRandomIndex(iterable:*, exceptions:Vector.<uint>):uint
		{
			var rnd:uint = 0;
			
			if (iterable is Array || iterable is Vector)
			{
				do
				{
					rnd = MathUtils.randomNumber(0, Object(iterable).length - 1);
					
					if (exceptions.indexOf(rnd) == -1)
					{
						break;
					}
				}
				while(true);
			}
			
			return rnd;
		}
		
		/**
		 * Create a clone of the supplied object.
		 * @param source Object to clone
		 * @return Object
		 */
		public static function clone(source:Object):Object
		{
			var copier:ByteArray = new ByteArray();
			copier.writeObject(source);
			copier.position = 0;
			
			return copier.readObject();
		}
	}
}
