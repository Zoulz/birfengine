package com.burninghead.utils
{
	/**
	 * Collection of string utility functions.
	 * 
	 * @author tomas.augustinovic
	 */
	public final class StringUtil
	{
		/**
		 * Resolves the parameter placeholders {0} etc inside the given string.
		 * @param s The parameterized string.
		 * @param params Array of parameters to replace the placeholders with.
		 * @return String
		 */
		public static function resolveParameterizedString(s:String, ...params):String
		{
			if (s != null && params.length > 0)
			{
				var len:uint = params.length;
				for (var i:int = 0; i < len; ++i)
				{
					var r:RegExp = new RegExp("\\{" + i + "\\}", "gi");
					s = s.replace(r, params[i]);
				}
			}
			
			return s;
		}
		
		/**
		 * Convert string to boolean.
		 * @param s string to convert.
		 * @return Boolean
		 */
		public static function toBoolean(s:String):Boolean
		{
			return s.toLowerCase() !== "false";
		}
		
		/**
		 * Formats seconds as a string which converts into minutes and hours (00:00:00)
		 * @param seconds Amount of seconds to format.
		 * @param withMinutes If string should contain minutes.
		 * @param withHours If string should contain hours.
		 * @return String
		 */
		public static function formatSeconds(seconds:int, withMinutes:Boolean = true, withHours:Boolean = false):String
		{
			var secs:Number = seconds % 60;
			var mins:Number = Math.floor(seconds / 60) % 60;
			var hour:Number = Math.floor(seconds / (60 * 60)) % 24;
			var secStr:String = secs < 10 ? ("0" + secs) : secs.toString();
			var minStr:String = mins < 10 ? ("0" + mins) : mins.toString();
			var hourStr:String = hour < 10 ? ("0" + hour) : hour.toString();
			var ret:String = "";
			
			if (withMinutes)
			{
				ret = minStr + ":" + secStr;
				
				if (withHours)
				{
					ret = hourStr + ":" + ret;
				}
			}
			else
			{
				ret = seconds.toString();
			}
			
			return ret;
		}
		
		/**
		 * Pads a string with the specified character or substring.
		 * 
		 * @param s The string to pad.
		 * @param char The character or string to pad with.
		 * @param len How many times to pad the string.
		 * @return
		 */
		public static function padBeforeString(s:String, len:int, char:String = " "):String
		{
			if(len > 0)
			{
				for(var i:int = 0; i < len; i++)
				{
					 s = char + s;
				}
			}

			return s;
		}
		
		/**
		 * Pads a string with the specified character or substring.
		 * 
		 * @param s The string to pad.
		 * @param char The character or string to pad with.
		 * @param len How many times to pad the string.
		 * @return
		 */
		public static function padAfterString(s:String, len:int, char:String = " "):String
		{
			if(len > 0)
			{
				for(var i:int = 0; i < len; i++)
				{
					 s += char;
				}
			}

			return s;
		}
		
		/**
		 * Extracts the actual class name out of a full class name e.g. com.warden.utils::TextUtils.
		 * @param s Full class name string.
		 * @return String
		 */
		public static function extractClassName(s:String):String
		{
			return afterLast(s, "::");
		}
		
		/**
		 * Checks if the supplied string is a valid e-mail address.
		 */
		public static function isValidEmail(emailAddress:String):Boolean
		{
			var reg:RegExp = /^[A-Za-z0-9](([_\.\-]?[a-zA-Z0-9]+)+)@(([A-Za-z0-9]+)(([\.\-]?[a-zA-Z0-9]+)*)){2,}\.([A-Za-z]){2,4}+$/g;
			
			return reg.test(emailAddress);
		}
		
		/**
		 * Determines if the supplied string is a valid URL.
		 * 
		 * @param url Url to check.
		 * @return Boolean
		 */
		public static function isValidURL(url:String):Boolean
		{
			var regexp:RegExp = /(ftp|http|https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/;
	
			return regexp.test(url);
		}
		
		/**
		 * Return true is the supplied string is empty.
		 * 
		 * @param s String to check.
		 * @return Boolean
		 */
		public static function isEmpty(s:String):Boolean
		{
			if (s != null && s.length > 0)
			{
				return false;
			}
			
			return true;
		}
		
		/**
		 * Check if the string is composed of alpha numeric characters.
		 * 
		 * @param s String to check.
		 * @return Boolean
		 */
		public static function isAlphaNumeric(s:String):Boolean
		{
			var reg:RegExp = new RegExp(/[^a-zA-Z 0-9]+/g); ///^[a-zA-Z\s0-9]+$/;
			
			return reg.test(s);
		}
		
		/**
		 * Returns everything after the first occurrence of the provided character in the string.
		 * @param s String to process.
		 * @param find String to use while searching.
		 * @return String
		 */
		public static function afterFirst(s:String, find:String):String
		{
			if (s == null)
			{
				return "";
			}
			
			var idx:int = s.indexOf(find);
			if (idx == -1)
			{
				return "";
			}
			
			idx += find.length;
			
			return s.substr(idx);
		}
		
		/**
		 * Returns everything after the last occurence of the provided character in string.
		 * @param s String to process.
		 * @param find String to use while searching.
		 * @return String
		 */
		public static function afterLast(s:String, find:String):String
		{
			if (s == null)
			{
				return "";
			}
			
			var idx:int = s.lastIndexOf(find);
			
			if (idx == -1)
			{
				return "";
			}
			
			idx += find.length;
			
			return s.substr(idx);
		}
		
		/**
		 * Returns everything before the first occurrence of the provided character in the string.
		 * @param s String to process.
		 * @param find String to use while searching.
		 * @return String
		 */
		public static function beforeFirst(s:String, find:String):String
		{
			if (s == null)
			{
				return "";
			}
			
			var idx:int = s.indexOf(find);
			
        	if (idx == -1)
			{
				return "";
			}
			
        	return s.substr(0, idx);
		}
		
		/**
		 * Returns everything before the last occurrence of the provided character in the string.
		 * @param s String to process.
		 * @param find String to use while searching.
		 * @return String
		 */
		public static function beforeLast(s:String, find:String):String
		{
			if (s == null)
			{
				return "";
			}
			
			var idx:int = s.lastIndexOf(find);
			
        	if (idx == -1)
			{
				return "";
			}
			
        	return s.substr(0, idx);
		}
		
		/**
		 * Determines whether the specified string begins with the specified prefix.
		 * @param s String to analyse.
		 * @param begin String to search for.
		 * @return True if the supplied string begins with the search string.
		 */
		public static function beginsWith(s:String, begin:String):Boolean
		{
			if (s == null)
			{
				return false;
			}
			
			return s.indexOf(begin) == 0;
		}
		
		/**
		 * Returns everything after the first occurance of start and before
		 * the first occurrence of end in the string.
		 * @param s String to analyse.
		 * @param start Start string to use.
		 * @param end End string to use.
		 * @return String
		 */
		public static function between(s:String, start:String, end:String):String
		{
			var str:String = "";
			
			if (s == null)
			{
				return str;
			}
			
			var startIdx:int = s.indexOf(start);
			
			if (startIdx != -1)
			{
				startIdx += start.length; // RM: should we support multiple chars? (or ++startIdx);
				var endIdx:int = s.indexOf(end, startIdx);
				if (endIdx != -1)
				{
					str = s.substr(startIdx, endIdx - startIdx);
				}
			}
			
			return str;
		}
		
		/**
		 * Utility method that intelligently breaks up your string, allowing you to create blocks
		 * of readable text. This method returns you the closest possible match to the delim
		 * paramater, while keeping the text length within the len paramter.
		 * If a match can't be found in your specified length an  '...' is added to that block,
		 * and the blocking continues untill all the text is broken apart.
		 * @param s String to analyse.
		 * @param len Maximum length of each line in the block.
		 * @param delim Delimiter used in string to mark a linebreak.
		 * @return Array of strings.
		 */
		public static function block(s:String, len:uint, delim:String = "."):Array
		{
			var arr:Array = new Array();
			
			if (s == null || !contains(s, delim))
			{
				return arr;
			}
			
			var chrIndex:uint = 0;
			var strLen:uint = s.length;
			var replPatt:RegExp = new RegExp("[^" + escapePatternInternal(delim) + "]+$");
			
			while (chrIndex <  strLen)
			{
				var subString:String = s.substr(chrIndex, len);
				if (!contains(subString, delim))
				{
					arr.push(truncate(subString, subString.length));
					chrIndex += subString.length;
				}
				subString = subString.replace(replPatt, '');
				arr.push(subString);
				chrIndex += subString.length;
			}
			
			return arr;
		}
		
		/**
		 * Capitallizes the first word in a string or all words.
		 * @param s String to capitalize.
		 * @param allWords True if all words in the string should be capitalized.
		 * @return String
		 */
		public static function capitalize(s:String, allWords:Boolean):String
		{
			var str:String = trimLeft(s);

			if (allWords)
			{
				return str.replace(/^.|\b./g, upperCaseInternal);
			}
			else
			{
				return str.replace(/(^\w)/, upperCaseInternal);
			}
		}
		
		/**
		 * Determines whether the specified string contains any instances of find parameter.
		 * 
		 * @param s String to check.
		 * @param find The string to look for.
		 * @return Boolean
		 */
		public static function contains(s:String, find:String):Boolean
		{
			if (s == null)
			{
				return false;
			}
			
			return s.indexOf(find) != -1;
		}
		
		/**
		 * Determines the number of times a character or sub-string appears within the string.
		 * @param s String to analyse.
		 * @param find Substring to find.
		 * @param caseSensitive True if the search should be case-sensitive.
		 * @return Number of times the substring was found.
		 */
		public static function countOf(s:String, find:String, caseSensitive:Boolean = true):uint
		{
			if (s == null)
			{
				return 0;
			}
			
			var char:String = escapePatternInternal(find);
			var flags:String = (!caseSensitive) ? 'ig' : 'g';
			
			return s.match(new RegExp(char, flags)).length;
		}
		
		/**
		 * Levenshtein distance is a measure of the similarity between two strings,
		 * The distance is the number of deletions, insertions, or substitutions required to
		 * transform source into target.
		 * 
		 * @param source The string to check.
		 * @param target The string to compare against.
		 * @return Result as uint
		 */
		public static function editDistance(source:String, target:String):uint
		{
			var i:uint;

			if (source == null)
			{
				source = "";
			}
			if (target == null)
			{
				target = "";
			}

			if (source == target)
			{
				return 0;
			}

			var d:Array = new Array();
			var cost:uint;
			var n:uint = source.length;
			var m:uint = target.length;
			var j:uint;

			if (n == 0)
			{
				return m;
			}
			if (m == 0)
			{
				return n;
			}

			for (i = 0; i <= n; i++)
			{
				d[i] = new Array();
			}
			for (i = 0; i <= n; i++)
			{
				d[i][0] = i;
			}
			for (j = 0; j <= m; j++)
			{
				d[0][j] = j;
			}

			for (i = 1; i <= n; i++)
			{
				var s_i:String = source.charAt(i - 1);
				for (j = 1; j <= m; j++)
				{
					var t_j:String = target.charAt(j - 1);

					if (s_i == t_j)
					{
						cost = 0;
					}
					else
					{
						cost = 1;
					}

					d[i][j] = minimumInternal(d[i - 1][j] + 1, d[i][j - 1] + 1, d[i - 1][j - 1] + cost);
				}
			}
			return d[n][m];
		}
		
		/**
		 * Returns a string truncated to a specified length with optional suffix.
		 */
		public static function truncate(s:String, len:uint, suffix:String = "..."):String
		{
			if (s == null)
			{
				return "";
			}
			
			//len -= suffix.length;
			var trunc:String = s;
			
			if (trunc.length > len)
			{
				trunc = trunc.substr(0, len);
				
				if (/[^\s]/.test(s.charAt(len)))
				{
					trunc = trimRight(trunc.replace(/\w+$|\s+$/, ''));
				}
				trunc += suffix;
			}

			return trunc;
		}
		
		/**
		 * Determins the number of words in a string.
		 */
		public static function wordCount(s:String):uint
		{
			if (s == null)
			{
				return 0;
			}
			
			return s.match(/\b\w+\b/g).length;
		}
		
		/**
		 * Removes whitespace from the front (left-side) of the specified string.
		 */
		public static function trimLeft(s:String):String
		{
			if (s == null)
			{
				return "";
			}
			
			return s.replace(/^\s+/, '');
		}
		
		/**
		 * Removes whitespace from the end (right-side) of the specified string.
		 */
		public static function trimRight(s:String):String
		{
			if (s == null)
			{
				return "";
			}
			
			return s.replace(/\s+$/, '');
		}
		
		/**
		 * Removes whitespace from the front and the end of the specified
		 * string.
		 */
		public static function trim(s:String):String
		{
			if (s == null)
			{
				return "";
			}
			
			return s.replace(/^\s+|\s+$/g, '');
		}
		
		/**
		 * Swaps the casing of a string.
		 */
		public static function swapCase(s:String):String
		{
			if (s == null)
			{
				return "";
			}
			
			var len:uint = s.length;
			var ret:String = "";
			for (var i:uint = 0; i < len; i++)
			{
				ret += swapCaseInternal(s.substr(i, 1));
			}
			
			return ret;
		}
		
		/**
		 * Determines the percentage of similiarity, based on editDistance.
		 */
		public static function similarity(source:String, target:String):Number
		{
			var ed:uint = editDistance(source, target);
			var maxLen:uint = Math.max(source.length, target.length);
			
			if (maxLen == 0)
			{
				return 100;
			}
			else
			{
				return (1 - ed / maxLen) * 100;
			}
		}
		
		/**
		 * Remove's all mark-language based tags from a string.
		 */
		public static function stripTags(s:String):String
		{
			if (s == null)
			{
				return "";
			}
			
			return s.replace(/<\/?[^>]+>/igm, '');
		}
		
		private static function upperCaseInternal(char:String, ...params):String
		{
			return char.toUpperCase();
		}

		private static function minimumInternal(a:uint, b:uint, c:uint):uint
		{
			return Math.min(a, Math.min(b, Math.min(c,a)));
		}
		
		private static function escapePatternInternal(pattern:String):String
		{
			// RM: might expose this one, I've used it a few times already.
			return pattern.replace(/(\]|\[|\{|\}|\(|\)|\*|\+|\?|\.|\\)/g, '\\$1');
		}
		
		private static function swapCaseInternal(char:String):String
		{
			var lowChar:String = char.toLowerCase();
			var upChar:String = char.toUpperCase();
			
			switch (char)
			{
				case lowChar:
				{
					return upChar;
				}
				case upChar:
				{
					return lowChar;
				}
				default:
				{
					return char;
				}
			}
		}
	}
}
