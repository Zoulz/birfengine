package com.burninghead.simplesphere.view
{
	import com.burninghead.birf.view.stage2d.Stage2DSkinManager;
	import com.burninghead.birf.view.skinning.ISkinManager;
	import com.burninghead.birf.messaging.IMessageHandler;
	import com.burninghead.birf.model.IModel;
	import com.burninghead.birf.view.IView;
	import com.burninghead.birf.view.stage2d.Stage2DView;
	import com.burninghead.simplesphere.states.SphereViewState;

	/**
	 * @author Zoulz
	 */
	public class SimpleSphereView extends Stage2DView implements IView
	{
		public function SimpleSphereView(model:IModel, msgHandler:IMessageHandler)
		{
			super(model, msgHandler);
		}
		
		/**
		 * Register the required view states and change to the initial
		 * state the app starts in.
		 */
		override protected function initViewStates():void
		{
			//	Register all our states.
			_stateMachine.registerState("sphere", new SphereViewState());
			
			//	Change to initial state.
			_stateMachine.changeState("sphere");
		}
		
		override protected function injectDependencies():void
		{
			super.injectDependencies();
			
			//	Inject instance of skin manager.
			_injector.mapSingletonOf(ISkinManager, Stage2DSkinManager);
		}
	}
}
