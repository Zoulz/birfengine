package com.burninghead.birf.view.stage2d.states
{
	import com.burninghead.birf.view.IView;
	import com.burninghead.birf.view.states.BaseViewState;
	import com.burninghead.birf.view.states.IViewState;

	import flash.display.Sprite;


	/**
	 * @author tomas.augustinovic
	 */
	public class Stage2DViewState extends BaseViewState implements IViewState
	{
		[Inject] public var view:IView;
		
		private var _container:Sprite;
		
		public function Stage2DViewState()
		{
			super();
			
			_container = new Sprite();
		}
		
		public function get container():Sprite
		{
			return _container;
		}
		
		public function enter(params:Object):void
		{
			view.console.println("ENTER > " + this, "viewstate", 0xffaaee);
		}
		
		override public function exit():void
		{
			super.exit();
			
			view.console.println("EXIT > " + this, "viewstate", 0xffaaee);
		}
	}
}
