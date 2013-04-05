package com.burninghead.extensions.language
{
	/**
	 * @author tomas.augustinovic
	 */
	public interface ILanguageModel
	{
		function getString(id:String):String;
		function get currentLanguage():String;
	}
}
