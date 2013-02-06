package com.burninghead.template
{
	import com.burninghead.birf.BaseGame;
	import com.burninghead.birf.utils.list.List;
	import com.burninghead.birf.utils.list.items.PauseItem;
	import com.burninghead.birf.utils.list.items.TweenItem;
	import com.burninghead.birf.view.stage2d.Stage2DView;
	import com.burninghead.birf.view.states.ViewStateDefinition;
	import com.burninghead.template.controller.TemplateCmd;
	import com.burninghead.template.model.ITemplateModelPart;
	import com.burninghead.template.model.TemplateModelPart;
	import com.burninghead.template.view.SphereMediator;
	import com.burninghead.template.view.states.TemplateViewState;
	import com.greensock.TweenLite;
	/**
	 * @author tomas.augustinovic
	 */
	[SWF(backgroundColor="#FFFFFF", frameRate="60", width="300", height="300")]
	public class TemplateGame extends BaseGame
	{
		override protected function injectView():Class
		{
			return Stage2DView;
		}
		
		override protected function registerViewStates():void
		{
			var states:Vector.<ViewStateDefinition> = new Vector.<ViewStateDefinition>();
			states.push(view.createViewStateDefinition(0, TemplateViewState));

			var test:List = new List();
			test.addItem(new TweenItem(TweenLite.from(this.stage, 1, { color: 0x000000 })));
			test.addItem(new PauseItem(2500));
			test.addItem(new TweenItem(TweenLite.to(this.stage, 1, { color: 0x000000 })));
			test.run();
			
			view.stateHandler.registerViewStates(states);
		}
		
		override protected function registerCommands():void
		{
			controller.registerCommand(TemplateCmd);
		}
		
		override protected function registerMediators():void
		{
			view.registerMediator(SphereMediator);
		}
		
		override protected function registerModelParts():void
		{
			model.registerProxy(ITemplateModelPart, TemplateModelPart);
		}
	}
}
