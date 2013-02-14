package com.burninghead.swarmdemo
{
	import com.burninghead.birf.BaseGame;
	import com.burninghead.birf.view.IView;
	import com.burninghead.swarmdemo.view.SwarmDemoView;
	/**
	 * @author tomas.augustinovic
	 */
	public class SwarmDemo extends BaseGame
	{
		/**
		 * Injects the correct project specific view.
		 */
		override protected function createView():IView
		{
			return new SwarmDemoView(model, messageHandler);
		}
		
		/**
		 * Overriden to register the commands needed for this
		 * project.
		 */
		override protected function registerCommands():void
		{
		}
		
		/**
		 * Register the mediators needed for this project.
		 */
		override protected function registerMediators():void
		{
		}
		
		/**
		 * Register model parts needed for this project.
		 */
		override protected function registerModelParts():void
		{
		}
	}
}
