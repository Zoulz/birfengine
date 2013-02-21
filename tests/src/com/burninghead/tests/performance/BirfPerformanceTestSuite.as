package com.burninghead.tests.performance
{
	import com.burninghead.tests.performance.messaging.MessageHandlerTests;
	import com.burninghead.birf.performance.PerfTestSuite;
	/**
	 * @author tomas.augustinovic
	 */
	public class BirfPerformanceTestSuite extends PerfTestSuite
	{
		public function BirfPerformanceTestSuite()
		{
			super();
			
			tests.push(new MessageHandlerTests());
		}
	}
}
