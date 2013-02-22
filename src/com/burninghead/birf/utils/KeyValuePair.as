package com.burninghead.birf.utils
{
	/**
	 * Standard key/value pair. Holds a key and a value.
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
