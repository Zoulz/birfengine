package com.burninghead.birf.utils.misc
{
	import flash.utils.getTimer;
	/**
	 * @author Zoulz
	 */
	public class TimedFunction
	{
		private var _beforeTime:int;
		private var _afterTime:int;
		private var _result:int;
		
		public function TimedFunction(codeFunc:Function = null)
		{
			if (codeFunc != null)
			{
				_result = run(codeFunc);
			}
		}
		
		public function run(codeFunc:Function):int
		{
			_beforeTime = getTimer();
			codeFunc();
			_afterTime = getTimer();
			
			return _afterTime - _beforeTime;
		}

		public function get result():int
		{
			return _result;
		}
	}
}
