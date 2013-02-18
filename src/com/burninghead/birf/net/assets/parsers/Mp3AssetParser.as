package com.burninghead.birf.net.assets.parsers
{
	import com.burninghead.birf.net.assets.types.Mp3Asset;
	import com.greensock.loading.MP3Loader;
	import com.burninghead.birf.net.assets.IAsset;
	import com.burninghead.birf.net.assets.IAssetParser;
	/**
	 * @author tomas.augustinovic
	 */
	public class Mp3AssetParser implements IAssetParser
	{
		public function parse(input:*):IAsset
		{
			var out:IAsset = null;
			
			if (input is MP3Loader)
			{
				out = new Mp3Asset(input);
			}
			
			return out;
		}
	}
}
