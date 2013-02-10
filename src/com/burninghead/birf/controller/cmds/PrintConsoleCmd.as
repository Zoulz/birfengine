package com.burninghead.birf.controller.cmds
{
	import com.burninghead.birf.controller.BaseCommand;
	import com.burninghead.birf.controller.ICommand;
	import com.burninghead.birf.view.IView;
	/**
	 * @author BigZoulz
	 */
	public class PrintConsoleCmd extends BaseCommand implements ICommand
	{
		[Inject] public var view:IView;
		
		public function execute(params:*):void
		{
			if (params.category == null)
			{
				params.category = "default";
			}
			if (params.color == null)
			{
				params.color = 0xffff00;
			}
			
			//view.console.println(params.msg, params.category, params.color);
		}
	}
}
