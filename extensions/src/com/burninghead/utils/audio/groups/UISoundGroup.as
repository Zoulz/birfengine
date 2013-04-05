package com.burninghead.utils.audio.groups
{
	import com.burninghead.utils.assets.types.MaxSwfAsset;
	import com.burninghead.utils.audio.AssetSoundGroup;
	import com.burninghead.utils.audio.ISoundGroup;
	/**
	 * @author tomas.augustinovic
	 */
	public class UISoundGroup extends AssetSoundGroup implements ISoundGroup, IUISoundGroup
	{
		private var _sndPackage:String;
		
		public function UISoundGroup(soundPackage:String, asset:MaxSwfAsset = null)
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
