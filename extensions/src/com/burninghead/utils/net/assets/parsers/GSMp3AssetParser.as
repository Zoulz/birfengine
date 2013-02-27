package com.burninghead.utils.net.assets.parsers
{
	import com.burninghead.utils.net.assets.IAsset;
	import com.burninghead.utils.net.assets.IAssetParser;
	import com.burninghead.utils.net.assets.types.GSMp3Asset;
	import com.greensock.loading.MP3Loader;
	/**
	 * @author tomas.augustinovic
	 */
	public class GSMp3AssetParser implements IAssetParser
	{
		public function parse(input:*):IAsset
		{
			var out:IAsset = null;
			
			if (input is MP3Loader)
			{
				out = new GSMp3Asset(input);
			}
			
			return out;
		}
	}
}
