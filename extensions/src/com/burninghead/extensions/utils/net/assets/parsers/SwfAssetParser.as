package com.burninghead.extensions.utils.net.assets.parsers
{
	import com.burninghead.birf.utils.net.assets.IAsset;
	import com.burninghead.birf.utils.net.assets.IAssetParser;
	import com.burninghead.extensions.utils.net.assets.types.SwfAsset;
	import com.greensock.loading.SWFLoader;
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
