package com.burninghead.tests
{
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
		
		//	VIEW PACKAGE
		public var viewTests:BaseViewTests;
		public var stage2dViewTests:Stage2DViewTests;
	}
}
