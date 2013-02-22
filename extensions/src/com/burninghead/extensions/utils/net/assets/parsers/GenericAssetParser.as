package com.burninghead.extensions.utils.net.assets.parsers
{
	import com.burninghead.birf.utils.net.assets.IAsset;
	import com.burninghead.birf.utils.net.assets.IAssetParser;
	import com.burninghead.extensions.utils.net.assets.types.GenericAsset;
	import com.greensock.loading.BinaryDataLoader;
	import com.greensock.loading.CSSLoader;
	import com.greensock.loading.DataLoader;
	import com.greensock.loading.XMLLoader;
	import com.greensock.loading.core.LoaderItem;
	/**
	 * @author tomas.augustinovic
	 */
	public class GenericAssetParser implements IAssetParser
	{
		public function parse(input:*):IAsset
		{
			var out:IAsset = null;
			
			if (input is BinaryDataLoader || input is DataLoader || input is CSSLoader || input is XMLLoader)
			{
				out = new GenericAsset(input as LoaderItem);
			}
			
			return out;
		}
	}
}
