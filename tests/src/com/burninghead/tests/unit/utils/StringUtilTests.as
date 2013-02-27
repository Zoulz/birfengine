package com.burninghead.tests.unit.utils
{
	import com.burninghead.utils.StringUtil;

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
			var output:String = StringUtil.resolveParameterizedString(input, "fine", "dance");
			
			assertThat(output, equalTo("Berra is a fine goose. He likes to dance."));
		}
		
		[Test]
		public function toBooleanTest():void
		{
			assertThat(StringUtil.toBoolean("true"), equalTo(true));
			assertThat(StringUtil.toBoolean("tRuE"), equalTo(true));
			
			assertThat(StringUtil.toBoolean("false"), equalTo(false));
			assertThat(StringUtil.toBoolean("fAlSe"), equalTo(false));
		}
		
		[Test]
		public function formatSecondsTest():void
		{
			assertThat(StringUtil.formatSeconds(500, false), equalTo("500"));
			
			assertThat(StringUtil.formatSeconds(500, true), equalTo("08:20"));
			
			assertThat(StringUtil.formatSeconds(500, true, true), equalTo("00:08:20"));
		}
		
		[Test]
		public function padStringTest():void
		{
			assertThat(StringUtil.padBeforeString("Berra is a fine goose.", 6), equalTo("      Berra is a fine goose."));
			assertThat(StringUtil.padBeforeString("Berra is a fine goose.", 7, "@"), equalTo("@@@@@@@Berra is a fine goose."));
			
			assertThat(StringUtil.padAfterString("Berra is a fine goose.", 6), equalTo("Berra is a fine goose.      "));
			assertThat(StringUtil.padAfterString("Berra is a fine goose.", 7, "@"), equalTo("Berra is a fine goose.@@@@@@@"));
		}
		
		[Test]
		public function extractClassNameTest():void
		{
			assertThat(StringUtil.extractClassName("com.berra.test::BerraTheClass"), equalTo("BerraTheClass"));
		}
		
		[Test]
		public function isValidEmailTest():void
		{
			assertThat(StringUtil.isValidEmail("berra@burninghead.com"), equalTo(true));
			
			assertThat(StringUtil.isValidEmail("berra_burninghead4com"), equalTo(false));
		}
		
		[Test]
		public function isValidURLTest():void
		{
			assertThat(StringUtil.isValidURL("http://berra.com"), equalTo(true));
			assertThat(StringUtil.isValidURL("ftp://berra.com:5433"), equalTo(true));
			
			assertThat(StringUtil.isValidURL("http//berra_com"), equalTo(false));
		}
		
		[Test]
		public function isEmptyTest():void
		{
			assertThat(StringUtil.isEmpty(""), equalTo(true));
			
			assertThat(StringUtil.isEmpty("berra"), equalTo(false));
		}
		
		[Test]
		public function isAlphaNumericTest():void
		{
			assertThat(StringUtil.isAlphaNumeric("/ber$ra\\"), equalTo(true));
			
			assertThat(StringUtil.isAlphaNumeric("berra"), equalTo(false));
		}
		
		[Test]
		public function afterBeforTest():void
		{
			var test:String = "berra is a fine goose. but not as fine as ronny.";
			
			assertThat(StringUtil.afterFirst(test, "fine"), equalTo(" goose. but not as fine as ronny."));
			
			assertThat(StringUtil.afterLast(test, "fine"), equalTo(" as ronny."));
			
			assertThat(StringUtil.beforeFirst(test, "fine"), equalTo("berra is a "));
			
			assertThat(StringUtil.beforeLast(test, "fine"), equalTo("berra is a fine goose. but not as "));
		}
		
		[Test]
		public function beginsWithTest():void
		{
			assertThat(StringUtil.beginsWith("berra is a fine goose.", "berra"), equalTo(true));
			
			assertThat(StringUtil.beginsWith("berra is a fine goose.", "goose"), equalTo(false));
		}
		
		[Test]
		public function betweenTest():void
		{
			assertThat(StringUtil.between("berra is a fine goose.", "berra", "goose"), equalTo(" is a fine "));
		}
		
		[Test]
		public function capitalizeTest():void
		{
			assertThat(StringUtil.capitalize("berra is a fine goose.", false), equalTo("Berra is a fine goose."));
			assertThat(StringUtil.capitalize("berra is a fine goose.", true), equalTo("Berra Is A Fine Goose."));
		}
		
		[Test]
		public function containsTest():void
		{
			assertThat(StringUtil.contains("berra is a fine goose.", "goose"), equalTo(true));
			assertThat(StringUtil.contains("berra is a fine goose.", "ronny"), equalTo(false));
		}
		
		[Test]
		public function countOfTest():void
		{
			assertThat(StringUtil.countOf("berra is a fine goose.", "goose", false), equalTo(1));
			assertThat(StringUtil.countOf("berra is a fine goose.", "goose", true), equalTo(1));
			assertThat(StringUtil.countOf("berra is a fine goose.", "goOsE", true), equalTo(0));
			assertThat(StringUtil.countOf("berra is a fine goose.", "a", false), equalTo(2));
			assertThat(StringUtil.countOf("berra is a fine goose.", "A", true), equalTo(0));
		}
		
		[Test]
		public function truncateTest():void
		{
			assertThat(StringUtil.truncate("berra is a fine goose.", 10), equalTo("berra is a..."));
			assertThat(StringUtil.truncate("berra is a fine goose.", 10, "O_o"), equalTo("berra is aO_o"));
			assertThat(StringUtil.truncate("berra is a fine goose.", 90), equalTo("berra is a fine goose."));
		}
		
		[Test]
		public function countWordsTest():void
		{
			assertThat(StringUtil.wordCount("berra is a fine goose."), equalTo(5));
			assertThat(StringUtil.wordCount("berra i$ a| fine g0ose."), equalTo(5));
			assertThat(StringUtil.wordCount("berra!"), equalTo(1));
		}
		
		[Test]
		public function trimmingTest():void
		{
			assertThat(StringUtil.trim("   berra is a fine goose. "), equalTo("berra is a fine goose."));
			assertThat(StringUtil.trim("berra is a fine goose. "), equalTo("berra is a fine goose."));
			assertThat(StringUtil.trim("      berra is a fine goose."), equalTo("berra is a fine goose."));
			
			assertThat(StringUtil.trimLeft("      berra is a fine goose."), equalTo("berra is a fine goose."));
			assertThat(StringUtil.trimLeft("berra is a fine goose.   "), equalTo("berra is a fine goose.   "));
			
			assertThat(StringUtil.trimRight("berra is a fine goose.        "), equalTo("berra is a fine goose."));
			assertThat(StringUtil.trimRight("  berra is a fine goose."), equalTo("  berra is a fine goose."));
		}
		
		[Test]
		public function swapCaseTest():void
		{
			assertThat(StringUtil.swapCase("berra is a fine goose."), equalTo("BERRA IS A FINE GOOSE."));
			assertThat(StringUtil.swapCase("BERRA is a fine GOOSE."), equalTo("berra IS A FINE goose."));
		}
		
		[Test]
		public function stripTagsTest():void
		{
			assertThat(StringUtil.stripTags("<berra id=\"kalle\">Tag are gone!</berra>"), equalTo("Tag are gone!"));
			
			assertThat(StringUtil.stripTags("<berra id=\"kalle\">>Tag are gone!><</berra>"), equalTo(">Tag are gone!>"));
		}
	}
}
