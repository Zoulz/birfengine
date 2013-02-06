package com.burninghead.birf.utils
{
	import flash.display.DisplayObject;
	/**
	 * Interface to expose display object reference.
	 * 
	 * @author BigZoulz
	 */
	public interface IDisplayObject
	{
		/**
		 * Return display object coupled to object.
		 */
		function get displayObject():DisplayObject;
	}
}
