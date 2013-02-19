package com.burninghead
{
	import mockolate.runner.MockolateRule;
	import com.burninghead.tests.BirfTestSuite;

	import org.flexunit.internals.TraceListener;
	import org.flexunit.runner.FlexUnitCore;

	import flash.display.Sprite;
	/**
	 * @author tomas.augustinovic
	 */
	public class TestRunner extends Sprite
	{
		[Rule] public var mockolateRule:MockolateRule = new MockolateRule();
		
		public static var stageContainer:Sprite;
		
		private var _core:FlexUnitCore;
		
		public function TestRunner()
		{
			//	Set static reference to stage container, which is this class.
			stageContainer = this;
			
			//	Create FlexUnit core object.
			_core = new FlexUnitCore();
			_core.addListener(new TraceListener());

			//	Run tests.
			_core.run(BirfTestSuite);
		}
	}
}
