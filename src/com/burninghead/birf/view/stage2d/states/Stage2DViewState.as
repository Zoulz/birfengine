package com.burninghead.birf.view.stage2d.states
{
	import com.burninghead.birf.states.BaseState;
	import com.burninghead.birf.states.IState;
	import com.burninghead.birf.view.IView;

	import flash.display.Sprite;


	/**
	 * @author tomas.augustinovic
	 */
	public class Stage2DViewState extends BaseState implements IState, IStage2DViewState
	{
		[Inject] public var view:IView;
		
		private var _container:Sprite;
		
		public function Stage2DViewState()
		{
			super();
			
			_container = new Sprite();
		}
		
		[PostConstruct]
		public function postConstruct():void
		{
			init();
		}
		
		protected function init():void
		{
		}
		
		public function get container():Sprite
		{
			return _container;
		}
	}
}
