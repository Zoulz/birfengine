package com.burninghead.tests.unit.utils
{
	import org.hamcrest.object.equalTo;
	import com.burninghead.birf.utils.security.AntiCheatNumber;

	import org.flexunit.assertThat;
	/**
	 * @author tomas.augustinovic
	 */
	public class AntiCheatNumberTests
	{
		[Test]
		public function numberWithMultiTest():void
		{
			var num:AntiCheatNumber = new AntiCheatNumber(5);
			
			assertThat(num.value, equalTo(5));
		}
		
		[Test]
		public function numberWithoutMultiTest():void
		{
			var num:AntiCheatNumber = new AntiCheatNumber(13, false);
			
			assertThat(num.value, equalTo(13));
		}
	}
}
