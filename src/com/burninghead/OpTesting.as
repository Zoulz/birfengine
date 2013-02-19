package com.burninghead
{
	import com.burninghead.birf.utils.StringUtil;
	import com.burninghead.birf.utils.perf.TimedFunction;

	import flash.display.Sprite;
	/**
	 * @author BigZoulz
	 */
	public class OpTesting extends Sprite
	{
		public function OpTesting()
		{
//			var test1:TimedFunction = new TimedFunction(function():void {
//				var i:int;
//				var j:int;
//				var num:AntiCheatNumber = new AntiCheatNumber(44);
//				
//				for (i = 0; i < 10000000; i++)
//				{
//					num.value = 523;
//					j = num.value;
//				}
//			});
//			trace("[AntiCheatNumber] assign/access: " + test1.result);
//			
//			var test2:TimedFunction = new TimedFunction(function():void {
//				var i:int;
//				var j:int;
//				var g:int;
//				
//				for (i = 0; i < 10000000; i++)
//				{
//					j = 523;
//					g = j;
//				}
//			});
//			trace("[Normal] assign/access: " + test2.result);

			var test:TimedFunction = new TimedFunction("StringUtil.resolveParameterizedString", 
			function():void
			{
				var str:String = "This is {0} a parameterized string.";
				var dest = StringUtil.resolveParameterizedString(str, "funny");

			}, 1000000);

		}
	}
}
