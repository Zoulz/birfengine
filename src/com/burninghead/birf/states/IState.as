package com.burninghead.birf.states
{
	import org.osflash.signals.ISignal;
	/**
	 * @author tomas.augustinovic
	 */
	public interface IState
	{
		function enter():void;
		function exit():void;
		function update():void;
		
		function get transition():ISignal;
	}
}
