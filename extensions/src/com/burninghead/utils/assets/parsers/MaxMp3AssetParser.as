package com.burninghead.utils.assets.parsers
{
	import com.burninghead.utils.assets.IAsset;
	import com.burninghead.utils.assets.IAssetParser;
	import com.burninghead.utils.assets.types.MaxMp3Asset;
	import com.greensock.loading.MP3Loader;
	/**
	 * @author tomas.augustinovic
	 */
	public class MaxMp3AssetParser implements IAssetParser
	{
		public function parse(input:*):IAsset
		{
			var out:IAsset = null;
			
			if (input is MP3Loader)
			{
				out = new MaxMp3Asset(input);
			}
			
			return out;
		}
	}
}
