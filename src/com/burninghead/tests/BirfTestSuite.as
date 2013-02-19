package com.burninghead.tests
{
	import com.burninghead.tests.states.BaseStateMachineTests;
	import com.burninghead.tests.utils.AntiCheatNumberTests;
	import com.burninghead.tests.view.stage2d.Stage2DViewTests;
	import com.burninghead.tests.view.BaseViewTests;
	/**
	 * @author tomas.augustinovic
	 */
	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class BirfTestSuite
	{
		public var gameTest:BaseGameTests;
		
		//	VIEW
		public var viewTests:BaseViewTests;
		public var stage2dViewTests:Stage2DViewTests;
		
		//	STATES
		public var stateMachineTests:BaseStateMachineTests;
		
		//	UTILS
		public var antiCheatNumTests:AntiCheatNumberTests;
	}
}
