package com.burninghead.birf.view.bitmaprenderer.renderables
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	/**
	 * @author tomas.augustinovic
	 */
	public class DisplayObject
	{
		protected var _position:Point;
		protected var _scale:Point;
		protected var _renderData:BitmapData;
		
		private var _rotation:Number;
		private var _width:uint;
		private var _height:uint;
		private var _alpha:Number;
		private var _anchor:Point;
		
		public function DisplayObject()
		{
			_position = new Point(0, 0);
			_scale = new Point(1, 1);
			_renderData = null;
		}
		
		public function get x():int
		{
			return _position.x;
		}
		
		public function get y():int
		{
			return _position.y;
		}

		public function set x(value:int):void
		{
			_position.x = value;
		}
		
		public function set y(value:int):void
		{
			_position.y = value;
		}

		public function get rotation():Number
		{
			return _rotation;
		}

		public function set rotation(value:Number):void
		{
			_rotation = value;
		}

		public function get width():uint
		{
			return _width;
		}

		public function set width(width:uint):void
		{
			_width = width;
		}

		public function get height():uint
		{
			return _height;
		}

		public function set height(height:uint):void
		{
			_height = height;
		}

		public function get alpha():Number
		{
			return _alpha;
		}

		public function set alpha(alpha:Number):void
		{
			_alpha = alpha;
		}
		
		public function set renderData(value:BitmapData):void
		{
			_renderData = value;
		}

		public function get anchorPoint():Point
		{
			return _anchor;
		}

		public function set anchorPoint(value:Point):void
		{
			_anchor = value;
		}
	}
}
