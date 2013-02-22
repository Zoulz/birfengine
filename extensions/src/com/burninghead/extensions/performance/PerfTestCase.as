package com.burninghead.extensions.performance
{
	import flash.system.System;
	import flash.utils.getTimer;
	/**
	 * @author tomas.augustinovic
	 */
	public class PerfTestCase
	{
		private var _tests:Vector.<Object>;
		
		public function PerfTestCase()
		{
			_tests = new Vector.<Object>();
		}
		
		public function execute():Vector.<PerfTestReport>
		{
			var reports:Vector.<PerfTestReport> = new Vector.<PerfTestReport>();
			
			for each (var test:Object in _tests)
			{
				System.gc();	//	TODO measure memory usage. This does not work.
				
				var mem:uint = System.totalMemory;
				var testFunc:Function = test.func;
				var testReport:PerfTestReport = new PerfTestReport();
				var t:uint = getTimer();
				
				for (var i:int = 0; i < 1000000; i++)
				{
					testFunc();
				}
				
				testReport.executionTimeMs = getTimer() - t;
				testReport.name = test.name;
				
				System.gc();
				
				testReport.memoryUsageBytes = mem - System.totalMemory;
				
				reports.push(testReport);
			}
			
			return reports;
		}

		public function get tests():Vector.<Object>
		{
			return _tests;
		}
	}
}
