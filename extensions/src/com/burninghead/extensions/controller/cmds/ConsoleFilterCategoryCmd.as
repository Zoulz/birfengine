package com.burninghead.extensions.controller.cmds
{
	import com.burninghead.birf.controller.BaseCommand;
	import com.burninghead.birf.controller.ICommand;
	import com.burninghead.extensions.view.displaylist.mediators.ConsoleMediatorMsgType;
	/**
	 * @author tomas.augustinovic
	 */
	public class ConsoleFilterCategoryCmd extends BaseCommand implements ICommand
	{
		public function execute(params:*):void
		{
			//	Split categories into a array.
			var cats:Vector.<String> = Vector.<String>(String(Object(params).params).split(","));
			
			//	Pass message to change filters.
			_messenger.sendMessage(ConsoleMediatorMsgType.SET_CATEGORY_FILTER, { filters: cats });
		}
	}
}
