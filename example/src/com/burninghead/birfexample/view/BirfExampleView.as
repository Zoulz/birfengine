package com.burninghead.birfexample.view
{
	import com.burninghead.birfexample.states.SphereViewState;
	import com.burninghead.birf.view.IView;
	import com.burninghead.birf.view.stage2d.Stage2DView;
	/**
	 * @author Zoulz
	 */
	public class BirfExampleView extends Stage2DView implements IView
	{
		public function BirfExampleView()
		{
			super();
		}
		
		override protected function initViewStates():void
		{
			_stateMachine.registerState("sphere", new SphereViewState());
			
			_stateMachine.changeState("sphere");
		}
	}
}
