package com.burninghead.birf.view.starling
{
	import com.burninghead.birf.messaging.IMessageHandler;
	import com.burninghead.birf.model.IModel;
	import com.burninghead.birf.view.IView;
	import com.burninghead.birf.view.BaseView;
	/**
	 * @author tomas.augustinovic
	 */
	public class StarlingView extends BaseView implements IView
	{
		public function StarlingView(model:IModel, msgHandler:IMessageHandler)
		{
			super(model, msgHandler);
		}
	}
}
