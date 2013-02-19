package com.burninghead.birf.utils.perf
{
	import flash.utils.getTimer;
	/**
	 * @author Zoulz
	 */
	public class TimedFunction
	{
		private var _name:String;
		
		public function TimedFunction(name:String, codeFunc:Function = null, iterations:uint = 1)
		{
			if (codeFunc != null)
			{
				_name = name;
				
				run(codeFunc, iterations);
			}
		}
		
		public function run(codeFunc:Function, iterations:uint = 1):void
		{
			var t:uint = getTimer();
			
			for (var i:uint = 0; i < iterations; i++)
			{
				codeFunc.apply();
			}
			
			var endTime:uint = getTimer() - t;
			
			trace(_name + ": " + endTime + "ms");
		}
	}
}
