package com.burninghead.utils
{
	import flash.display.DisplayObject;

	/**
	 * Factory class for display objects. This can be used to reduce the amount of object creation/destruction, which gives the garbage
	 * collector less to do (which is always a good thing).
	 * 
	 * <pre>
	 * -----------------------------------------------------------------------------------------------------------------------------------------
	 * 
	 * Copyright (c) Tomas Augustinovic 2012-2013
	 *
	 * Licence Agreement (The MIT License)
	 *
	 * Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files
	 * (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge,
	 * publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do
	 * so, subject to the following conditions:
	 *
	 * The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
	 *
	 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
	 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE
	 * FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
	 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
	 * 
	 * -----------------------------------------------------------------------------------------------------------------------------------------
	 * </pre>
	 * 
	 * @author tomas.augustinovic
	 */
	public class DisplayObjectFactory
	{
		private var _doType:Class;
		private var _usedPool:Vector.<DisplayObject>;
		private var _unusedPool:Vector.<DisplayObject>;
		
		public function DisplayObjectFactory(displayObjectType:Class)
		{
			_doType = displayObjectType;
			_usedPool = new Vector.<DisplayObject>();
			_unusedPool = new Vector.<DisplayObject>();
		}
		
		public function create():DisplayObject
		{
			var obj:DisplayObject;
			
			if (_unusedPool.length > 0)
			{
				obj = _unusedPool.pop();
			}
			else
			{
				obj = new _doType();
			}
			
			_usedPool.push(obj);
			
			return obj;
		}
		
		public function destroy(obj:DisplayObject):void
		{
			var idx:int = _usedPool.indexOf(obj);
			
			if (idx >= 0)
			{
				_usedPool.splice(idx, 1);
				_unusedPool.push(obj);
			}
		}
	}
}
