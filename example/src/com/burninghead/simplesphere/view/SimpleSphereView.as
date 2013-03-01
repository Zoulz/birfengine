package com.burninghead.simplesphere.view
{
	import com.burninghead.birf.messaging.IMessage;
	import com.burninghead.birf.messaging.IMessageHandler;
	import com.burninghead.birf.model.IModel;
	import com.burninghead.birf.states.IStateMachine;
	import com.burninghead.birf.view.IView;
	import com.burninghead.birf.view.skinning.BaseSkinManager;
	import com.burninghead.birf.view.skinning.ISkinManager;
	import com.burninghead.extensions.displaylist.DisplayListView;
	import com.burninghead.simplesphere.states.SphereViewState;

	/**
	 * @author Zoulz
	 */
	public class SimpleSphereView extends DisplayListView implements IView
	{
		/**
		 * Constructor.
		 */
		public function SimpleSphereView(model:IModel, msgHandler:IMessageHandler)
		{
			super(model, msgHandler);
		}
		
		/**
		 * Register the required view states and change to the initial
		 * state the app starts in.
		 */
		override public function initStateMachine():void
		{
			var stateMachine:IStateMachine = _injector.getInstance(IStateMachine);
			
			//	Register all our states.
			stateMachine.registerState("sphere", new SphereViewState());
			
			//	Change to initial state.
			stateMachine.changeState("sphere");
		}
		
		/**
		 * Inject singleton of skin manager.
		 */
		override protected function injectAdditionalDependencies():void
		{
			super.injectAdditionalDependencies();
			
			//	Inject instance of skin manager.
			_injector.map(ISkinManager).toSingleton(BaseSkinManager);
		}
		
		/**
		 * Handle messages about changing skins.
		 */
		override protected function onMessageReceived(msg:IMessage):void
		{
			var pl:Object = msg.payload;
			
			switch (msg.type)
			{
				case SimpleSphereViewMsgType.CHANGE_SKIN:
				{
					var skinMgr:ISkinManager = _injector.getInstance(ISkinManager);
					skinMgr.setSkin(pl.skin, pl.applyTo);
					break;
				}
			}
		}
	}
}
