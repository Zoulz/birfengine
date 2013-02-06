package com.burninghead.birf.net.assets
{
	import org.osflash.signals.ISignal;
	/**
	 * @author tomas.augustinovic
	 */
	public interface IAssetLoader
	{
		function load(urls:Vector.<String>, flushContent:Boolean = false):void;
		function cancel():void;
		function getAssetByUrl(url:String):IAsset;
		function getAssetByName(name:String):IAsset;
		
		//	Getters/Setters
		function get totalComplete():ISignal;
		function get totalProgress():ISignal;
		function get totalError():ISignal;
		function get itemComplete():ISignal;
		function get itemProgress():ISignal;
		function get itemFailed():ISignal;
	}
}
