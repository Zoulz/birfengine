package com.burninghead.tests
{
	import com.burninghead.tests.performance.BirfPerformanceTestSuite;

	import flash.display.Sprite;
	/**
	 * @author tomas.augustinovic
	 */
	public class PerformanceTestRunner extends Sprite
	{
		private var _suite:BirfPerformanceTestSuite;
		
		public function PerformanceTestRunner()
		{
			_suite = new BirfPerformanceTestSuite();
			_suite.run();
		}
	}
}
