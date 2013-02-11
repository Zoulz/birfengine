package com.burninghead.birf.view.skinning
{
	/**
	 * @author Zoulz
	 */
	public interface ISkinManager
	{
		function registerSkinnable(skinnable:ISkinnable):void;
		function unregisterSkinnable(skinnable:ISkinnable):void;
		function setSkin(skin:*, applyTo:Class):void;
	}
}
