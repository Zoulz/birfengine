package com.burninghead.birf.view.skinning
{
	/**
	 * Describes a skin manager. Allows the registration and removal of
	 * skinnable objects. Can also trigger a re-skinning of the
	 * contained objects.
	 * 
	 * @author tomas.augustinovic
	 */
	public interface ISkinManager
	{
		/**
		 * Register a skinnable object with the manager.
		 * @param skinnable Object to be skinned.
		 */
		function registerSkinnable(skinnable:ISkinnable):void;
		/**
		 * Remove skinnable object from manager.
		 * @param skinnable Object to be removed.
		 */
		function unregisterSkinnable(skinnable:ISkinnable):void;
		/**
		 * Apply skin to all the objects of a certain class.
		 * @param skin Skin to apply.
		 * @param applyTo Apply to classes of this type.
		 */
		function setSkin(skin:*, applyTo:Class):void;
	}
}
