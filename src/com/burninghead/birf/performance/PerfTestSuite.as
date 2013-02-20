package com.burninghead.birf.performance
{
	/**
	 * @author tomas.augustinovic
	 */
	public class PerfTestSuite
	{
		private var _tests:Vector.<PerfTestCase>;
		
		public function PerfTestSuite()
		{
			_tests = new Vector.<PerfTestCase>();
		}
		
		public function run():void
		{
			for each (var testCase:PerfTestCase in _tests)
			{
				printReport(testCase.execute());
			}
		}
		
		private function printReport(reports:Vector.<PerfTestReport>):void
		{
			for each (var report:PerfTestReport in reports)
			{
				trace(report.name + " > " + report.executionTimeMs + "ms, " + report.memoryUsageBytes + " bytes used.");
			}
		}

		public function get tests():Vector.<PerfTestCase>
		{
			return _tests;
		}
	}
}
