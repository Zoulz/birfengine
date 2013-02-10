package com.burninghead.birfexample.states
{
	import com.burninghead.birfexample.view.SphereMediator;
	import com.burninghead.birfexample.view.SphereView;
	import com.burninghead.birf.states.IState;
	import com.burninghead.birf.view.stage2d.states.IStage2DViewState;
	import com.burninghead.birf.view.stage2d.states.Stage2DViewState;
	/**
	 * @author Zoulz
	 */
	public class SphereViewState extends Stage2DViewState implements IState, IStage2DViewState
	{
		private var _sphereView:SphereView;
		private var _sphereMediator:SphereMediator;
		
		public function SphereViewState()
		{
		}
		
		override protected function init():void
		{
		}
		
		override public function enter():void
		{
			_sphereView = new SphereView();
			_sphereView.x = 50;
			_sphereView.y = 50;
			container.addChild(_sphereView);
			
			_sphereMediator = view.getMediator(SphereMediator) as SphereMediator;
			_sphereMediator.registerView(_sphereView);
		}

		override public function exit():void
		{
			_sphereMediator.dispose();
			container.removeChild(_sphereView);
		}
	}
}
