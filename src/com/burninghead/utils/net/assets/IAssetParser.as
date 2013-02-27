package com.burninghead.utils.net.assets
{
	/**
	 * Describes a asset parser. Parsers are used to parse the incoming data and
	 * create a asset based on that data.
	 * 
	 * @author tomas.augustinovic
	 */
	public interface IAssetParser
	{
		/**
		 * Parse the incoming data to a asset type.
		 * @param input Data to process.
		 * @return Asset based on the parsed data.
		 */
		function parse(input:*):IAsset;
	}
}
