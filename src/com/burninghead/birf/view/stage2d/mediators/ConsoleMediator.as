package com.burninghead.birf.view.stage2d.mediators
{
	import com.burninghead.birf.utils.console.IConsole;
	import com.burninghead.birf.view.IMediator;
	import com.burninghead.birf.view.stage2d.Stage2DMediator;
	/**
	 * @author BigZoulz
	 */
	public class ConsoleMediator extends Stage2DMediator implements IMediator
	{
		private var _console:IConsole;
		
		override protected function init():void
		{
			
		}
		
		override public function registerView(value:*):void
		{
			super.registerView(value);
			
			_console = IConsole(displayObject);
		}
		
		override public function dispose():void
		{
			super.dispose();
		}
	}
}
