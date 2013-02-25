package com.burninghead.extensions.audio
{
	import com.burninghead.birf.audio.BaseSoundGroup;
	import com.burninghead.birf.audio.ISoundGroup;
	import com.burninghead.birf.utils.ReflectionUtil;
	import com.burninghead.extensions.utils.net.assets.types.SwfAsset;

	import flash.media.Sound;

	/**
	 * @author tomas.augustinovic
	 */
	public class AssetSoundGroup extends BaseSoundGroup implements ISoundGroup
	{
		private var _asset:SwfAsset;
		
		/**
		 * Constructor.
		 * @param asset Swf asset to use when creating the sounds.
		 */
		public function AssetSoundGroup(asset:SwfAsset = null)
		{
			_asset = asset;
			
			super();
		}
		
		override protected function createSoundInstance(id:String):Sound
		{
			if (_asset != null)
			{
				var clazz:Class = _asset.getClass(id);
				return new clazz() as Sound;
			}
			else
			{
				return ReflectionUtil.getInstanceByName(id) as Sound;
			}
		}
	}
}
