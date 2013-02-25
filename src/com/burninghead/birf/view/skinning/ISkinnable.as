package com.burninghead.birf.view.skinning
{
	/**
	 * @author Zoulz
	 */
	public interface ISkinnable
	{
		/**
		 * Return the currently set skin of this object.
		 */
		function get skin():*;
		/**
		 * Set a new skin for this object.
		 * @param value Skin object
		 */
		function set skin(value:*):void;
	}
}
