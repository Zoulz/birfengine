package com.burninghead.starlingdemo.view
{
	import com.burninghead.birf.messaging.IMessageHandler;
	import com.burninghead.birf.model.IModel;
	import com.burninghead.birf.view.IView;
	import com.burninghead.birf.view.starling.StarlingView;
	/**
	 * @author tomas.augustinovic
	 */
	public class StarlingDemoView extends StarlingView implements IView
	{
		public function StarlingDemoView(model:IModel, msgHandler:IMessageHandler)
		{
			super(model, msgHandler);
		}
		
		override protected function injectStarlingEntryClass():Class
		{
			return StarlingDemoEntryPoint;
		}
		
		override public function initViewStates():void
		{
			
		}
	}
}
