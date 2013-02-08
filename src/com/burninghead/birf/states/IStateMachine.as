package com.burninghead.birf.states
{
	/**
	 * @author tomas.augustinovic
	 */
	public interface IStateMachine
	{
		function update():void;
		function changeState(id:Object):void;
		function registerState(id:Object, state:IState):void;
		function unregisterState(id:Object):void;
		function registerTransition(id:Object, transition:IStateTransition):void;
		function unregisterTransition(id:Object):void;
	}
}
