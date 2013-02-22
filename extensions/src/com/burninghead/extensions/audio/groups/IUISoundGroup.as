package com.burninghead.extensions.audio.groups
{
	import com.burninghead.birf.audio.ISoundGroup;
	/**
	 * @author tomas.augustinovic
	 */
	public interface IUISoundGroup extends ISoundGroup
	{
		/**
		 * Play sound triggered by releasing the mouse button.
		 */
		function playButtonRelease():void;
		/**
		 * Play sound triggered when mouse button is pressed.
		 */
		function playButtonClick():void;
		/**
		 * Play sound that is triggered when moving cursor over button.
		 */
		function playButtonOver():void;
		/**
		 * Play sound that is triggered when leaving the click area of a button.
		 */
		function playButtonOut():void;
	}
}
