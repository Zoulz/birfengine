package com.burninghead.tests.unit.utils
{
	import flash.geom.Point;
	import org.hamcrest.object.equalTo;
	import com.burninghead.birf.utils.MathUtil;

	import org.flexunit.assertThat;
	import org.hamcrest.number.greaterThanOrEqualTo;
	import org.hamcrest.number.lessThanOrEqualTo;
	/**
	 * @author tomas.augustinovic
	 */
	public class MathUtilTests
	{
		[Test(description='Randomize a number between 1-10 and check if the generated number is within that span.')]
		public function randomNumberTest():void
		{
			var r:Number = MathUtil.randomNumber(1, 10);

			assertThat(r, greaterThanOrEqualTo(1));
			assertThat(r, lessThanOrEqualTo(10));
			
			r = MathUtil.randomNumber(1, 10, true);
			
			assertThat(r, greaterThanOrEqualTo(1));
			assertThat(r, lessThanOrEqualTo(10));
			
			MathUtil.setPseudoRandomSeed(123456789);
			r = MathUtil.nextPseudoRandomInt(10);
			
			assertThat(r, lessThanOrEqualTo(10));
			assertThat(r, greaterThanOrEqualTo(0));
		}
		
		[Test]
		public function constrainTest():void
		{
			assertThat(MathUtil.constrain(5, 0, 10), equalTo(5));
			assertThat(MathUtil.constrain(15, 0, 10), equalTo(10));
			assertThat(MathUtil.constrain(-12, 0, 10), equalTo(0));
		}
		
		[Test]
		public function isEvenTest():void
		{
			assertThat(MathUtil.isEven(2), equalTo(true));
			assertThat(MathUtil.isEven(5), equalTo(false));
		}
		
		[Test]
		public function roundToPrecisionTest():void
		{
			assertThat(MathUtil.roundToPrecision(2.5234, 0), equalTo(3));
			assertThat(MathUtil.roundToPrecision(2.3234, 0), equalTo(2));
			assertThat(MathUtil.roundToPrecision(5.2214, 2), equalTo(5.22));
			assertThat(MathUtil.roundToPrecision(5.2274, 2), equalTo(5.23));
			assertThat(MathUtil.roundToPrecision(5.2, 4), equalTo(5.2));
		}
		
		[Test]
		public function lerpPointTest():void
		{
			var p:Point = MathUtil.lerpPoint(new Point(0, 6), new Point(0, 12), 0.5)
			
			assertThat(p.x, equalTo(0));
			assertThat(p.y, equalTo(9));
		}
	}
}
