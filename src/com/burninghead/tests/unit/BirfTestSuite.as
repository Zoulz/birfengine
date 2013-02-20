package com.burninghead.tests.unit
{
	import com.burninghead.tests.unit.messaging.SignalMessageHandlerTests;
	import com.burninghead.tests.unit.states.BaseStateMachineTests;
	import com.burninghead.tests.unit.utils.AntiCheatNumberTests;
	import com.burninghead.tests.unit.utils.StringUtilTests;
	import com.burninghead.tests.unit.view.BaseViewTests;
	import com.burninghead.tests.unit.view.stage2d.Stage2DViewTests;
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
		
		//	MESSAGING
		public var signalHandlerTests:SignalMessageHandlerTests;
		
		//	UTILS
		public var antiCheatNumTests:AntiCheatNumberTests;
		public var stringUtilTests:StringUtilTests;
	}
}
