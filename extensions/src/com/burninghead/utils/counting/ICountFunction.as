package com.burninghead.utils.counting
{
	import org.osflash.signals.ISignal;
	
	/**
	 * @author tomas.augustinovic
	 */
	public interface ICountFunction
	{
		function count(newValue:Number, seconds:Number):void;
		function abort():void;
		function get step():ISignal;
		function get complete():ISignal;
	}
}
