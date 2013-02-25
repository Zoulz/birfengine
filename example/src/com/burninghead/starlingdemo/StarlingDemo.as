package com.burninghead.starlingdemo
{
	import com.burninghead.birf.BaseGame;
	import com.burninghead.birf.view.IView;
	import com.burninghead.starlingdemo.view.StarlingDemoView;
	/**
	 * @author tomas.augustinovic
	 */
	[SWF(backgroundColor="#FFFFFF", frameRate="60", width="300", height="300")]
	public class StarlingDemo extends BaseGame
	{
		/**
		 * Injects the correct project specific view.
		 */
		override protected function createView():IView
		{
			return new StarlingDemoView(model, messageHandler);
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
		override protected function registerModelProxies():void
		{
		}
	}
}
