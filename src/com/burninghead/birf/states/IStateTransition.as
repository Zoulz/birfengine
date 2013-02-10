package com.burninghead.birf.states
{
	/**
	 * @author tomas.augustinovic
	 */
	public interface IStateTransition
	{
		function get fromStateId():String;
		function get toStateId():String;
	}
}
