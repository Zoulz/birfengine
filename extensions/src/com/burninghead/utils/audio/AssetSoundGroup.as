package com.burninghead.utils.audio
{
	import com.burninghead.birf.audio.BaseSoundGroup;
	import com.burninghead.birf.audio.ISoundGroup;
	import com.burninghead.utils.ReflectionUtil;
	import com.burninghead.utils.net.assets.types.GSSwfAsset;

	import flash.media.Sound;

	/**
	 * @author tomas.augustinovic
	 */
	public class AssetSoundGroup extends BaseSoundGroup implements ISoundGroup
	{
		private var _asset:GSSwfAsset;
		
		/**
		 * Constructor.
		 * @param asset Swf asset to use when creating the sounds.
		 */
		public function AssetSoundGroup(asset:GSSwfAsset = null)
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
