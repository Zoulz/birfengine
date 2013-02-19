package com.burninghead.birf.states
{
	import org.osflash.signals.ISignal;
	/**
	 * @author tomas.augustinovic
	 */
	public interface IStateMachine
	{
		function update():void;
		function changeState(id:String):void;
		function registerState(id:String, state:IState):void;
		function unregisterState(id:String):void;
		function registerTransition(id:String, transition:IStateTransition):void;
		function unregisterTransition(id:String):void;
		
		function get stateChanged():ISignal;
		function get stateId():String;
	}
}
