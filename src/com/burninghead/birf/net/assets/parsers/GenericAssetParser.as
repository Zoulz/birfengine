package com.burninghead.birf.net.assets.parsers
{
	import com.greensock.loading.XMLLoader;
	import com.greensock.loading.CSSLoader;
	import com.greensock.loading.DataLoader;
	import com.greensock.loading.core.LoaderItem;
	import com.burninghead.birf.net.assets.types.GenericAsset;
	import com.greensock.loading.BinaryDataLoader;
	import com.burninghead.birf.net.assets.IAsset;
	import com.burninghead.birf.net.assets.IAssetParser;
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
