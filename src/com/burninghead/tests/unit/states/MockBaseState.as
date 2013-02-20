package com.burninghead.tests.unit.states
{
	import com.burninghead.birf.states.BaseState;
	/**
	 * @author tomas.augustinovic
	 */
	public class MockBaseState extends BaseState
	{
		override public function enter():void
		{
			performTransition("testTransition");
		}
	}
}
