package com.burninghead.utils.assets.parsers
{
	import com.burninghead.utils.assets.IAsset;
	import com.burninghead.utils.assets.IAssetParser;
	import com.burninghead.utils.assets.types.MaxSwfAsset;
	import com.greensock.loading.SWFLoader;
	/**
	 * @author tomas.augustinovic
	 */
	public class MaxSwfAssetParser implements IAssetParser
	{
		public function parse(input:*):IAsset
		{
			var out:IAsset = null;
			
			if (input is SWFLoader)
			{
				out = new MaxSwfAsset(input);
			}
			
			return out;
		}
	}
}
