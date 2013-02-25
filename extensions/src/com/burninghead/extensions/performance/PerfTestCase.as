package com.burninghead.extensions.performance
{
	import flash.net.LocalConnection;
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
				runGC();
				
				var mem:int = System.totalMemory;
				var testFunc:Function = test.func;
				var testReport:PerfTestReport = new PerfTestReport();
				var t:uint = getTimer();
				
				for (var i:int = 0; i < 1000000; i++)
				{
					testFunc();
				}
				
				testReport.executionTimeMs = getTimer() - t;
				testReport.name = test.name;
				testReport.memoryUsageBytes = System.totalMemory - mem;
				
				reports.push(testReport);
			}
			
			return reports;
		}
		
		private function runGC():void
		{
			try
			{
				new LocalConnection().connect("_FORCE_GC_");
				new LocalConnection().connect("_FORCE_GC_");
			}
			catch(e:*)
			{
			}
		}

		public function get tests():Vector.<Object>
		{
			return _tests;
		}
	}
}
