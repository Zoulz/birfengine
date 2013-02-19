package com.burninghead.birf.utils
{
	import flash.display.DisplayObject;

	/**
	 * Factory class for display objects. This can be used to reduce
	 * the creation and destruction of display objects.
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
