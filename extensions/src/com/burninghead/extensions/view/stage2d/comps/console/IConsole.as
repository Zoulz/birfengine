package com.burninghead.extensions.view.stage2d.comps.console
{
	/**
	 * @author Zoulz
	 */
	public interface IConsole
	{
		function activate():void;
		function deactivate():void;
		function print(msg:String):void;
		function get isActive():Boolean;
	}
}
