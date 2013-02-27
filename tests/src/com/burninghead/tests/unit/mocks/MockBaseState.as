package com.burninghead.tests.unit.mocks
{
	import com.burninghead.birf.states.IState;
	import com.burninghead.birf.states.BaseState;
	/**
	 * Mock state that simply transitions to the next state upon
	 * entering.
	 * 
	 * @author tomas.augustinovic
	 */
	public class MockBaseState extends BaseState implements IState
	{
		override public function enter():void
		{
			performTransition("testTransition");
		}
	}
}
