package com.burninghead.birf.utils.net.assets
{
	/**
	 * @author tomas.augustinovic
	 */
	public interface IAssetParser
	{
		/**
		 * Parse the incomming data to a asset type.
		 * @param input Data to process
		 * @return IAsset
		 */
		function parse(input:*):IAsset;
	}
}
