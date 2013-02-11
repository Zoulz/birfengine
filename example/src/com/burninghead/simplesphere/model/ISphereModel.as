package com.burninghead.simplesphere.model
{
	/**
	 * @author Zoulz
	 */
	public interface ISphereModel
	{
		/**
		 * Return the color of the sphere.
		 */
		function get color():uint;
		/**
		 * Return how many times the sphere has been clicked.
		 */
		function get numClicks():uint;
	}
}
