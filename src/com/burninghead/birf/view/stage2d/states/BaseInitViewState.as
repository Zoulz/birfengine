package com.burninghead.birf.view.stage2d.states
{
	import com.burninghead.birf.audio.ISoundManager;
	import com.burninghead.birf.model.IModel;
	import com.burninghead.birf.model.settings.ISettings;
	import com.burninghead.birf.utils.list.ConcurrentList;
	import com.burninghead.birf.utils.list.IList;
	import com.burninghead.birf.utils.list.List;
	import com.burninghead.birf.utils.list.items.NestedListItem;
	import com.burninghead.birf.view.states.IViewState;

	/**
	 * @author BigZoulz
	 */
	public class BaseInitViewState extends Stage2DViewState implements IViewState, IStage2DViewState
	{
		[Inject] public var model:IModel;
		[Inject] public var soundManager:ISoundManager;

		private var _settings:ISettings;
		
		protected var _transitionTo:String = "";
		
		override public function enter(params:Object):void
		{
			super.enter(params);
			
			_settings = model.getModelPart(ISettings) as ISettings;
			
			//	Create list for this view state.
			var enterList:IList = new ConcurrentList();
			enterList.complete.addOnce(onEnterListComplete);
			
			/***********************************************************************
			 * ADDITIONAL ITEMS
			 ***********************************************************************/
			enterList.addItem(new NestedListItem(createAdditionalListItems()));
			
			//	Run the list.
			enterList.run();
		}
		
		protected function createAdditionalListItems():IList
		{
			return new List();
		}
		
		private function onEnterListComplete():void
		{
		}
		
		override public function exit():void
		{
			super.exit();
		}
	}
}
