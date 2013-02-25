package com.burninghead.simplesphere.states
{
	import com.burninghead.birf.messaging.IMessageHandler;
	import com.burninghead.birf.messaging.messages.BaseMessage;
	import com.burninghead.birf.states.IState;
	import com.burninghead.birf.view.skinning.ISkinManager;
	import com.burninghead.extensions.controller.cmds.ConsoleFilterCategoryCmd;
	import com.burninghead.extensions.view.displaylist.comps.console.AzureConsoleSkin;
	import com.burninghead.extensions.view.displaylist.comps.console.DisplayListConsoleView;
	import com.burninghead.extensions.view.displaylist.mediators.ConsoleMediator;
	import com.burninghead.extensions.view.displaylist.mediators.ConsoleMediatorMsgType;
	import com.burninghead.extensions.view.displaylist.states.IDisplayListViewState;
	import com.burninghead.extensions.view.displaylist.states.DisplayListViewState;
	import com.burninghead.simplesphere.controller.ConsoleChangeSkinCmd;
	import com.burninghead.simplesphere.view.comps.SphereView;
	import com.burninghead.simplesphere.view.mediators.SphereMediator;
	/**
	 * @author Zoulz
	 */
	public class SphereViewState extends DisplayListViewState implements IState, IDisplayListViewState
	{
		private var _console:DisplayListConsoleView;
		private var _sphereView:SphereView;
		private var _consoleMediator:ConsoleMediator;
		private var _sphereMediator:SphereMediator;
		
		[Inject] public var messageHandler:IMessageHandler;
		[Inject] public var skinManager:ISkinManager;
		
		/**
		 * Override code for entering this view state. Creates the
		 * sphere view component and registers it with it's corresponding
		 * mediator.
		 */
		override public function enter():void
		{
			//	Get references to mediators.
			_sphereMediator = view.getMediator(SphereMediator) as SphereMediator;
			_consoleMediator = view.getMediator(ConsoleMediator) as ConsoleMediator;
			
			//	Map commands for the console.
			messageHandler.send(new BaseMessage(ConsoleMediatorMsgType.MAP_COMMAND, this, { id: "filter", classDef: ConsoleFilterCategoryCmd }));
			messageHandler.send(new BaseMessage(ConsoleMediatorMsgType.MAP_COMMAND, this, { id: "changeskin", classDef: ConsoleChangeSkinCmd }));
			
			//	Register views with their respective mediators.
			_sphereMediator.registerView(_sphereView);
			_consoleMediator.registerView(_console);
			
			//	Apply console skin.
			skinManager.setSkin(new AzureConsoleSkin(), DisplayListConsoleView);
		}
		
		override protected function containerAdded():void
		{
			//	Create instance of console view.
			_console = new DisplayListConsoleView();
			container.addChild(_console);
			
			//	Register console with skin manager.
			skinManager.registerSkinnable(_console);
			
			//	Create the sphere view.
			_sphereView = new SphereView();
			_sphereView.x = 50;
			_sphereView.y = 50;
			container.addChild(_sphereView);
		}

		/**
		 * Exiting the view state. Dispose the mediator and remove the component
		 * from display list.
		 */
		override public function exit():void
		{
			_consoleMediator.dispose();
			container.removeChild(_console);
			
			_sphereMediator.dispose();
			container.removeChild(_sphereView);
		}
	}
}
