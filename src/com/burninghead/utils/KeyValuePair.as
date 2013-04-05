package com.burninghead.utils
{
	/**
	 * Standard key/value pair. Holds a untyped key and a value.
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
	 * @author Zoulz
	 */
	public class KeyValuePair
	{
		private var _key:*;
		private var _value:*;
		
		/**
		 * Initializes with a key and value.
		 * 
		 * @param key Key object.
		 * @param value Value object.
		 */
		public function KeyValuePair(key:*, value:*)
		{
			_key = key;
			_value = value;
		}

		/**
		 * Return the key object.
		 * @return *
		 */
		public function get key():*
		{
			return _key;
		}

		/**
		 * Return the value object.
		 * @return *
		 */
		public function get value():*
		{
			return _value;
		}
		
		/**
		 * Parse a string and return a key value pair from the parsed data.
		 * @param kayValue String representation of the key-value pair
		 * @param delim Delimiter string that seperates the key from the value
		 * @return KeyValuePair
		 */
		public static function from(keyValue:String, delim:String = "="):KeyValuePair
		{
			var split:Array = keyValue.split(delim, 2);
			var keyVal:KeyValuePair = null;
			
			if (split[0] != null && split[1] != null)
			{
				keyVal = new KeyValuePair(split[0], split[1]);
			}
			
			return keyVal;
		}
	}
}
