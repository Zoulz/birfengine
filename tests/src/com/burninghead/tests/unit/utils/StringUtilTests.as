package com.burninghead.tests.unit.utils
{
	import com.burninghead.utils.StringUtils;

	import org.flexunit.assertThat;
	import org.hamcrest.object.equalTo;
	/**
	 * @author Zoulz
	 */
	public class StringUtilTests
	{
		[Test]
		public function resolveParameterizedStringTest():void
		{
			var input:String = "Berra is a {0} goose. He likes to {1}.";
			var output:String = StringUtils.resolveParameterizedString(input, "fine", "dance");
			
			assertThat(output, equalTo("Berra is a fine goose. He likes to dance."));
		}
		
		[Test]
		public function toBooleanTest():void
		{
			assertThat(StringUtils.toBoolean("true"), equalTo(true));
			assertThat(StringUtils.toBoolean("tRuE"), equalTo(true));
			
			assertThat(StringUtils.toBoolean("false"), equalTo(false));
			assertThat(StringUtils.toBoolean("fAlSe"), equalTo(false));
		}
		
		[Test]
		public function formatSecondsTest():void
		{
			assertThat(StringUtils.formatSeconds(500, false), equalTo("500"));
			
			assertThat(StringUtils.formatSeconds(500, true), equalTo("08:20"));
			
			assertThat(StringUtils.formatSeconds(500, true, true), equalTo("00:08:20"));
		}
		
		[Test]
		public function padStringTest():void
		{
			assertThat(StringUtils.padBeforeString("Berra is a fine goose.", 6), equalTo("      Berra is a fine goose."));
			assertThat(StringUtils.padBeforeString("Berra is a fine goose.", 7, "@"), equalTo("@@@@@@@Berra is a fine goose."));
			
			assertThat(StringUtils.padAfterString("Berra is a fine goose.", 6), equalTo("Berra is a fine goose.      "));
			assertThat(StringUtils.padAfterString("Berra is a fine goose.", 7, "@"), equalTo("Berra is a fine goose.@@@@@@@"));
		}
		
		[Test]
		public function extractClassNameTest():void
		{
			assertThat(StringUtils.extractClassName("com.berra.test::BerraTheClass"), equalTo("BerraTheClass"));
		}
		
		[Test]
		public function isValidEmailTest():void
		{
			assertThat(StringUtils.isValidEmail("berra@burninghead.com"), equalTo(true));
			
			assertThat(StringUtils.isValidEmail("berra_burninghead4com"), equalTo(false));
		}
		
		[Test]
		public function isValidURLTest():void
		{
			assertThat(StringUtils.isValidURL("http://berra.com"), equalTo(true));
			assertThat(StringUtils.isValidURL("ftp://berra.com:5433"), equalTo(true));
			
			assertThat(StringUtils.isValidURL("http//berra_com"), equalTo(false));
		}
		
		[Test]
		public function isEmptyTest():void
		{
			assertThat(StringUtils.isEmpty(""), equalTo(true));
			
			assertThat(StringUtils.isEmpty("berra"), equalTo(false));
		}
		
		[Test]
		public function isAlphaNumericTest():void
		{
			assertThat(StringUtils.isAlphaNumeric("/ber$ra\\"), equalTo(true));
			
			assertThat(StringUtils.isAlphaNumeric("berra"), equalTo(false));
		}
		
		[Test]
		public function afterBeforTest():void
		{
			var test:String = "berra is a fine goose. but not as fine as ronny.";
			
			assertThat(StringUtils.afterFirst(test, "fine"), equalTo(" goose. but not as fine as ronny."));
			
			assertThat(StringUtils.afterLast(test, "fine"), equalTo(" as ronny."));
			
			assertThat(StringUtils.beforeFirst(test, "fine"), equalTo("berra is a "));
			
			assertThat(StringUtils.beforeLast(test, "fine"), equalTo("berra is a fine goose. but not as "));
		}
		
		[Test]
		public function beginsWithTest():void
		{
			assertThat(StringUtils.beginsWith("berra is a fine goose.", "berra"), equalTo(true));
			
			assertThat(StringUtils.beginsWith("berra is a fine goose.", "goose"), equalTo(false));
		}
		
		[Test]
		public function betweenTest():void
		{
			assertThat(StringUtils.between("berra is a fine goose.", "berra", "goose"), equalTo(" is a fine "));
		}
		
		[Test]
		public function capitalizeTest():void
		{
			assertThat(StringUtils.capitalize("berra is a fine goose.", false), equalTo("Berra is a fine goose."));
			assertThat(StringUtils.capitalize("berra is a fine goose.", true), equalTo("Berra Is A Fine Goose."));
		}
		
		[Test]
		public function containsTest():void
		{
			assertThat(StringUtils.contains("berra is a fine goose.", "goose"), equalTo(true));
			assertThat(StringUtils.contains("berra is a fine goose.", "ronny"), equalTo(false));
		}
		
		[Test]
		public function countOfTest():void
		{
			assertThat(StringUtils.countOf("berra is a fine goose.", "goose", false), equalTo(1));
			assertThat(StringUtils.countOf("berra is a fine goose.", "goose", true), equalTo(1));
			assertThat(StringUtils.countOf("berra is a fine goose.", "goOsE", true), equalTo(0));
			assertThat(StringUtils.countOf("berra is a fine goose.", "a", false), equalTo(2));
			assertThat(StringUtils.countOf("berra is a fine goose.", "A", true), equalTo(0));
		}
		
		[Test]
		public function truncateTest():void
		{
			assertThat(StringUtils.truncate("berra is a fine goose.", 10), equalTo("berra is a..."));
			assertThat(StringUtils.truncate("berra is a fine goose.", 10, "O_o"), equalTo("berra is aO_o"));
			assertThat(StringUtils.truncate("berra is a fine goose.", 90), equalTo("berra is a fine goose."));
		}
		
		[Test]
		public function countWordsTest():void
		{
			assertThat(StringUtils.wordCount("berra is a fine goose."), equalTo(5));
			assertThat(StringUtils.wordCount("berra i$ a| fine g0ose."), equalTo(5));
			assertThat(StringUtils.wordCount("berra!"), equalTo(1));
		}
		
		[Test]
		public function trimmingTest():void
		{
			assertThat(StringUtils.trim("   berra is a fine goose. "), equalTo("berra is a fine goose."));
			assertThat(StringUtils.trim("berra is a fine goose. "), equalTo("berra is a fine goose."));
			assertThat(StringUtils.trim("      berra is a fine goose."), equalTo("berra is a fine goose."));
			
			assertThat(StringUtils.trimLeft("      berra is a fine goose."), equalTo("berra is a fine goose."));
			assertThat(StringUtils.trimLeft("berra is a fine goose.   "), equalTo("berra is a fine goose.   "));
			
			assertThat(StringUtils.trimRight("berra is a fine goose.        "), equalTo("berra is a fine goose."));
			assertThat(StringUtils.trimRight("  berra is a fine goose."), equalTo("  berra is a fine goose."));
		}
		
		[Test]
		public function swapCaseTest():void
		{
			assertThat(StringUtils.swapCase("berra is a fine goose."), equalTo("BERRA IS A FINE GOOSE."));
			assertThat(StringUtils.swapCase("BERRA is a fine GOOSE."), equalTo("berra IS A FINE goose."));
		}
		
		[Test]
		public function stripTagsTest():void
		{
			assertThat(StringUtils.stripTags("<berra id=\"kalle\">Tag are gone!</berra>"), equalTo("Tag are gone!"));
			
			assertThat(StringUtils.stripTags("<berra id=\"kalle\">>Tag are gone!><</berra>"), equalTo(">Tag are gone!>"));
		}
	}
}
