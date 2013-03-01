package com.burninghead.swarmdemo
{
	import com.burninghead.swarmdemo.view.mediators.SwarmMediator;
	import com.burninghead.birf.BaseCore;
	import com.burninghead.birf.view.IView;
	import com.burninghead.swarmdemo.view.SwarmDemoView;
	/**
	 * @author tomas.augustinovic
	 */
	[SWF(backgroundColor="#FFFFFF", frameRate="60", width="400", height="300")]
	public class SwarmDemo extends BaseCore
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
		override public function registerCommands():void
		{
		}
		
		/**
		 * Register the mediators needed for this project.
		 */
		override public function registerMediators():void
		{
			view.registerMediator(SwarmMediator);
		}
		
		/**
		 * Register model parts needed for this project.
		 */
		override public function registerProxyModels():void
		{
		}
	}
}
