package com.burninghead.swarmdemo.view
{
	import com.burninghead.birf.messaging.IMessageHandler;
	import com.burninghead.birf.model.IModel;
	import com.burninghead.birf.states.IStateMachine;
	import com.burninghead.birf.view.IView;
	import com.burninghead.birf.view.bitmaprenderer.BitmapRendererView;
	import com.burninghead.swarmdemo.states.SwarmViewState;
	/**
	 * @author tomas.augustinovic
	 */
	public class SwarmDemoView extends BitmapRendererView implements IView
	{
		public function SwarmDemoView(model:IModel, msgHandler:IMessageHandler)
		{
			super(model, msgHandler);
		}
		
		override public function initViewStates():void
		{
			var stateMachine:IStateMachine = _injector.getInstance(IStateMachine);
			
			//	Register all our states.
			stateMachine.registerState("swarm", new SwarmViewState());
			
			//	Change to initial state.
			stateMachine.changeState("swarm");
		}
		
		override protected function getStageColor():uint
		{
			return 0xffffff;
		}
	}
}
