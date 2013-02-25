package com.burninghead.extensions.audio.groups
{
	import com.burninghead.birf.audio.ISoundGroup;
	import com.burninghead.extensions.audio.AssetSoundGroup;
	import com.burninghead.extensions.utils.net.assets.types.GSSwfAsset;
	/**
	 * @author tomas.augustinovic
	 */
	public class UISoundGroup extends AssetSoundGroup implements ISoundGroup, IUISoundGroup
	{
		private var _sndPackage:String;
		
		public function UISoundGroup(soundPackage:String, asset:GSSwfAsset = null)
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
