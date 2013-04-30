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
		protected static const SPHERE_STATE:String = "sphere";
		protected static const SQUARE_STATE:String = "square";

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

			stateMachine.registerXml(
				<states>
					<state id="{SPHERE_STATE}" type="com.burninghead.simplesphere.states.SphereViewState" />
					<state id="{SQUARE_STATE}" type="com.burninghead.simplesphere.states.SphereViewState" />
					<transition id="sphere_to_square" from="{SPHERE_STATE}" to="{SQUARE_STATE}" />
					<transition id="square_to_sphere" from="{SQUARE_STATE}" to="{SPHERE_STATE}" />
				</states>);
			
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
