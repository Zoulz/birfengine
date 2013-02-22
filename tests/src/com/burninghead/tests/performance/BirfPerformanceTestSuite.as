package com.burninghead.tests.performance
{
	import com.burninghead.extensions.performance.PerfTestSuite;
	import com.burninghead.tests.performance.messaging.MessageHandlerTests;
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
