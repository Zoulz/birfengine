package com.burninghead.utils.audio
{
	import com.burninghead.utils.ReflectionUtils;
	import com.burninghead.utils.assets.types.MaxSwfAsset;

	import flash.media.Sound;

	/**
	 * @author tomas.augustinovic
	 */
	public class AssetSoundGroup extends BaseSoundGroup implements ISoundGroup
	{
		private var _asset:MaxSwfAsset;
		
		/**
		 * Constructor.
		 * @param asset Swf asset to use when creating the sounds.
		 */
		public function AssetSoundGroup(asset:MaxSwfAsset = null)
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
				return ReflectionUtils.getInstanceByName(id) as Sound;
			}
		}
	}
}
