package com.burninghead.utils
{
	import flash.utils.getTimer;
	/**
	 * Executes the supplied function measuring the time it took.
	 * 
	 * @author tomas.augustinovic
	 */
	public class TimedFunction
	{
		private var _name:String;
		private var _result:String;
		
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
			
			_result = _name + ": " + endTime + "ms";
			trace(_result);
		}

		public function get result():String
		{
			return _result;
		}
	}
}
