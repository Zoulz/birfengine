package com.burninghead.starlingdemo
{
	import com.burninghead.birf.BaseCore;
	import com.burninghead.birf.view.IView;
	import com.burninghead.starlingdemo.view.StarlingDemoView;
	/**
	 * @author tomas.augustinovic
	 */
	[SWF(backgroundColor="#FFFFFF", frameRate="60", width="300", height="300")]
	public class StarlingDemo extends BaseCore
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
		override public function registerCommands():void
		{
		}
		
		/**
		 * Register the mediators needed for this project.
		 */
		override public function registerMediators():void
		{

		}
		
		/**
		 * Register model parts needed for this project.
		 */
		override public function registerProxyModels():void
		{
		}
	}
}
