package com.burninghead.utils.assets.parsers
{
	import com.burninghead.utils.assets.IAsset;
	import com.burninghead.utils.assets.IAssetParser;
	import com.burninghead.utils.assets.types.GSGenericAsset;
	import com.greensock.loading.BinaryDataLoader;
	import com.greensock.loading.CSSLoader;
	import com.greensock.loading.DataLoader;
	import com.greensock.loading.XMLLoader;
	import com.greensock.loading.core.LoaderItem;
	/**
	 * @author tomas.augustinovic
	 */
	public class GSGenericAssetParser implements IAssetParser
	{
		public function parse(input:*):IAsset
		{
			var out:IAsset = null;
			
			if (input is BinaryDataLoader || input is DataLoader || input is CSSLoader || input is XMLLoader)
			{
				out = new GSGenericAsset(input as LoaderItem);
			}
			
			return out;
		}
	}
}
