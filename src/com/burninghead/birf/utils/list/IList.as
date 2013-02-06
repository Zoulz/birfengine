package com.burninghead.birf.utils.list
{
	import org.osflash.signals.ISignal;
	/**
	 * @author tomas.augustinovic
	 */
	public interface IList
	{
		function addItem(item:IListItem):void;
		function removeItem(item:IListItem):void;
		function clear():void;
		function run():void;
		function stop():void;
		
		function get complete():ISignal;
		function get aborted():ISignal;
		function get itemComplete():ISignal;
		function get isRunning():Boolean;
	}
}
