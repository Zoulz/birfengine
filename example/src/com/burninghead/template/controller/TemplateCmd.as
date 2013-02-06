package com.burninghead.template.controller
{
	import com.burninghead.birf.controller.BaseCommand;
	import com.burninghead.birf.controller.ICommand;
	import com.burninghead.birf.model.IModel;
	import com.burninghead.birf.view.IView;
	import com.burninghead.template.MessageType;
	import com.burninghead.template.model.ITemplateModelPart;
	/**
	 * @author BigZoulz
	 */
	public class TemplateCmd extends BaseCommand implements ICommand
	{
		[Inject] public var view:IView;
		[Inject] public var model:IModel;
		
		public function execute(params:*):void
		{
			var part:ITemplateModelPart = model.getModelPart(ITemplateModelPart) as ITemplateModelPart;
			
			if (part.numClicks < 20)
			{
				_messenger.sendMessage(MessageType.INCREASE_CLICK_COUNT);
			}
		}
	}
}
