package com.burninghead.tests.unit.utils
{
	import com.burninghead.utils.MathUtils;

	import org.flexunit.assertThat;
	import org.hamcrest.number.greaterThanOrEqualTo;
	import org.hamcrest.number.lessThanOrEqualTo;
	import org.hamcrest.object.equalTo;

	import flash.geom.Point;
	/**
	 * @author tomas.augustinovic
	 */
	public class MathUtilTests
	{
		[Test(description='Randomize a number between 1-10 and check if the generated number is within that span.')]
		public function randomNumberTest():void
		{
			var r:Number = MathUtils.randomNumber(1, 10);

			assertThat(r, greaterThanOrEqualTo(1));
			assertThat(r, lessThanOrEqualTo(10));
			
			r = MathUtils.randomNumber(1, 10, true);
			
			assertThat(r, greaterThanOrEqualTo(1));
			assertThat(r, lessThanOrEqualTo(10));
			
			MathUtils.setPseudoRandomSeed(123456789);
			r = MathUtils.nextPseudoRandomInt(10);
			
			assertThat(r, lessThanOrEqualTo(10));
			assertThat(r, greaterThanOrEqualTo(0));
		}
		
		[Test]
		public function constrainTest():void
		{
			assertThat(MathUtils.constrain(5, 0, 10), equalTo(5));
			assertThat(MathUtils.constrain(15, 0, 10), equalTo(10));
			assertThat(MathUtils.constrain(-12, 0, 10), equalTo(0));
		}
		
		[Test]
		public function isEvenTest():void
		{
			assertThat(MathUtils.isEven(2), equalTo(true));
			assertThat(MathUtils.isEven(5), equalTo(false));
		}
		
		[Test]
		public function roundToPrecisionTest():void
		{
			assertThat(MathUtils.roundToPrecision(2.5234, 0), equalTo(3));
			assertThat(MathUtils.roundToPrecision(2.3234, 0), equalTo(2));
			assertThat(MathUtils.roundToPrecision(5.2214, 2), equalTo(5.22));
			assertThat(MathUtils.roundToPrecision(5.2274, 2), equalTo(5.23));
			assertThat(MathUtils.roundToPrecision(5.2, 4), equalTo(5.2));
		}
		
		[Test]
		public function lerpPointTest():void
		{
			var p:Point = MathUtils.lerpPoint(new Point(0, 6), new Point(0, 12), 0.5)
			
			assertThat(p.x, equalTo(0));
			assertThat(p.y, equalTo(9));
		}
	}
}
