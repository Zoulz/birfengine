package com.burninghead.birfexample
{
	import com.burninghead.birf.BaseGame;
	import com.burninghead.birfexample.controller.SphereChangeColorCmd;
	import com.burninghead.birfexample.model.ISphereModel;
	import com.burninghead.birfexample.model.SphereModel;
	import com.burninghead.birfexample.view.BirfExampleView;
	import com.burninghead.birfexample.view.SphereMediator;
	/**
	 * @author Zoulz
	 */
	[SWF(backgroundColor="#FFFFFF", frameRate="60", width="300", height="300")]
	public class BirfExample extends BaseGame
	{
		override protected function injectView():Class
		{
			return BirfExampleView;
		}
		
		override protected function registerCommands():void
		{
			controller.registerCommand(SphereChangeColorCmd);
		}
		
		override protected function registerMediators():void
		{
			view.registerMediator(SphereMediator);
		}
		
		override protected function registerModelParts():void
		{
			model.registerProxy(ISphereModel, SphereModel);
		}
	}
}
