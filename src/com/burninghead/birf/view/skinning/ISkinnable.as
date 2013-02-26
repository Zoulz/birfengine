package com.burninghead.birf.view.skinning
{
	/**
	 * Describe a object that can be skinned. This basically means that the
	 * visual/audible appearence of a view component can be changed on-the-fly.
	 * 
	 * @author tomas.augustinovic
	 */
	public interface ISkinnable
	{
		/**
		 * Return the currently set skin of this object.
		 * @return Skin object of skinnable.
		 */
		function get skin():*;
		/**
		 * Set a new skin for this object.
		 * @param value New skin object.
		 */
		function set skin(value:*):void;
	}
}
