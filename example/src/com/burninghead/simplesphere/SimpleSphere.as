package com.burninghead.simplesphere
{
	import com.burninghead.extensions.utils.logger.ConsoleLoggerOutput;
	import com.burninghead.birf.BaseGame;
	import com.burninghead.birf.view.IView;
	import com.burninghead.extensions.controller.cmds.ConsoleFilterCategoryCmd;
	import com.burninghead.extensions.view.displaylist.mediators.ConsoleMediator;
	import com.burninghead.simplesphere.controller.ConsoleChangeSkinCmd;
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
	[SWF(backgroundColor="#FFFFFF", frameRate="60", width="640", height="300")]
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
			controller.registerCommand(ConsoleChangeSkinCmd);
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
		override protected function registerModelProxies():void
		{
			model.registerProxy(ISphereModel, SphereModel);
		}
		
		/**
		 * Register additional logger outputs.
		 */
		override protected function registerLoggerOutput():void
		{
			super.registerLoggerOutput();
			
			logger.registerOutput(new ConsoleLoggerOutput(messageHandler));
		}
	}
}
