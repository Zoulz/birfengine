package com.burninghead.swarmdemo.view
{
	import com.burninghead.birf.messaging.IMessageHandler;
	import com.burninghead.birf.model.IModel;
	import com.burninghead.birf.view.IView;
	import com.burninghead.birf.view.bitmaprenderer.BitmapRendererView;
	/**
	 * @author tomas.augustinovic
	 */
	public class SwarmDemoView extends BitmapRendererView implements IView
	{
		public function SwarmDemoView(model:IModel, msgHandler:IMessageHandler)
		{
			super(model, msgHandler);
		}
		
		override protected function initViewStates():void
		{
			//	Register all our states.
			//_stateMachine.registerState("sphere", new SphereViewState());
			
			//	Change to initial state.
			//_stateMachine.changeState("sphere");
		}
	}
}
