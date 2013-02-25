package com.burninghead.extensions.view.displaylist
{
	import com.burninghead.birf.view.BaseMediator;
	import com.burninghead.birf.view.IMediator;

	import flash.display.DisplayObject;

	/**
	 * @author tomas.augustinovic
	 */
	public class DisplayListMediator extends BaseMediator implements IMediator
	{
		private var _container:DisplayObject;
		
		/**
		 * Determine if a view has been registered with this
		 * mediator.
		 * @return Boolean
		 */
		protected function isViewRegistered():Boolean
		{
			return (displayObject != null);
		}
		
		/**
		 * Overriden set reference to display object. Will dispose any old
		 * reference.
		 */
		override public function registerView(value:*):void
		{
			if (_container != null)
			{
				dispose();
			}
			
			_container = value;
		}

		/**
		 * Sets view reference to null.
		 */
		override public function dispose():void
		{
			_container = null;
		}
		
		/**
		 * Return the assigned display object view.
		 * @return DisplayObject
		 */
		public function get displayObject():DisplayObject
		{
			return _container;
		}
	}
}
