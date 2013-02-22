package com.burninghead.extensions.view.stage2d
{
	import com.burninghead.birf.view.BaseMediator;
	import com.burninghead.birf.view.IMediator;

	import flash.display.DisplayObject;

	/**
	 * @author tomas.augustinovic
	 */
	public class Stage2DMediator extends BaseMediator implements IMediator
	{
		private var _container:DisplayObject;
		
		protected function isViewRegistered():Boolean
		{
			return (displayObject != null);
		}
		
		override public function registerView(value:*):void
		{
			if (_container != null)
			{
				dispose();
			}
			
			_container = value;
		}

		override public function dispose():void
		{
			_container = null;
		}
		
		public function get displayObject():DisplayObject
		{
			return _container;
		}
	}
}
