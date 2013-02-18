package com.burninghead.birf.net.assets.parsers
{
	import com.burninghead.birf.net.assets.types.SwfAsset;
	import com.greensock.loading.SWFLoader;
	import com.burninghead.birf.net.assets.IAsset;
	import com.burninghead.birf.net.assets.IAssetParser;
	/**
	 * @author tomas.augustinovic
	 */
	public class SwfAssetParser implements IAssetParser
	{
		public function parse(input:*):IAsset
		{
			var out:IAsset = null;
			
			if (input is SWFLoader)
			{
				out = new SwfAsset(input);
			}
			
			return out;
		}
	}
}
