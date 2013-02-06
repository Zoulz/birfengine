package com.burninghead.birf.audio.groups
{
	import com.burninghead.birf.audio.BaseSoundGroup;
	import com.burninghead.birf.audio.ISoundGroup;
	import com.burninghead.birf.net.assets.types.SwfAsset;
	/**
	 * @author tomas.augustinovic
	 */
	public class UISoundGroup extends BaseSoundGroup implements ISoundGroup, IUISoundGroup
	{
		private var _sndPackage:String;
		
		public function UISoundGroup(soundPackage:String, asset:SwfAsset = null)
		{
			super(asset);
			
			_sndPackage = soundPackage;
		}
		
		/**
		 * @inheritDoc
		 */
		public function playButtonRelease():void
		{
			playSound(_sndPackage + ".ButtonReleaseSnd");
		}

		/**
		 * @inheritDoc
		 */
		public function playButtonClick():void
		{
			playSound(_sndPackage + ".ButtonClickSnd");
		}

		/**
		 * @inheritDoc
		 */
		public function playButtonOver():void
		{
			playSound(_sndPackage + ".ButtonOverSnd");
		}

		/**
		 * @inheritDoc
		 */
		public function playButtonOut():void
		{
			playSound(_sndPackage + ".ButtonOutSnd");
		}
	}
}
