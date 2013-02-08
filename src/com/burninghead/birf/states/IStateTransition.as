package com.burninghead.birf.states
{
	/**
	 * @author tomas.augustinovic
	 */
	public interface IStateTransition
	{
		function get fromStateId():Object;
		function get toStateId():Object;
	}
}
