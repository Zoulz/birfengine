package com.burninghead.tests.unit.utils
{
	import com.burninghead.utils.security.AntiCheatNumber;

	import org.flexunit.assertThat;
	import org.hamcrest.object.equalTo;
	/**
	 * @author tomas.augustinovic
	 */
	public class AntiCheatNumberTests
	{
		[Test(description='Create a anticheat number with multi-instancing. Assert if it contains the same number as was put in.')]
		public function numberWithMultiTest():void
		{
			var num:AntiCheatNumber = new AntiCheatNumber(5);
			
			assertThat(num.value, equalTo(5));
		}
		
		[Test(description='Create a anticheat number without multi-instancing. Assert if it contains the same number as was put in.')]
		public function numberWithoutMultiTest():void
		{
			var num:AntiCheatNumber = new AntiCheatNumber(13, false);
			
			assertThat(num.value, equalTo(13));
		}
		
		[Test(description='Create a anticheat number with multi-instancing. Change the value and assert if it contains the same number.')]
		public function changeNumberTest():void
		{
			var num:AntiCheatNumber = new AntiCheatNumber(7);
			
			num.value = 52;
			
			assertThat(num.value, equalTo(52));
		}
	}
}
