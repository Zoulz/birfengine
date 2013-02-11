package com.burninghead.simplesphere
{
	import com.burninghead.birf.controller.cmds.ConsoleFilterCategoryCmd;
	import com.burninghead.birf.BaseGame;
	import com.burninghead.birf.view.IView;
	import com.burninghead.birf.view.stage2d.mediators.ConsoleMediator;
	import com.burninghead.simplesphere.controller.SphereChangeColorCmd;
	import com.burninghead.simplesphere.model.ISphereModel;
	import com.burninghead.simplesphere.model.SphereModel;
	import com.burninghead.simplesphere.view.SimpleSphereView;
	import com.burninghead.simplesphere.view.mediators.SphereMediator;
	/**
	 * A simple example featuring a clickable sphere view component that
	 * changes color and displays how many clicks it has received.
	 * 
	 * @author Zoulz
	 */
	[SWF(backgroundColor="#FFFFFF", frameRate="60", width="300", height="300")]
	public class SimpleSphere extends BaseGame
	{
		/**
		 * Injects the correct project specific view.
		 */
		override protected function createView():IView
		{
			return new SimpleSphereView(model, messageHandler);
		}
		
		/**
		 * Overriden to register the commands needed for this
		 * project.
		 */
		override protected function registerCommands():void
		{
			controller.registerCommand(SphereChangeColorCmd);
			controller.registerCommand(ConsoleFilterCategoryCmd);
		}
		
		/**
		 * Register the mediators needed for this project.
		 */
		override protected function registerMediators():void
		{
			view.registerMediator(SphereMediator);
			view.registerMediator(ConsoleMediator);
		}
		
		/**
		 * Register model parts needed for this project.
		 */
		override protected function registerModelParts():void
		{
			model.registerProxy(ISphereModel, SphereModel);
		}
	}
}
